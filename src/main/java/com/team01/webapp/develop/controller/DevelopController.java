package com.team01.webapp.develop.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team01.webapp.alarm.service.IAlarmService;
import com.team01.webapp.develop.service.IDevelopService;
import com.team01.webapp.model.CheckBoxArr;
import com.team01.webapp.model.DevelopDto;
import com.team01.webapp.model.DevelopFilter;
import com.team01.webapp.model.HR;
import com.team01.webapp.model.SrFile;
import com.team01.webapp.model.UpdateDevelop;
import com.team01.webapp.model.Users;
import com.team01.webapp.util.AlarmInfo;
import com.team01.webapp.util.Pager;

@Controller
@RequestMapping("/develop")
public class DevelopController {
	
	@Autowired
	private IDevelopService developService;
	
	@Autowired 
	private IAlarmService alarmService;
	
	@Autowired
	AlarmInfo alarmInfo;
	/**
	 * SR개발관리 목록 
	 * @author					정홍주
	 * @param developFilter 	SR요청에 대한 검색 조건
	 * @param model				View로 데이터 전달을 위한 Model 객체 주입
	 * @return
	 */
	@GetMapping(value="/list/{pageNo}")
	public String getDevelopList(@PathVariable int pageNo, DevelopFilter developFilter, HttpSession session, Model model) {
		
		developFilter = developService.filterList(developFilter);
		Users loginUser = developService.getLoginUserInfo((Integer) session.getAttribute("userNo"));
		
		//알림 수 및 리스트
		alarmInfo.info(session, model);
		
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("developFilter",developFilter);
		return "develop/developlist";
	}
	
	/**SR 요청에 대한 필터링 후 리스트 가져오기
	 * @author 				정홍주
	 * @param pageNo		SR개발 목록 페이지 위치
	 * @param developDto	
	 * @param model
	 * @param session
	 * @param pager
	 * @return
	 */
	@PostMapping(value="/filter/{pageNo}", produces="application/json; charset=UTF-8")
	public String getDevelopFilter(@PathVariable int pageNo, @RequestBody DevelopDto developDto, Model model, HttpSession session, Pager pager) {
		pager = developService.returnPage(pageNo, pager, developDto);
		List<DevelopDto> list = developService.getDevelopList(pager, developDto);
		model.addAttribute("develop",list);
		model.addAttribute("pager",pager);
		
		return "develop/ajaxList";
	}
	
	/**개발관리 상세보기
	 * @author 			정홍주
	 * @param pageNo	SR개발 목록 페이지 위치
	 * @param srNo		서비스에 보내줄 int타입 객체
	 * @param model		View로 데이터 전달을 위한 Model 객체 주입
	 * @return			develop/developdetail로 이동
	 */
	@GetMapping("/view/{srNo}")
	public String getDevelopDetail(@PathVariable String srNo, Model model, HttpSession session) {
		List<Users> devList = developService.getDevelopList();
		DevelopDto srDetail = developService.getDetail(srNo);
		List<HR> hrlist = developService.selectHrList(srNo);
		Users leader = developService.getLeader(srNo);
		Users loginUser = developService.getLoginUserInfo((Integer) session.getAttribute("userNo"));
	
		model.addAttribute("dlist", srDetail);
		model.addAttribute("devlist", devList);
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("hrlist",hrlist);
		model.addAttribute("leader", leader);
		//알림 수 및 리스트
		alarmInfo.info(session, model);
		
		return "develop/developdetail";
	}
	
	/**파일 다운로드
	 * @author			정홍주
	 * @param srFileNo	다운로드 받으려는 파일번호
	 * @param userAgent	브라우저의 정보
	 * @param response	View로 데이터 전달을 위한 response
	 * @throws Exception
	 */
	@GetMapping("/file/{srFileNo}")
	public void download(@PathVariable int srFileNo, @RequestHeader("User-Agent") String userAgent, HttpServletResponse response) throws Exception{
		
		SrFile srFile = developService.getSrFile(srFileNo);
		String originalName = srFile.getSrFileActlNm();
		String savedName = srFile.getSrFilePhysNm();
		String contentType = srFile.getSrFileExtnNm();
		
		// originalName이 한글이 포함되어 있을 경우, 브라우저별로 한글을 인코딩
		if(userAgent.contains("Trident") || userAgent.contains("MSIE")) {
			originalName = URLEncoder.encode(originalName, "UTF-8");
		} else {
			originalName = new String(originalName.getBytes("UTF-8"), "ISO-8859-1");
		}
		
		// 응답 헤더 설정
		response.setHeader("Content-Disposition", "attachment; filename=\"" + originalName + "\"");
		response.setContentType(contentType);
		
		// 응답 바디에 파일 데이터 싣기
		String filePath = "C:/OTI/uploadfiles/request/"+srFile.getSrNo()+"/"+ savedName;
		File file = new File(filePath);
		if(file.exists()) {
			InputStream is = new FileInputStream(file);
			OutputStream os = response.getOutputStream();
			FileCopyUtils.copy(is, os);
			os.flush();
			os.close();
			is.close();
		}
	}
	
