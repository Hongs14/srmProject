package com.team01.webapp.progress.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team01.webapp.model.ProgressFilter;
import com.team01.webapp.progress.service.IProgressService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ProgressController {
	
	@Autowired
	private IProgressService progressService;
	
	@RequestMapping(value="/progress/list/{pageNo}", method = RequestMethod.GET)
	public String progressList(@PathVariable int pageNo, ProgressFilter progressfilter, Model model) {
		
		progressfilter = progressService.filterList(progressfilter);
		
		model.addAttribute("progressFilter", progressfilter);
		
		return "progress/list";
	}
	
	@RequestMapping(value="/progress/detail/{srNo}", method = RequestMethod.GET)
	public String progressDetail(@PathVariable int srNo) {
		
		return "progress/detail";
	}
	
	@RequestMapping(value="progress/list/progressajax", produces="application/json; charset=UTF-8")
	public String progressAjax() {
		return "progress/progressListView";
	}
}
