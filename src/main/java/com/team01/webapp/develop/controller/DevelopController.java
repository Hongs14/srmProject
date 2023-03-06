package com.team01.webapp.develop.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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

import com.team01.webapp.develop.service.IDevelopService;
import com.team01.webapp.model.CheckBoxArr;
import com.team01.webapp.model.DevelopFilter;
import com.team01.webapp.model.HR;
import com.team01.webapp.model.NoticeFile;
import com.team01.webapp.model.SrFile;
import com.team01.webapp.model.UpdateDevelop;
import com.team01.webapp.model.DevelopDto;
import com.team01.webapp.model.Users;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/develop")
@Log4j2
public class DevelopController {
	
	@Autowired
	private IDevelopService developService;
	
	/**
	 * SR개발관리 목록 
	 * @author					정홍주
	 * @param developFilter 	SR요청에 대한 검색 조건
	 * @param model				View로 데이터 전달을 위한 Model 객체 주입
	 * @return
	 */
	@GetMapping(value="/list/{pageNo}")
	public String getDevelopList(@PathVariable int pageNo, DevelopFilter developFilter, Model model) {
		log.info("SR개발 목록");
		
		developFilter = developService.filterList(developFilter);
		
		model.addAttribute("developFilter",developFilter);
		return "develop/developlist";
	}
	
	
	/**
	 * SR 요청에 대한 필터링 후 리스트 가져오기
	 * @author 				정홍주, 김태희
	 * @param pageNo		SR개발 목록 페이지 위치
	 * @param examineList	SR검토 리스트
	 * @param pager			페이지 처리	
	 * @param model			View로 데이터 전달을 위한 Model 객체 주입
	 * @return
	 */
	@PostMapping(value="/filter/{pageNo}", produces="application/json; charset=UTF-8")
	public String getDevelopFilter(@PathVariable int pageNo, @RequestBody DevelopDto developDto, Model model, Pager pager) {
		log.info("필터링한 목록");
		log.info("pageNo "+pageNo);
		pager = developService.returnPage(pageNo,pager,developDto);
		log.info(pager);
		List<DevelopDto> list = developService.getDevelopList(pager, developDto);
		model.addAttribute("develop",list);
		model.addAttribute("pager",pager);

		return "develop/ajaxList";
	}
	
	/**개발관리 상세보기
	 * @author 			정홍주
	 * @param pageNo	
	 * @param srNo		서비스에 보내줄 int타입 객체
	 * @param model		View로 데이터 전달을 위한 Model 객체 주입
	 * @return			develop/developdetail로 이동
	 */
	@GetMapping("/view/{srNo}")
	public String getDevelopDetail(@PathVariable String srNo, Model model) {
		List<Users> devList = developService.getDevelopList();
		DevelopDto srDetail = developService.getDetail(srNo);
		List<HR> hrlist = developService.selectHrList(srNo);
		Users leader = developService.getLeader(srNo);
	
		model.addAttribute("dlist", srDetail);
		model.addAttribute("devlist", devList);
		log.info("devList"+devList);
		model.addAttribute("hrlist",hrlist);
		model.addAttribute("leader", leader);
		
		return "develop/developdetail";
	}
	
	@GetMapping("/file/{srFileNo}")
	public void download(@PathVariable int srFileNo, @RequestHeader("User-Agent") String userAgent, HttpServletResponse response) throws Exception{
		log.info("파일 다운로드");
		
		SrFile srFile = developService.getSrFile(srFileNo);
		
		String originalName = srFile.getSrFileActlNm();
		String savedName = srFile.getSrFilePhysNm();
		String contentType = srFile.getSrFileExtnNm();
		log.info("userAgent: "+userAgent);
		
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
		String filePath = "C:/OTI/uploadfiles/" + savedName;
			
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
	 * @param userDpNmMap	
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
		log.info("팀별 개발자 조회: " + userDpNm);
		log.info(list);
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
		log.info("개발담당자 선택");
		log.info(user);
		return user;
	}
	
	/**
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
	 
	     log.info("HR등록 인력리스트");
	     log.info(user);
	     model.addAttribute("pickName", user);  
	     
	     return "develop/selectHr";
	  }
	
	/**
	 * @author 					정홍주
	 * @param updateDevelop		
	 * @return
	 */
	@PostMapping(value="/updateHr")
    public String insertHrList(UpdateDevelop updateDevelop){
		log.info(updateDevelop);
		int result = developService.updateDevelopSr(updateDevelop);
		log.info("HR등록");
		return "redirect:/develop/list/1";
    }

}
