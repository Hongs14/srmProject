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
		//알림 리스트
		int userNo = (Integer) session.getAttribute("userNo");
		List<Alarm> alarmList = alarmService.selectAlarmList(userNo);
		
		//알림 수
		int alarmCnt = alarmService.selectAlarmCount(userNo);
		model.addAttribute("alarmCnt",alarmCnt);
		model.addAttribute("alarmList",alarmList);
		
		return "alarm/list";
	}
	
	@PostMapping(value="updateAlarmCheck", produces="application/json; charset=UTF-8")
	public String updateAlarmCheck(@RequestBody Alarm alarm) {
		log.info("실행");
		log.info(alarm);
		String srNo = alarm.getSrNo();
		alarmService.updateCheck(srNo);
		
		return "redirect:/alarm/list";
	}
	
	@PostMapping(value="delete", produces="application/json; charset=UTF-8")
	public String deleteAlarm(@RequestBody Alarm alarm) {
		log.info("실행");
		
		int alarmNo = alarm.getAlarmNo();
		
		alarmService.deleteAlarm(alarmNo);
		
		return "redirect:/alarm/list";
	}
	
	
}


