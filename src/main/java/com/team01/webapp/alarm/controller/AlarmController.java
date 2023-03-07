package com.team01.webapp.alarm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.team01.webapp.alarm.service.IAlarmService;
import com.team01.webapp.model.Alarm;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/alarm")
@Log4j2
public class AlarmController extends TextWebSocketHandler {
	
	@Autowired
	IAlarmService alarmService;
	
	@GetMapping("list")
	public String alarmList(HttpSession session, Model model) {
		log.info("실행");
		int user = (Integer)session.getAttribute("userNo");
		
		List<Alarm> alarmList = alarmService.selectAlarmList(user);
		
		model.addAttribute("alarmList",alarmList);
		
		return "alarm/list";
	}
}


