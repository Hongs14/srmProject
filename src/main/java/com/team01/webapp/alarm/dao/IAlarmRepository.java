package com.team01.webapp.alarm.dao;

import java.util.List;

import com.team01.webapp.model.Alarm;
import com.team01.webapp.model.Users;

public interface IAlarmRepository {
	
	//읽지 않은 알림 수
	public int selectAlarmCount (Alarm alarm);
	
	//전체 알림 리스트
	public List<Alarm> selectAlarmList(Alarm alarm);
	
	//카테고리 알림 리스트
	public List<Alarm> selectCategoryAlarm(Alarm alarm);
	
	//해당 SR 고객사 찾기
	public Alarm selectAlarm(String srNo);
	
	//고객사에게 알림
	public void insertAlarm(Alarm alarm);
	
	//알림 체크
	public void updateAlarmCheck(int alarmNo);
	
	//알림 삭제
	public void deleteAlarm(int alarmNo);
	
	//로그인한 유저 정보 가져오기
	public Users selectLoginUser(int userNo);
}
