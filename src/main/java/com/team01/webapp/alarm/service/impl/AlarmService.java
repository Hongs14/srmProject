package com.team01.webapp.alarm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.webapp.alarm.dao.IAlarmRepository;
import com.team01.webapp.alarm.service.IAlarmService;
import com.team01.webapp.model.Alarm;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class AlarmService implements IAlarmService{

	@Autowired
	IAlarmRepository alarmRepository;
	
	//읽지 않은 알림 수
	@Override
	public int selectAlarmCount(int userNo) {
		log.info("실행");
		int alarmCnt = alarmRepository.selectAlarmCount(userNo);
		
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
	public void insertAlarm(String srNo) {
		log.info("실행");
		Alarm alarmUser = alarmRepository.selectAlarm(srNo);
		log.info(alarmUser);
		
		alarmRepository.insertAlarm(alarmUser);
	}

}
