package com.team01.webapp.progress.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.webapp.model.ProgressFilter;
import com.team01.webapp.model.SRStts;
import com.team01.webapp.model.SRType;
import com.team01.webapp.progress.dao.IProgressRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class ProgressService implements IProgressService {
	
	@Autowired
	private IProgressRepository progressRepository;
	
	@Override
	public ProgressFilter filterList(ProgressFilter progressfilter) {
		// 사용할 리스트 선언
		List<String> systemList = new ArrayList<>();
		List<SRType> srTypeList = new ArrayList<>();
		List<SRStts> srSttsList = new ArrayList<>();
		
		// 시스템 구분 리스트
		systemList = progressRepository.selectSysNmList();
		progressfilter.setSysNmList(systemList);
		
		// 업무 구분 리스트
		srTypeList = progressRepository.selectSrType();
		progressfilter.setSrTypeList(srTypeList);
		
		// 진행 상태 리스트
		srSttsList = progressRepository.selectSttsNmList();
		progressfilter.setSrSttsList(srSttsList);
		
		return progressfilter;
	}

}