	/**모달창에 해당 팀의 개발자들 목록 띄우기
	 * @author				정홍주
	 * @param userDpNmMap	개발계획 정보를 저장한 객체
	 * @param model			View로 데이터 전달을 위한 Model 객체 주입
	 * @return				develop/devlistView jsp 파일
	 */
	@PostMapping(value="/devlist")
	public String getDevList(@RequestBody Map<String, Object> userDpNmDateMap, Model model) {
		String userDpNm = (String)userDpNmDateMap.get("userDpNm");
		int userNo = Integer.parseInt((String)userDpNmDateMap.get("userNo"));
		
		String sDate = (String)userDpNmDateMap.get("hrStartDate");
		String eDate = (String)userDpNmDateMap.get("hrEndDate");
	
		
		List<Users> list = developService.selectDeveloperList(userDpNm, userNo, sDate, eDate);
		model.addAttribute("devlistByDp", list);
		return "develop/devlistView";
	}
	
	/**개발담당자를 고르기 위한 개발자들 목록 불러오기
	 * @author 			정홍주
	 * @param userNo	사용자PK
	 * @return			개발자 목록
	 */
	@GetMapping(value="/devLeader")
	@ResponseBody
	public List<Users> updateDevLeader(@RequestParam int userNo) {
		List<Users> user = developService.selectDevName(userNo);
		return user;
	}
	
	/**선택된 값을 인력 리스트에 띄우기
	 * @author 				김태희, 정홍주
	 * @param checkBoxArr	선택된 값을 배열로 받음
	 * @param model			View로 데이터 전달을 위한 Model 객체 주입
	 * @return				develop/selectHr jsp 반환
	 */
	@PostMapping(value="/selectNm")
	 public String getName(@RequestBody List<CheckBoxArr> checkBoxArr, Model model) {
		 List<Users> user = new ArrayList<Users>();    
		 for(int i=0; i<checkBoxArr.size(); i++) {
		      user.addAll(developService.selectDevName(checkBoxArr.get(i).getUserNo()));
		 }
	     model.addAttribute("pickName", user);  
	     
	     return "develop/selectHr";
	  }
	
	/** 인력리스트와 개발관리 저장
	 * @author 					정홍주
	 * @param updateDevelop		개발관리와 인력리스트가 담겨있는 객체
	 * @return					개발관리 목록으로 이동
	 */
	@PostMapping(value="/updateHr")
    public String insertHrList(UpdateDevelop updateDevelop, HttpSession session){
		int result = developService.updateDevelopSr(updateDevelop);
		alarmService.insertAlarm(updateDevelop.getSrNo(), session);
		
		return "redirect:/develop/list/1";
    }
	
	
	/**액셀 다운로드
	 * @author				김태희, 정홍주
	 * @param developSRArr	클라이언트가 보낸  developArr정보 저장
	 * @param response		HttpServletResponse 객체 주입
	 */
	@PostMapping(value="/list/excelDownload")
	public void excelDownload(@RequestParam List<String> developSRArr, HttpServletResponse response){
		try {
			XSSFWorkbook wb=null;
			Sheet sheet=null;
			Row row=null;
			Cell cell=null; 
			wb = new XSSFWorkbook();
			sheet = wb.createSheet("freeBoard");
	        
	        String[] HeaderList = {"SR 번호", "SR제목", "관련 시스템", "요청자", "소속", "등록일", "완료 예정일", "업무 구분",  "중요도"};
	        
	        //첫행   열 이름 표기 
	        int cellCount=0;
	        row = sheet.createRow(0);
	        for(int i=0; i<HeaderList.length; i++) {
	    		cell=row.createCell(cellCount++);
	    		cell.setCellValue(HeaderList[i]);
	        }
	        
	        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
			
			List<DevelopDto> list = developService.getPrintExcelList(developSRArr);
			
			for(int i=0; i<list.size(); i++) {
				row=sheet.createRow(i+1);
				cellCount = 0;
				cell=row.createCell(cellCount++);
				cell.setCellValue(list.get(i).getSrNo());
				cell=row.createCell(cellCount++);
				cell.setCellValue(list.get(i).getSrTtl());
				cell=row.createCell(cellCount++);
				cell.setCellValue(list.get(i).getSysNm());
				cell=row.createCell(cellCount++);
				
				cell.setCellValue(list.get(i).getUserNm());
				cell=row.createCell(cellCount++);
				cell.setCellValue(list.get(i).getUserOgdp());
				cell=row.createCell(cellCount++);
				
				String srRegDate = simpleDateFormat.format(list.get(i).getSrRegDate()); 
				cell.setCellValue(srRegDate);
				cell=row.createCell(cellCount++);
				
				String SrDdlnDate = "";
				if(list.get(i).getSrDdlnDate() == null) {
					SrDdlnDate = "등록전입니다"; 
				} else {
					SrDdlnDate = simpleDateFormat.format(list.get(i).getSrDdlnDate());
				}
				cell.setCellValue(SrDdlnDate);
				
				cell=row.createCell(cellCount++);
				cell.setCellValue(list.get(i).getSttsNm());
				
				cell=row.createCell(cellCount++);
				cell.setCellValue(list.get(i).getSrPry());
			}
			
			// 컨텐츠 타입과 파일명 지정
			response.setContentType("ms-vnd/excel");
			response.setHeader("Content-Disposition", "attachment;filename=testlist.xlsx");  //파일이름지정.
			//response OutputStream에 엑셀 작성
			wb.write(response.getOutputStream());
			wb.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
