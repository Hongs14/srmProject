package com.team01.webapp.alarm.service.impl;

import java.util.ArrayList;
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
	public List<Alarm> selectAlarmList(Alarm alarm) {
		log.info("실행");
		log.info(alarm);
		List<Alarm> alarmList = alarmRepository.selectAlarmList(alarm);
		log.info(alarmList);
		return alarmList;
	}
	
	@Override
	public List<Alarm> selectCategoryAlarm(Alarm alarm){
		log.info("실행");
		List<Alarm> categoryAlarm = alarmRepository.selectCategoryAlarm(alarm);
		
		return categoryAlarm;
	}
	
	//알림 추가
	@Override
	public void insertAlarm(String srNo, HttpSession session) {
		log.info("실행");
		Alarm alarmUser = new Alarm();
		alarmUser.setUserType((String)session.getAttribute("userType"));
		alarmUser = alarmRepository.selectAlarm(srNo);
		
		String choice = (String)session.getAttribute("choice");
		log.info(choice);
		
		if(alarmUser.getSttsNm().equals("요청")) {
			alarmUser.setMessage("SR 요청이 등록 되었습니다.");
			alarmUser.setAlarmPry("상");
			alarmUser.setAlarmCategory("SR상태변경");
		}else if(alarmUser.getSttsNm().equals("검토중")) {
			alarmUser.setMessage("SR 요청이 검토중 입니다.");
			alarmUser.setAlarmPry("하");
			alarmUser.setAlarmCategory("SR상태변경");
		}else if(alarmUser.getSttsNm().equals("접수")) {
			alarmUser.setMessage("SR 요청이 정상적으로 접수 되었습니다.");
			alarmUser.setAlarmPry("하");
			alarmUser.setAlarmCategory("SR상태변경");
		}else if(alarmUser.getSttsNm().equals("개발계획")) {
			alarmUser.setMessage("SR 요청이 개발 계획 중 입니다.");
			alarmUser.setAlarmPry("하");
			alarmUser.setAlarmCategory("SR상태변경");
		}else if(alarmUser.getSttsNm().equals("개발중")) {
			alarmUser.setMessage("SR 요청이 개발중 입니다.");
			alarmUser.setAlarmPry("하");
			alarmUser.setAlarmCategory("업무배정");
		}else if(alarmUser.getSttsNm().equals("완료요청") && choice.equals("1")) {
			alarmUser.setMessage("SR 완료 요청 승인 바랍니다.");
			alarmUser.setAlarmPry("상");
			alarmUser.setAlarmCategory("SR상태변경");
			log.info(alarmUser);
		}else if(alarmUser.getSttsNm().equals("개발 완료") && choice.equals("2")) {
			alarmUser.setMessage("SR 요청이 개발완료 되었습니다.");
			alarmUser.setAlarmPry("하");
			alarmUser.setAlarmCategory("요청결과");
			log.info(alarmUser);
		}else if(alarmUser.getSttsNm().equals("반려")) {
			alarmUser.setMessage("SR 요청이 반려 되었습니다.");
			alarmUser.setAlarmPry("하");
			alarmUser.setAlarmCategory("SR상태변경");
		}else if(alarmUser.getSttsNm().equals("재검토")) {
			alarmUser.setMessage("SR 요청이 재검토 되었습니다.");
			alarmUser.setAlarmPry("하");
			alarmUser.setAlarmCategory("SR상태변경");
		}else if(alarmUser.getSttsNm().equals("계획조정")) {
			alarmUser.setMessage("SR 요청에 대한 계획 조정 요청 입니다.");
			alarmUser.setAlarmPry("상");
			alarmUser.setAlarmCategory("SR상태변경");
		}
		
		alarmRepository.insertAlarm(alarmUser);
	}
	
	//알림 체크
	@Override
	public void updateCheck(int alarmNo) {
		log.info("실행");
		alarmRepository.updateAlarmCheck(alarmNo);
		
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
