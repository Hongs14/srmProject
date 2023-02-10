package com.team01.webapp.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/notice")
@Log4j2
public class NoticeController {

	@GetMapping("/list")
	public String getNoticeList() {
		log.info("실행");
		return "notice/list";
	}
}
