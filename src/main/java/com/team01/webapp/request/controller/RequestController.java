package com.team01.webapp.request.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.team01.webapp.alarm.service.IAlarmService;
import com.team01.webapp.model.Request;
import com.team01.webapp.model.RequestAjax;
import com.team01.webapp.model.RequestFilter;
import com.team01.webapp.model.RequestList;
import com.team01.webapp.model.SR;
import com.team01.webapp.model.SrFile;
import com.team01.webapp.request.service.IRequestService;
import com.team01.webapp.util.AlarmInfo;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/request")
@Log4j2
public class RequestController {
	
	@Autowired
	IRequestService requestService;
	
	@Autowired
	IAlarmService alarmService;
	
	@Autowired
	AlarmInfo alarmInfo;
	
	/**
	 * 모든 SR리스트 조회
	 * 
	 * @author				김희률
	 * @param session		HttpSession 객체 주입
	 * @param model			View로 데이터 전달을 위한 Model 객체 주입
	 * @param requestFilter	검색을 위한 필터 불러오기
	 * @return				list뷰로 이동
	 */
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String getRequestFilter(HttpSession session, RequestFilter requestFilter, Model model) {
		requestFilter = requestService.getFilterList(requestFilter);
		model.addAttribute("requestfilter", requestFilter);
		model.addAttribute("command", "list");
		
		//알림 수 및 리스트
		alarmInfo.info(session, model); 
		
		return "request/list";
		
	}
	
	/**
	 * 메인페이지에서 상세페이지 바로 이동
	 * 
	 * @author	김희률
	 * @param srNo			상세정보를 볼 srNo
	 * @param session		알림 사용을 위한 session
	 * @param requestFilter	필터링 기능
	 * @param model			View로 데이터 전달을 위한 Model 객체 주입
	 * @return				뷰로 이동
	 */
	@RequestMapping(value="/list/{srNo}", method = RequestMethod.GET)
	public String getDetailList(@PathVariable String srNo, HttpSession session, RequestFilter requestFilter, Model model) {
		requestFilter = requestService.getFilterList(requestFilter);
		
		//알림 수 및 리스트
		alarmInfo.info(session, model); 
		
		model.addAttribute("requestfilter", requestFilter);
		model.addAttribute("srNo", srNo);
		model.addAttribute("command", "detail");
		return "request/list";
		
	}
	
	/**
	 * 필터링한 리스트 조회
	 * 
	 * @author				김희률
	 * @param pageNo		페이지정보를 저장
	 * @param requestAjax	필터링에 필요한 정보를 저장
	 * @param model			View로 데이터 전달을 위한 Model 객체 주입
	 * @param pager			paging처리를 위한 pager객체 주입
	 * @return 필터링한 리스트 뷰
	 */
	@PostMapping(value="/filter/{pageNo}")
	public String getFilteredList(@PathVariable String pageNo, @RequestBody RequestAjax requestAjax, Model model, Pager pager) {
		pager = requestService.returnPage(pageNo, pager, requestAjax);
		List<RequestList> list = requestService.getRequestList(pager, requestAjax);
		
		model.addAttribute("requestLists",list);
		model.addAttribute("pager",pager);
		
		return "request/ajaxList";
	}
	
	
	/**
	 * SR요청 작성 폼으로 이동
	 * 
	 * @author					김희률
	 * @param session						
	 * @param requestFilter		필터 유지하기
	 * @param model				View로 데이터 전달을 위한 Model 객체 주입
	 * @param pager				paging처리를 위한 pager객체 주입
	 * @return					작성 폼으로 이동
	 */
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public String writeRequest(RequestFilter requestFilter,  Model model, Pager pager) {
		requestFilter = requestService.getFilterList(requestFilter);
		model.addAttribute("requestfilter", requestFilter);
		model.addAttribute("pager", pager);
		model.addAttribute("command","write");
		return "request/writeForm";
	}
	
