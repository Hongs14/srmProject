package com.team01.webapp.develop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team01.webapp.develop.service.IDevelopService;
import com.team01.webapp.model.SR;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;


@Controller
@RequestMapping("/develop")
@Log4j2
public class DevelopController {
	@Autowired
	private IDevelopService developService;
	
	@GetMapping("/list/{pageNo}")
	public String getDevelopList(@PathVariable int pageNo, Model model, Pager pager) {
		
		int totalRow = developService.totalRow();
		pager = new Pager(10, 5, totalRow, pageNo);
		List<SR> list = developService.getDevelopList(pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("developlist",list);
		log.info("SR개발관리 리스트 목록");
		log.info(pager);
		return "develop/developlist";
	}
	
	@GetMapping("/view")
	public String getDevelopDetail() {
		log.info("SR개발관리 상세보기");
		return "develop/developdetail";
	}
}
