package com.team01.webapp.util;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.core.tools.picocli.CommandLine.Command;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.team01.webapp.alarm.service.IAlarmService;
import com.team01.webapp.model.Alarm;
import com.team01.webapp.model.Users;

@Component
public class AlarmInfo {
	@Autowired
	private IAlarmService alarmService;
	
	public void info(HttpSession session, Model model) {
		int userNo = (Integer) session.getAttribute("userNo");
		Alarm alarm = new Alarm();
		alarm.setUserNo(userNo);
		alarm.setUserType((String)session.getAttribute("userType"));
		if(alarm.getUserType().equals("관리자")) {
			Users loginUser = alarmService.selectLoginUser(userNo);
			alarm.setSysNo("%"+loginUser.getSysNo()+"%");
		}else {			
			alarm.setSysNo("%"+(String)session.getAttribute("sysNo")+"%");
		}
		//알림 리스트
		List<Alarm> alarmList = alarmService.selectAlarmList(alarm);
		int alarmCnt = alarmService.selectAlarmCount(alarm);
		model.addAttribute("alarmCnt",alarmCnt);
		model.addAttribute("alarmList",alarmList);
	}
	
	
}
