package com.team01.webapp.alarm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.team01.webapp.alarm.service.IAlarmService;
import com.team01.webapp.model.Alarm;
import com.team01.webapp.model.Users;

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
		//알림 수
		int userNo = (Integer) session.getAttribute("userNo");
		Alarm alarm = new Alarm();
		alarm.setUserNo(userNo);
		alarm.setUserType((String)session.getAttribute("userType"));
		model.addAttribute("userType",alarm.getUserType());
		if(alarm.getUserType().equals("관리자")) {
			Users loginUser = alarmService.selectLoginUser(userNo);
			alarm.setSysNo("%"+loginUser.getSysNo()+"%");
			model.addAttribute("sysNo",alarm.getSysNo());
		}else {			
			alarm.setSysNo("%"+(String)session.getAttribute("sysNo")+"%");
			model.addAttribute("sysNo",alarm.getSysNo());
		}
		//알림 리스트
		List<Alarm> alarmList = alarmService.selectAlarmList(alarm);
		int alarmCnt = alarmService.selectAlarmCount(alarm);
		model.addAttribute("alarmCnt",alarmCnt);
		model.addAttribute("alarmList",alarmList);
		return "alarm/list";
	}
	
	@PostMapping(value="categoryAlarm", produces="application/json; charset=UTF-8")
	public String selectCategoryAlarm(@RequestBody Alarm alarm, Model model) {
		log.info("실행");
		List<Alarm> categoryAlarm = alarmService.selectCategoryAlarm(alarm);
		log.info(categoryAlarm);
		model.addAttribute("categoryAlarm",categoryAlarm);
		return "alarm/categoryList";
	}
	
	@PostMapping(value="updateAlarmCheck")
	public String updateAlarmCheck(@RequestBody Alarm alarm) {
		log.info("실행");
		log.info(alarm);
		int alarmNo = alarm.getAlarmNo();
		alarmService.updateCheck(alarmNo);
		
		return "redirect:/alarm/list";
	}
	
	@PostMapping(value="delete", produces="application/json; charset=UTF-8")
	public String deleteAlarm(@RequestBody Alarm alarm) {
		log.info("실행");
		
		int alarmNo = alarm.getAlarmNo();
		log.info(alarmNo);
		alarmService.deleteAlarm(alarmNo);
		
		return "redirect:/alarm/list";
	}
	
	
}


