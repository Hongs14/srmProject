package com.team01.webapp.progress.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team01.webapp.progress.service.IProgressService;

@Controller
public class ProgressController {
	
	@Autowired
	private IProgressService progressService;
	
	@RequestMapping(value="/progress/list/{pageNo}", method = RequestMethod.GET)
	public String progressList(@PathVariable int pageNo) {
		
		progressService.taskList();
		
		return "progress/list";
	}
}
