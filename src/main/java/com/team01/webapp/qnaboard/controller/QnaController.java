package com.team01.webapp.qnaboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team01.webapp.qnaboard.service.QnaboardService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/qna")
@Log4j2
public class QnaController {
	
	@Autowired
	private QnaboardService qnaboardService;
	
	@GetMapping("/list")
	public String getList() {
		qnaboardService.getList();
		
		log.info("qna목록보기");
		return "qnaboard/qnalist";
	}
	
	
}
