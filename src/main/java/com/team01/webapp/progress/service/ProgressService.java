package com.team01.webapp.progress.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.webapp.model.HR;
import com.team01.webapp.model.ProgressDetail;
import com.team01.webapp.model.ProgressFilter;
import com.team01.webapp.model.SRFile;
import com.team01.webapp.model.SRStts;
import com.team01.webapp.model.SRType;
import com.team01.webapp.model.SrProgressAjax;
import com.team01.webapp.model.SrProgressList;
import com.team01.webapp.model.System;
import com.team01.webapp.progress.dao.IProgressRepository;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class ProgressService implements IProgressService {
	
	@Autowired
	private IProgressRepository progressRepository;
	
	@Override
	public ProgressFilter filterList(ProgressFilter progressfilter) {
		// 사용할 리스트 선언
		List<System> systemList = new ArrayList<>();
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
	
	@Override
	public Pager returnPage(String pageNo, Pager pager, SrProgressAjax srProgressAjax) {
		// Pager
		int totalListNum = (int) progressRepository.selectTotalProgressCount(srProgressAjax);
		
		int pagerNo = Integer.parseInt(pageNo);
		pager = new Pager(10, 5, totalListNum, pagerNo);
		
		return pager;
	}

	@Override
	public List<SrProgressList> ProgressList(Pager pager, SrProgressAjax srProgressAjax) {
		int end = pager.getPageNo() * pager.getRowsPerPage();
		int start = (pager.getPageNo()-1)* pager.getRowsPerPage()+1;
		
		srProgressAjax.setEnd(end);
		srProgressAjax.setStart(start);
		
		return progressRepository.selectProgressList(srProgressAjax);
	}

	@Override
	public ProgressDetail selectDetail(String srNo) {
		
		ProgressDetail progressDetail = progressRepository.selectProgressRequester(srNo);
		
		// 개발자 정보 담아주기
		ProgressDetail progressDetailDeveloper = progressRepository.selectProgessdeveloper(srNo);
		progressDetail.setDpNm(progressDetailDeveloper.getDpNm());
		progressDetail.setDeveloperNm(progressDetailDeveloper.getDeveloperNm());
		progressDetail.setSrStartDate(progressDetailDeveloper.getSrStartDate());
		progressDetail.setSrEndDate(progressDetailDeveloper.getSrEndDate());
		
		// 파일 정보 담아주기
		List<SRFile> srFile = progressRepository.selectSrFileList(srNo);
		progressDetail.setSrFile(srFile);
		
		return progressDetail;
	}

	@Override
	public SRFile getSrFile(int srFileNo) {
		return progressRepository.selectSrFile(srFileNo);
	}

	@Override
	public List<HR> humanResourceList(String srNo) {
		return progressRepository.selectHumanResourceList(srNo);
	}


}
