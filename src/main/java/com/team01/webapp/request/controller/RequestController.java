package com.team01.webapp.request.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public String getRequestFilter( HttpSession session, RequestFilter requestFilter, Model model) {
		log.info("실행");
		requestFilter = requestService.getFilterList(requestFilter);
		model.addAttribute("requestfilter", requestFilter);
		model.addAttribute("command", "list");
		
		//알림 수
		/*int userNo = (Integer) session.getAttribute("userNo");
		Alarm alarm = new Alarm();
		alarm.setUserNo(userNo);
		alarm.setUserType((String)session.getAttribute("userType"));
		if(alarm.getUserType().equals("관리자")) {
			Users loginUser = alarmService.selectLoginUser(userNo);
			alarm.setSysNo("%"+loginUser.getSysNo()+"%");
		}else {			
			alarm.setSysNo("%"+(String)session.getAttribute("sysNo")+"%");
		}
		//알림 리스트
		List<Alarm> alarmList = alarmService.selectAlarmList(alarm);
		int alarmCnt = alarmService.selectAlarmCount(alarm);
		model.addAttribute("alarmCnt",alarmCnt);
		model.addAttribute("alarmList",alarmList);*/
		alarmInfo.info(session, model); 
		
		return "request/list";
		
	}
	
	@RequestMapping(value="/list/{srNo}", method = RequestMethod.GET)
	public String getDetailList(@PathVariable String srNo, HttpSession session, RequestFilter requestFilter, Model model) {
		log.info("실행");
		requestFilter = requestService.getFilterList(requestFilter);
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
	 * @param pager			paging처리를 위한 
	 * @return
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
	 * @author					김희률
	 * @param session			
	 * @param requestFilter		필터 유지하기
	 * @param model
	 * @param pager
	 * @return
	 */
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public String writeRequest(HttpSession session, RequestFilter requestFilter,  Model model, Pager pager) {
		log.info("정보 로그 실행");
		requestFilter = requestService.getFilterList(requestFilter);
		model.addAttribute("requestfilter", requestFilter);
		model.addAttribute("pager", pager);
		model.addAttribute("command","write");
		return "request/writeForm";
	}
	
	/**
	 * SR 상세 확인 하기
	 * 
	 * @author	김희률
	 * @param srNo
	 * @param requestFilter
	 * @param session
	 * @param model
	 * @param pager
	 * @return
	 */
	@RequestMapping(value="/detail/{srNo}", method = RequestMethod.GET)
	public String getDetail(@PathVariable String srNo, HttpSession session, Model model, Pager pager) {
		log.info("실행"+srNo);
		Request request = requestService.getRequestDetail(srNo);
		List<MultipartFile> srFile = requestService.selectRequestFileDetail(srNo);
		model.addAttribute("sr", request);
		model.addAttribute("srFile", srFile);
		log.info("request: "+request+" srFile: "+srFile);
		return "request/ajaxDetail";
		
	}
	
	
	@RequestMapping(value="/fileDownload", method = RequestMethod.GET)
	public void downloadRequestFile(String requestFileNo,String srNo, @RequestHeader("User-Agent") String userAgent, HttpServletResponse response) throws Exception {
		log.info("실행"+ "fileNo: "+requestFileNo);
		
			SrFile srFile = requestService.selectFileDownload(requestFileNo);
			
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
			String filePath = "C:/OTI/uploadfiles/request/"+srNo+"/"+savedName;
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
	
	
	/**
	 * SR 요청 작성
	 * 
	 * @author			김희률
	 * @param sr		요청 정보를 담은 sr객체 주입
	 * @param session	HttpSession 객체 주입
	 * @param model		View로 데이터 전달을 위한 Model 객체 주입
	 * @return
	 */
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String writeRequest(SR sr, SrFile srFile, HttpSession session, Model model) {
		int rows =0;
		String srNo = "";
		try {
			log.info("sr: "+sr);
			sr.setSrTtl(Jsoup.clean(sr.getSrTtl(), Whitelist.basic()));
			String content = sr.getSrCn();
			content = content.replace("\r\n", "<br>");
			content = content.replace("\r", "<br>");
			content = content.replace("\n", "<br>");
			sr.setSrCn(Jsoup.clean(content, Whitelist.basic()));
			int userNo = (int) session.getAttribute("userNo");
			log.info("loginUser:"+ userNo);
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
							log.info("폴더 생성 완료");
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
		log.info("변경 행수 : "+ rows);
		return "redirect:/request/detail/"+srNo;
	}
	
	@RequestMapping(value="/update/{srNo}", method = RequestMethod.GET)
	public String updateRequest(@PathVariable String srNo, HttpSession session, Model model) {
		log.info("실행");
		Request sr = requestService.getRequestDetail(srNo);
		List<MultipartFile> srFile = requestService.selectRequestFileDetail(srNo);
		model.addAttribute("command","update");
		model.addAttribute("sr", sr);
		model.addAttribute("srFile", srFile);
		return "request/writeForm";
	}
	
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String updateRequest(SR sr, SrFile srFile, HttpSession session, Model model) {
		int rows =0;
		try {
			log.info("sr: "+sr);
			sr.setSrTtl(Jsoup.clean(sr.getSrTtl(), Whitelist.basic()));
			String srNo = sr.getSrNo();
			String content = sr.getSrCn();
			content = content.replace("\r\n", "<br>");
			content = content.replace("\r", "<br>");
			content = content.replace("\n", "<br>");
			sr.setSrCn(Jsoup.clean(content, Whitelist.basic()));
			int userNo = (int) session.getAttribute("userNo");
			log.info("loginUser:"+ userNo);
			sr.setSrCustNo(userNo); 
			sr.setSysNo(requestService.getSysNo(userNo));
			sr.setSttsNo(1);
			rows = requestService.updateRequest(sr);
			
			//기존 파일을 삭제했다면 삭제처리
			List<String> df = sr.getDeleteFile();
			log.info("DeleteFile: "+df);
			if(df!=null && !df.isEmpty()) {
				for(int j=0; j<df.size(); j++) {
					String filePath = "C:/OTI/uploadfiles/request/" + sr.getSrNo() + "/" + df.get(j);
					File file = new File(filePath);
					log.info("filePath"+filePath);
					if(file.exists()) {
						if(file.delete()) {
							log.info("파일 삭제 성공");
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
							log.info("폴더 생성 완료");
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
		log.info("변경 행수 : "+ rows);
		String srNo = sr.getSrNo();
		return "redirect:/request/detail/"+srNo;
	}
	
	@RequestMapping(value="/delete/{srNo}", method = RequestMethod.GET)
	public String deleteRequest(@PathVariable String srNo, Model model) {
		log.info("실행");
		int rows = requestService.deleteRequest(srNo);
		return "redirect:/request/list";
	}

}
