package com.team01.webapp.develop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;


@Controller
@RequestMapping("/develop")
@Log4j2
public class DevelopController {
//	@Autowired
//	private DevelopService developService;
	
	@GetMapping("/list")
	public String getDevelopList() {
//		developService.getList();
		log.info("SR개발관리 리스트 목록");
		return "develop/developlist";
	}
	
	@GetMapping("/detail")
	public String getDevelopDetail() {
		log.info("SR개발관리 상세보기");
		return "develop/developdetail";
	}
}
