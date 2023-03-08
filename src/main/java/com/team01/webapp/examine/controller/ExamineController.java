package com.team01.webapp.examine.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;

import com.team01.webapp.alarm.service.IAlarmService;
import com.team01.webapp.examine.service.IExamineService;
import com.team01.webapp.model.Examine;
import com.team01.webapp.model.ExamineFilter;
import com.team01.webapp.model.ExamineList;
import com.team01.webapp.model.SrFile;
import com.team01.webapp.model.Users;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;


@Controller
@RequestMapping("/examine")
@Log4j2
public class ExamineController {

	@Autowired
	IExamineService examineService;
	
	@Autowired
	IAlarmService alarmService;
	
	
	/**
	 * SR요청에 대한 필터링 
	 * @author : 황건희
	 * @param examineFilter SR요청에 대한 검색 조건
	 * @param model	View로 데이터 전달을 위한 Model 객체 주입
	 * @return
	 */
	@GetMapping(value="/list")
	public String getExamineList(ExamineFilter examineFilter , HttpSession session,Model model) {
		log.info("실행");
		
		examineFilter = examineService.filterList(examineFilter);
		
		int userNo = (Integer) session.getAttribute("userNo");
		
		//로그인 유저 정보 가져오기
		Users loginUser = examineService.selectLoginUser(userNo);
		model.addAttribute("loginUser",loginUser);
		//알림 수
		log.info("유저No : "+userNo);
		int alarmCnt = alarmService.selectAlarmCount(userNo);
		model.addAttribute("alarmCnt",alarmCnt);
		model.addAttribute("examineFilter",examineFilter);
		
		return "examine/list";
	}
	
	
	/**
	 * SR 요청에 대한 필터링 후 리스트 가져오기
	 * @author : 황건희
	 * @param pageNo		SR검토 목록 페이지 위치
	 * @param examineList	SR검토 리스트
	 * @param pager			페이지 처리	
	 * @param model			View로 데이터 전달을 위한 Model 객체 주입
	 * @return
	 */
	@PostMapping(value="/filter/{pageNo}", produces="application/json; charset=UTF-8")
	public String getExamineFilter(@PathVariable int pageNo,@RequestBody ExamineList examineList, Model model, Pager pager) {
		log.info("실행");
		log.info("pageNo"+pageNo);
		pager = examineService.returnPage(pageNo,pager,examineList);
		
		List<Examine> list = examineService.getExamineList(pager, examineList);
		
		model.addAttribute("examine",list);
		model.addAttribute("pager",pager);

		return "examine/ajaxList";
	}
	
	/**
	 * SR 검토 상세 조회
	 * @author : 황건희
	 * @param examineFilter 필터링 후 SR 검토 리스트 가져오기
	 * @param model
	 * @return
	 */
	@GetMapping(value="/detail/{srNo}")
	public String getExamineDetail(@PathVariable String srNo, HttpSession session, Model model) {
		log.info("실행");
		
		//로그인 유저 정보 가져오기
		int userNo = (Integer) session.getAttribute("userNo");
		Users loginUser = examineService.selectLoginUser(userNo);
		model.addAttribute("loginUser",loginUser);
		
		Examine examine = examineService.getExamine(srNo);
		List<MultipartFile> examineFileList = examineService.selectExamineFileList(srNo);
		model.addAttribute("examine",examine);
		model.addAttribute("examineFileList",examineFileList);
		
		
		return "examine/detailView";
	}
	
	/**
	 * SR 검토 상태 변경
	 * @author : 황건희
	 * @param examine	detailView.jsp에서 요청 검토 처리
	 * @return
	 */
	@PostMapping(value="/detail", produces="application/json; charset=UTF-8")
	public String updateExamine(@RequestBody Examine examine,HttpSession session) {
		log.info("실행");
		log.info(examine);
		
		examineService.updateExamine(examine);
		
		String srNo = examine.getSrNo();
		
		alarmService.insertAlarm(srNo,session);
		
		return "redirect:/examine/detail/"+srNo;
	}
	
	@GetMapping("/fileDownload")
	public void download(int srFileNo,@RequestHeader("User-Agent") String userAgent, HttpServletResponse response) throws Exception{
		log.info("실행");
		
		SrFile srFile = examineService.selectFileDownload(srFileNo);
		
		String originalName = srFile.getSrFileActlNm();
		String savedName = srFile.getSrFilePhysNm();
		String contentType = srFile.getSrFileExtnNm();
		log.info("userAgent: "+userAgent);
		
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
		String filePath = "C:/OTI/uploadfiles/request/"+srFile.getSrNo()+"/"+savedName;
		File file = new File(filePath);
		log.info("file: "+ file);
				
		if(file.exists()) {
			InputStream is = new FileInputStream(file);
			OutputStream os = response.getOutputStream();
			FileCopyUtils.copy(is, os);
			os.flush();
			os.close();
			is.close();
		}
	}
	
	//일괄 처리(검토중) or 일괄처리(접수)
	@PostMapping(value="/processing")
	public String updateExamineProcessing(@RequestBody ExamineList examineList,Model model, Pager pager) {
		log.info("실행");

		examineService.updateExamineProcessing(examineList);
		
		pager = examineService.returnPage(1,pager,examineList);
		
		List<Examine> list = examineService.getExamineList(pager, examineList);
		
		model.addAttribute("examine",list);
		model.addAttribute("pager",pager);
		
		return "examine/ajaxList";
	}
	
}
