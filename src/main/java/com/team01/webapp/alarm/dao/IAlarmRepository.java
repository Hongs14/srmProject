package com.team01.webapp.alarm.dao;

import java.util.List;

import com.team01.webapp.model.Alarm;

public interface IAlarmRepository {
	
	//읽지 않은 알림 수
	public int selectAlarmCount (int userNo);
	
	//전체 알림 리스트
	public List<Alarm> selectAlarmList(int userNo);
	
	//해당 SR 고객사 찾기
	public Alarm selectAlarm(String srNo);
	
	//고객사에게 알림
	public void insertAlarm(Alarm alarm);
	
}
