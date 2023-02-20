package com.team01.webapp.request.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.webapp.model.SR;
import com.team01.webapp.request.dao.IRequestRepository;
import com.team01.webapp.util.Pager;

@Service
public class RequestService implements IRequestService{
	
	@Autowired
	IRequestRepository requestRepository;
	/**
	 * 페이저
	 */
	@Override
	public Pager returnPage(String pageNo, Pager pager) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 모든 리스트 가져오기
	 */
	@Override
	public List<SR> getTotalArticleList(Pager pager) {
		// TODO Auto-generated method stub
		return null;
	}
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
	public void writeRequest(SR sr) {
		sr.setSrNo(requestRepository.selectMaxSrNo()+1);
	}

}
