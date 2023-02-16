package com.team01.webapp.examine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team01.webapp.examine.service.IExamineService;
import com.team01.webapp.model.Examine;
import com.team01.webapp.model.ExamineFilter;
import com.team01.webapp.model.ExamineList;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/examine")
@Log4j2
public class ExamineController {

	@Autowired
	IExamineService examineService;
	
	@GetMapping(value="/list")
	public String getExamineList(ExamineFilter examineFilter , Model model) {
		log.info("실행");
		
		examineFilter = examineService.filterList(examineFilter);
		model.addAttribute("examineFilter",examineFilter);
		return "examine/list";
	}
	
	@GetMapping(value="/filter")
	@ResponseBody
	public List<Examine> getExamineFilter(@RequestParam(defaultValue="1")int pageNo,@RequestParam(defaultValue="1") int sttsNo) {
		log.info("실행");
		int totalRows = examineService.getTotalRows();
		Pager pager = new Pager(5,5, totalRows, pageNo);
		List<Examine> examineList = examineService.getExamineList(pager,sttsNo);
		log.info(examineList);
		
		return examineList;
	}
	
	@PostMapping(value="/filter", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getExamineFilter(int pageNo,@RequestParam(defaultValue="1") int sttsNo, Model model) {
		log.info("실행");
		return "examine/ajaxList";
	}
	
	@GetMapping(value="/detail")
	public String getExamineDetail() {
		log.info("실행");
		return "examine/detail";
	}
	
}
