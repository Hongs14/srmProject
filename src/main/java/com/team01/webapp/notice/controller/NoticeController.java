package com.team01.webapp.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team01.webapp.notice.service.INoticeService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/notice")
@Log4j2
public class NoticeController {
	
	@Autowired
	INoticeService noticeService;

	@GetMapping("/list")
	public String getNoticeList() {
		log.info("실행");
		return "notice/list";
	}
}
