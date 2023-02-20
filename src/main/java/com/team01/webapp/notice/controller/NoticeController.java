package com.team01.webapp.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.team01.webapp.model.Notice;
import com.team01.webapp.model.NoticeFile;
import com.team01.webapp.notice.service.INoticeService;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/notice")
@Log4j2
public class NoticeController {
	
	@Autowired
	INoticeService noticeService;

	/**
	 * 공지사항 리스트 가져오기
	 * @author : 황건희
	 * @param pageNo	공지사항 목록 페이지 위치
	 * @param model		View로 데이터 전달을 위한 Model 객체 주입
	 * @return
	 */
	@GetMapping("/list")
	public String getNoticeList(@RequestParam(defaultValue="1") int pageNo, Model model) {
		log.info("실행");
		int totalRows = noticeService.getTotalRows();
		Pager pager = new Pager(5,5, totalRows, pageNo);
		
		List<Notice> noticeList = noticeService.getNoticeList(pager);
		
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("pager",pager);
		
		return "notice/list";
	}
	

	/**
	 * 공지사항 작성
	 * @author : 황건희
	 * @param notice		공지사항 작성 내용
	 * @param noticeFile	공지사항 첨부파일
	 * @return
	 * @throws IOException
	 */

	@GetMapping("/write")
	public String getNoticeWrite() {
		log.info("실행");
		return "notice/write";
	}
	
	@PostMapping("/write")
	public String getNoticeWrite(Notice notice, NoticeFile noticeFile) throws IOException  {
		log.info("실행");

		noticeService.noticeWrite(notice);
		
		//첨부 파일 유무 조사
		MultipartFile mf = noticeFile.getNtcMFile();
		if(mf!=null &&!mf.isEmpty()) {
			//파일 원래 이름 저장
			noticeFile.setNtcFileActlNm(mf.getOriginalFilename());
			//파일의 저장 이름 설정
			String ntcFilePhysNm = new Date().getTime()+"-"+mf.getOriginalFilename();
			noticeFile.setNtcFilePhysNm(ntcFilePhysNm);
			//파일 타입 설정
			String str = mf.getContentType();
			int beginIndex = str.indexOf("/");
			int endIndex = str.length();
			String type = str.substring(beginIndex,endIndex);
			noticeFile.setNtcFileExtnNm(type);
			noticeFile.setNtcNo(notice.getNtcNo());		
			
			if((noticeFile.getNtcNo()) == notice.getNtcNo()) {
				noticeService.noticeFileUpload(noticeFile);			
			}			
			//서버 파일 시스템에 파일로 저장
			File file = new File("C:/Temp/uploadfiles/"+ntcFilePhysNm);
			mf.transferTo(file);
		}
		
		
		
		return "redirect:/notice/list";
	}
	
	
	/**
	 * 공지사항 상세조회
	 * @author : 황건희
	 * @param ntcNo		조회하려는 공지사항 No.
	 * @param model		View로 데이터 전달을 위한 Model 객체 주입
	 * @return
	 */
	@GetMapping("/detail")
	public String getNoticeDetail(int ntcNo, Model model) {
		log.info("실행");
		
		Notice notice = noticeService.noticeDetail(ntcNo);
		
		model.addAttribute("notice",notice);
		
		//조회수 카운트
		noticeService.inqCnt(ntcNo);

		
		return "notice/detail";
	}
	

	/**
	 * 공지사항 수정
	 * @author : 황건희
	 * @param ntcNo		수정하려는 공지사항No.
	 * @param model		View로 데이터 전달을 위한 Model 객체 주입
	 * @return
	 */
	@GetMapping("/update")
	public String noticeUpdate(int ntcNo, Model model) {
		log.info("실행");
		Notice notice = noticeService.noticeDetail(ntcNo);
		
		model.addAttribute("notice",notice);
		
		return "notice/update";
	}
	
	/**
	 * 공지사항 수정
	 * @author : 황건희
	 * @param notice	수정한 공지사항 내용	
	 * @return
	 * @throws IOException
	 */
	@PostMapping("/update")
	public String noticeUpdate(Notice notice) throws IOException {
		log.info("실행");
		
		//첨부 파일 유무 조사
		MultipartFile mf = notice.getNtcMFile();
		if(mf!=null &&!mf.isEmpty()) {
			//파일 원래 이름 저장
			notice.setNtcFileActlNm(mf.getOriginalFilename());
			//파일의 저장 이름 설정
			String ntcFilePhysNm = new Date().getTime()+"-"+mf.getOriginalFilename();
			notice.setNtcFilePhysNm(ntcFilePhysNm);
			//파일 타입 설정
			String str = mf.getContentType();
			int beginIndex = str.indexOf("/");
			int endIndex = str.length();
			String type = str.substring(beginIndex,endIndex);
			notice.setNtcFileExtnNm(type);
			notice.setNtcNo(notice.getNtcNo());		
			
			NoticeFile noticeFile = new NoticeFile();
			noticeFile.setNtcFileActlNm(notice.getNtcFileActlNm());
			noticeFile.setNtcFilePhysNm(notice.getNtcFilePhysNm());
			noticeFile.setNtcFileExtnNm(notice.getNtcFileExtnNm());
			noticeFile.setNtcNo(notice.getNtcNo());
			
			noticeService.noticeUpdate(notice,noticeFile);
			
		}else {			
			noticeService.noticeUpdate(notice);
		}
		
		
		return "redirect:/notice/list";
	}
	
	
	/**
	 * 공지사항 삭제
	 * @author : 황건희
	 * @param ntcNo		삭제하려는 공지사항 No
	 * @return
	 */
	@PostMapping("/delete")
	public String noticeDelete(int ntcNo) {
		log.info("실행");
		noticeService.noticeDelete(ntcNo);
		
		return "redirect:/notice/list";
	}
	

	/**
	 * 공지사항 첨부파일 다운로드
	 * @author : 황건희
	 * @param ntcNo			첨부파일을 받으려는 공지사항 No
	 * @param userAgent		사용자가 이용하는 브라우저 타입
	 * @param response		응답 정보를 전송
	 * @throws Exception	예외 발생
	 */
	@GetMapping("/fileDownload")
	public void download(int ntcNo,@RequestHeader("User-Agent") String userAgent, HttpServletResponse response) throws Exception{
		log.info("실행");
		
		Notice notice = noticeService.noticeDetail(ntcNo);
		
		String originalName = notice.getNtcFileActlNm();
		String savedName = notice.getNtcFilePhysNm();
		String contentType = notice.getNtcFileExtnNm();
		log.info(userAgent);
		
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
		String filePath = "C:/Temp/uploadfiles/"+savedName;
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
	
}
