package com.team01.webapp.alarm.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.webapp.alarm.dao.IAlarmRepository;
import com.team01.webapp.alarm.service.IAlarmService;
import com.team01.webapp.model.Alarm;
import com.team01.webapp.model.Users;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class AlarmService implements IAlarmService{

	@Autowired
	IAlarmRepository alarmRepository;
	
	//읽지 않은 알림 수
	@Override
	public int selectAlarmCount(Alarm alarm) {
		log.info("실행");
		int alarmCnt = alarmRepository.selectAlarmCount(alarm);
		
		return alarmCnt;
	}
	
	//전체 알림 리스트
	@Override
	public List<Alarm> selectAlarmList(int userNo) {
		log.info("실행");
		List<Alarm> alarmList = alarmRepository.selectAlarmList(userNo);
		
		return alarmList;
	}
	
	//알림 추가
	@Override
	public void insertAlarm(String srNo, HttpSession session) {
		log.info("실행");
		Alarm alarmUser = new Alarm();
		alarmUser.setUserType((String)session.getAttribute("userType"));
		alarmUser = alarmRepository.selectAlarm(srNo);
		log.info(alarmUser);
		
		alarmRepository.insertAlarm(alarmUser);
	}
	
	//알림 체크
	@Override
	public void updateCheck(String srNo) {
		log.info("실행");
		alarmRepository.updateAlarmCheck(srNo);
		
	}
	//알람 삭제
	@Override
	public void deleteAlarm(int alarmNo) {
		log.info("실행");
		alarmRepository.deleteAlarm(alarmNo);
	}
	
	//로그인 유저 정보 가져오기
	@Override
	public Users selectLoginUser(int userNo) {
		
		Users loginUser = alarmRepository.selectLoginUser(userNo);
		
		return loginUser;
	}

}
