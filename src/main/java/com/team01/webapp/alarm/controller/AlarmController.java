package com.team01.webapp.alarm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/alarm")
@Log4j2
public class AlarmController {
	
	@GetMapping("list")
	public String alarmList() {
		log.info("실행");
		
		return "alarm/list";
	}
	
}
