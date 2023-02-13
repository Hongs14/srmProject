package com.team01.webapp.notice.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team01.webapp.model.Notice;
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
		
		List<Notice> noticeList = noticeService.getNoticeList(pageNo);
		
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("pager",pager);
		
		return "notice/list";
	}
	
	
	@GetMapping("/write")
	public String getNoticeWrite() {
		log.info("실행");
		return "notice/write";
	}
	
	@GetMapping("/detail")
	public String getNoticeDetail() {
		log.info("실행");
		return "notice/detail";
	}
	
}
