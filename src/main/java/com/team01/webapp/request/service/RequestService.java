package com.team01.webapp.request.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team01.webapp.model.Examine;
import com.team01.webapp.model.RequestFilter;
import com.team01.webapp.model.RequestList;
import com.team01.webapp.model.SR;
import com.team01.webapp.model.SRStts;
import com.team01.webapp.model.SRType;
import com.team01.webapp.model.System;
import com.team01.webapp.request.dao.IRequestRepository;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class RequestService implements IRequestService{
	
	@Autowired
	IRequestRepository requestRepository;
	
	/**
	 * system 넘버 가져오기
	 */
	@Override
	public String getSysNo(int userNo) {
		return requestRepository.selectSysNo(userNo);
	}
	/**
	 * SR 작성
	 */
	@Override
	public void writeRequest(SR sr, File file) {
		// TODO Auto-generated method stub
		
	}
	/**
	 * SR 작성
	 */
	@Override
	@Transactional
	public void writeRequest(SR sr) {
		sr.setSysNo(requestRepository.selectSysNo(sr.getSrCustId()));
		sr.setSrNo(requestRepository.selectMaxSrNo()+1);
	}
	
	@Override
	@Transactional
	public RequestFilter getFilterList(RequestFilter requestFilter) {
		// 사용할 리스트 선언
		List<System> systemList = new ArrayList<>();
		List<SRType> srTypeList = new ArrayList<>();
		List<SRStts> srSttsList = new ArrayList<>();
		
		// 시스템 구분 리스트
		systemList = requestRepository.selectSysNmList();
		requestFilter.setSysNmList(systemList);
		
		// 업무 구분 리스트
		srTypeList = requestRepository.selectSrType();
		requestFilter.setSrTypeList(srTypeList);
		
		// 진행 상태 리스트
		srSttsList = requestRepository.selectSttsNmList();
		requestFilter.setSrSttsList(srSttsList);
		
		return requestFilter;
	}
	@Override
	public Pager returnPage(int pageNo, Pager pager, RequestList requestList) {
		log.info("실행");
		log.info(requestList);
		int totalListNum = (int) requestRepository.selectTotalRequestCount(requestList);
		log.info(totalListNum);
		pager = new Pager(10,5,totalListNum,pageNo);
		
		return pager;
	}
	@Override
	public List<RequestList> getRequestList(Pager pager, RequestList requestList) {
		log.info("실행");
		int startRowNo = pager.getStartRowNo();
		int endRowNo = pager.getEndRowNo();
		List<RequestList> requestLists = requestRepository.selectRequestList(startRowNo, endRowNo, requestList);
		return requestLists;
	}
	
}
