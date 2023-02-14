package com.team01.webapp.qnaboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team01.webapp.model.QSTN;
import com.team01.webapp.qnaboard.service.IQnaboardService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/qna")
public class QnaController {
	
	@Autowired
	private IQnaboardService qnaboardService;
	
	@GetMapping("/list")
	public String getQnaList(Model model) {
		List<QSTN> list = qnaboardService.getList();
		model.addAttribute("qnalist", list);
		log.info("qna목록보기");
		return "qnaboard/qnalist";
	}
	
	@GetMapping("/detail")
	public String getQnaDetail(Model model) {
		log.info("qna상세보기");
		return "qnaboard/qnadetail";
	}
	
	@GetMapping("/write")
	public String writeQna() {
		log.info("Qna작성하기");
		return "qnaboard/qnawrite";
	}
	
	@GetMapping("/update")
	public String updateQna() {
		log.info("Qna수정하기");
		return "qnaboard/qnaupdate";
	}
	
}
