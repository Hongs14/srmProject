package com.team01.webapp.examine.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.webapp.examine.dao.IExamineRepository;
import com.team01.webapp.examine.service.IExamineService;
import com.team01.webapp.model.Examine;
import com.team01.webapp.model.ExamineFilter;
import com.team01.webapp.model.ExamineList;
import com.team01.webapp.model.SRStts;
import com.team01.webapp.model.System;
import com.team01.webapp.model.Users;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class ExamineService implements IExamineService {
	
	@Autowired
	IExamineRepository examineRepository;
	
	@Override
	public int getTotalRows() {
		log.info("실행");
		int rows = examineRepository.count();
		return 0;
	}

	@Override
	public List<Examine> getExamineList(Pager pager,ExamineList examinelist) {
		log.info("실행");
		
		examinelist.setStartRowNo(pager.getStartRowNo());
		examinelist.setEndRowNo(pager.getEndRowNo());
		
		List<Examine> examineList = examineRepository.list(examinelist);
		
		return examineList;
	}

	@Override
	public ExamineFilter filterList(ExamineFilter examineFilter) {
		log.info("실행");
		
		List<SRStts> srSttsList = new ArrayList<>();
		List<System> sysNmList = new ArrayList<>();
		List<Users> userOgdpList = new ArrayList<>();
		List<Users> userDpList = new ArrayList<>();
		
		//요청 진행상태
		srSttsList = examineRepository.selectSrSttsList();
		examineFilter.setSrSttsList(srSttsList);
		
		//관련 시스템
		sysNmList = examineRepository.selectSysNmList();
		examineFilter.setSysNmList(sysNmList);
		
		//등록자 소속 
		userOgdpList = examineRepository.selectUserOgdpList();
		examineFilter.setUserOgdpList(userOgdpList);
		
		//등록자 부서
		userDpList = examineRepository.selectUserDpList();
		examineFilter.setUserDpList(userDpList);
		
		return examineFilter;
	}

	@Override
	public Pager returnPage(int pageNo, Pager pager, ExamineList examinelist) {
		log.info("실행");
		int totalListNum = (int) examineRepository.selectTotalExamineCount(examinelist);
		log.info(totalListNum);
		pager = new Pager(10,5,totalListNum,pageNo);
		
		return pager;
	}

}