	/**
	 * SR 상세 조회
	 * 
	 * @author	김희률
	 * @param srNo			상세 조회할 srNo
	 * @param requestFilter	필터 유지하기
	 * @param session		세션에서
	 * @param model			View로 데이터 전달을 위한 Model 객체 주입
	 * @param pager			paging처리를 위한 pager객체 주입
	 * @return				상세 조회 뷰
	 */
	@RequestMapping(value="/detail/{srNo}", method = RequestMethod.GET)
	public String getDetail(@PathVariable String srNo, Model model, Pager pager) {
		Request request = requestService.getRequestDetail(srNo);
		List<MultipartFile> srFile = requestService.selectRequestFileDetail(srNo);
		model.addAttribute("sr", request);
		model.addAttribute("srFile", srFile);
		return "request/ajaxDetail";
		
	}
	
	
	/**
	 * 파일 다운로드
	 * 
	 * @author	김희률
	 * @param requestFileNo	다운로드할 파일 넘버
	 * @param srNo			
	 * @param userAgent		user의 브라우저 정보
	 * @param response		View로 데이터 전달을 위한 response
	 * @throws Exception
	 */
	@RequestMapping(value="/fileDownload", method = RequestMethod.GET)
	public void downloadRequestFile(String requestFileNo,String srNo, @RequestHeader("User-Agent") String userAgent, HttpServletResponse response) throws Exception {
		
			SrFile srFile = requestService.selectFileDownload(requestFileNo);
			
			String originalName = srFile.getSrFileActlNm();
			String savedName = srFile.getSrFilePhysNm();
			String contentType = srFile.getSrFileExtnNm();
			
			//originalName이 한글이 포함되어 있을 경우, 브라우저별로 한글을 인코딩하는 방법
			if(userAgent.contains("Trident")|| userAgent.contains("MSIE")) {
				//Trident: IE 11
				//MSIE: IE 10 이하
				originalName = URLEncoder.encode(originalName,"UTF-8");
			}else {
				//Edge, Chrome, Safari
				originalName = new String(originalName.getBytes("UTF-8"),"ISO-8859-1");
			}
			
			//응답 헤더 설정
			response.setHeader("Content-Disposition", "attachmemnt; filename=\""+originalName+"\"");
			response.setContentType(contentType);
			
			//응답 바디에 파일 데이터 실기
			String filePath = "C:/OTI/uploadfiles/request/"+srNo+"/"+savedName;
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
	
	
	/**
	 * SR 요청 작성
	 * 
	 * @author			김희률
	 * @param sr		요청 정보를 담은 sr객체 주입
	 * @param session	HttpSession 객체 주입
	 * @param model		View로 데이터 전달을 위한 Model 객체 주입
	 * @return			작성한 내용의 상세 뷰로 이동
	 */
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String writeRequest(SR sr, SrFile srFile, HttpSession session, Model model) {
		int rows =0;
		String srNo = "";
		try {
			String content = sr.getSrCn();
			content = content.replace("\r\n", "<br>");
			content = content.replace("\r", "<br>");
			content = content.replace("\n", "<br>");
			sr.setSrTtl(Jsoup.clean(sr.getSrTtl(), Whitelist.basic()));
			sr.setSrCn(Jsoup.clean(content, Whitelist.basic()));
			if(sr.getSrStd() != null) {
				sr.setSrStd(Jsoup.clean(sr.getSrStd(), Whitelist.basic()));
			}
			int userNo = (int) session.getAttribute("userNo");
			sr.setSrCustNo(userNo); 
			sr.setSysNo(requestService.getSysNo(userNo));
			sr.setSttsNo(1);
			srNo = requestService.writeRequest(sr);
			
			//알람 DB에 저장
			alarmService.insertAlarm(srNo,session);
			
			//첨부 파일 유무 조사
			List<MultipartFile> mf = sr.getRequestMFile();
			if(mf!=null &&!mf.isEmpty()) {
				for(int i=0; i<mf.size(); i++) {		
					
					//파일 원래 이름 저장
					srFile.setSrFileActlNm(mf.get(i).getOriginalFilename());
					//파일의 저장 이름 설정
					String srFilePhysNm = new Date().getTime()+"-"+mf.get(i).getOriginalFilename();
					srFile.setSrFilePhysNm(srFilePhysNm);
					//파일 타입 설정
					String str = mf.get(i).getContentType();
					int beginIndex = str.indexOf("/");
					int endIndex = str.length();
					String type = str.substring(beginIndex,endIndex);
					srFile.setSrFileExtnNm(type);
					srFile.setSrNo(srNo);

					//서버 파일 시스템에 파일로 저장
					String filePath = "C:/OTI/uploadfiles/request/"+srNo+"/"+srFilePhysNm;
					File file = new File(filePath);
					// 폴더가 없다면 생성한다
					if(!file.exists()) {
						try {
							Files.createDirectories(Paths.get(filePath));
							mf.get(i).transferTo(file);
						} catch (Exception e) {
							log.info("생성 실패 : " + filePath);
						}
					} else {
						mf.get(i).transferTo(file);
					}
					requestService.requestFileUpload(srFile);
				}
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/request/detail/"+srNo;
	}
	
	/**
	 * SR 요청 수정 뷰로 이동
	 * 
	 * @author	김희률
	 * @param srNo		수정할 srNo
	 * @param model		View로 데이터 전달을 위한 Model 객체 주입
	 * @return			SR 요청 수정 뷰로 이동
	 */
	@RequestMapping(value="/update/{srNo}", method = RequestMethod.GET)
	public String updateRequest(@PathVariable String srNo, Model model) {
		Request sr = requestService.getRequestDetail(srNo);
		List<MultipartFile> srFile = requestService.selectRequestFileDetail(srNo);
		model.addAttribute("command","update");
		model.addAttribute("sr", sr);
		model.addAttribute("srFile", srFile);
		return "request/writeForm";
	}
	
	/**
	 * SR 요청 정보 수정
	 * @author	김희률
	 * @param sr		요청 정보를 담은 sr객체 주입
	 * @param srFile	sr중에서 삭제되지 않은 첨부파일 정보를 담아서 DB에 저장하기 위해 srFile 객체 주입
	 * @param session	HttpSession 객체 주입
	 * @return			수정된 요청의 상세페이지로 리다이렉트
	 */
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String updateRequest(SR sr, SrFile srFile, HttpSession session) {
		int rows =0;
		try {
			sr.setSrTtl(Jsoup.clean(sr.getSrTtl(), Whitelist.basic()));
			String srNo = sr.getSrNo();
			String content = sr.getSrCn();
			content = content.replace("\r\n", "<br>");
			content = content.replace("\r", "<br>");
			content = content.replace("\n", "<br>");
			sr.setSrCn(Jsoup.clean(content, Whitelist.basic()));
			int userNo = (int) session.getAttribute("userNo");
			sr.setSrCustNo(userNo); 
			sr.setSysNo(requestService.getSysNo(userNo));
			sr.setSttsNo(1);
			rows = requestService.updateRequest(sr);
			
			//기존 파일을 삭제했다면 삭제처리
			List<String> df = sr.getDeleteFile();
			if(df!=null && !df.isEmpty()) {
				for(int j=0; j<df.size(); j++) {
					String filePath = "C:/OTI/uploadfiles/request/" + sr.getSrNo() + "/" + df.get(j);
					File file = new File(filePath);
					if(file.exists()) {
						if(file.delete()) {
							requestService.deleteExistingFile(df.get(j));
						} else {
							log.info("파일 삭제 실패");
						}
					}
				}
			}
			//첨부 파일 유무 조사
			List<MultipartFile> mf = sr.getRequestMFile();
			if(mf!=null &&!mf.isEmpty()) {
				for(int i=0; i<mf.size(); i++) {		
					
					//파일 원래 이름 저장
					srFile.setSrFileActlNm(mf.get(i).getOriginalFilename());
					//파일의 저장 이름 설정
					String srFilePhysNm = new Date().getTime()+"-"+mf.get(i).getOriginalFilename();
					srFile.setSrFilePhysNm(srFilePhysNm);
					//파일 타입 설정
					String str = mf.get(i).getContentType();
					int beginIndex = str.indexOf("/");
					int endIndex = str.length();
					String type = str.substring(beginIndex,endIndex);
					srFile.setSrFileExtnNm(type);
					srFile.setSrNo(srNo);

					//서버 파일 시스템에 파일로 저장
					String filePath = "C:/OTI/uploadfiles/request/"+srNo+"/"+srFilePhysNm;
					File file = new File(filePath);
					// 폴더가 없다면 생성한다
					if(!file.exists()) {
						try {
							Files.createDirectories(Paths.get(filePath));
							mf.get(i).transferTo(file);
						} catch (Exception e) {
							log.info("생성 실패 : " + filePath);
						}
					} else {
						mf.get(i).transferTo(file);
					}
					requestService.requestFileUpload(srFile);
				}
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		String srNo = sr.getSrNo();
		return "redirect:/request/detail/"+srNo;
	}
	
	/**
	 * 요청 삭제
	 * 
	 * @author	김희률
	 * @param srNo	삭제할 srNo
	 * @param model 결과를 담기 위해 model객체 주입
	 * @return		SR요청 리스트로 리다이렉트
	 */
	@RequestMapping(value="/delete/{srNo}", method = RequestMethod.GET)
	public String deleteRequest(@PathVariable String srNo, Model model) {
		int rows = requestService.deleteRequest(srNo);
		if(rows == 1) {
			model.addAttribute("result", "success");
			return "redirect:/request/list";
		}
		model.addAttribute("result", "false");
		return "redirect:/request/list";
		
	}
	
	/**
	 * 엑셀 다운로드
	 * 
	 * @author				김태희
	 * @param progressArr	클라이언트가 보낸 progressArr 정보 저장
	 * @param response		HttpServletResponse 객체 주입
	 * @throws IOException
	 */
	@RequestMapping(value="/excelDownload", method=RequestMethod.POST)
	public void excelDownload(@RequestParam List<String> requestArr, HttpServletResponse response) throws IOException {
		XSSFWorkbook wb=null;
		Sheet sheet=null;
		Row row=null;
		Cell cell=null; 
		wb = new XSSFWorkbook();
		sheet = wb.createSheet("freeBoard");
		
		String[] HeaderList = {"SR번호", "제목", "관련시스템", "등록자", "소속회사", "개발부서", "상태", "등록일", "중요"};
		
        //첫행   열 이름 표기 
        int cellCount=0;
        row = sheet.createRow(0);
        for(int i=0; i<HeaderList.length; i++) {
    		cell=row.createCell(cellCount++);
    		cell.setCellValue(HeaderList[i]);
        }
        
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
		
        List<RequestList> list = requestService.getRequestExcelList(requestArr);
        
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
			cell.setCellValue(list.get(i).getSrDevDp());
			cell=row.createCell(cellCount++);
			cell.setCellValue(list.get(i).getSttsNm());
			cell=row.createCell(cellCount++);
			String SrRegDate = simpleDateFormat.format(list.get(i).getSrRegDate()); 
			cell.setCellValue(SrRegDate);
			cell=row.createCell(cellCount++);
			cell.setCellValue(list.get(i).getSrPry());
		}
		
		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=srRequest.xlsx");  //파일이름지정.
		//response OutputStream에 엑셀 작성
		wb.write(response.getOutputStream());
		wb.close();
		
	}
}
