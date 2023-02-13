package com.team01.webapp.examine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team01.webapp.examine.service.IExamineService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/examine")
@Log4j2
public class ExamineController {

/*	@Autowired
	IExamineService examineService;*/
	
	@GetMapping(value="/list")
	public String getExamineList() {
		log.info("실행");
		return "examine/list";
	}
	
	@GetMapping(value="/detail")
	public String getExamineDetail() {
		log.info("실행");
		return "examine/detail";
	}
	
}
