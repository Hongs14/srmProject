package com.team01.webapp.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	
	@GetMapping("/write")
	public String getNoticeWrite() {
		log.info("실행");
		return "notice/write";
	}
	
	@PostMapping("/write")
	public String getNoticeWrite(Notice notice) throws IOException  {
		log.info("실행");
		System.out.println(notice.toString());
		
		//첨부 파일 유무 조사
		/*MultipartFile mf = noticeFile.getNtcMFile();
		if(!mf.isEmpty()) {
			//파일 원래 이름 저장
			noticeFile.setNtcFileActlNm(mf.getOriginalFilename());
			//파일의 저장 이름 설정
			String noticeFilename = new Date().getTime()+"-"+mf.getOriginalFilename();
			noticeFile.setNtcFilePhysNm(noticeFilename);
			//파일 타입 설정
			noticeFile.setNtcFileExtnNm(mf.getContentType());
			//서버 파일 시스템에 파일로 저장
			File file = new File("C:/Temp/uploadfiles/"+noticeFilename);
			mf.transferTo(file);
		}*/
		
		
		noticeService.noticeWrite(notice);
		
		return "redirect:/notice/list";
	}
	
	@GetMapping("/detail")
	public String getNoticeDetail() {
		log.info("실행");
		return "notice/detail";
	}
	
}
