package com.team01.webapp.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.webapp.home.dao.IHomeRepository;
import com.team01.webapp.model.Donut;
import com.team01.webapp.model.SR;
import com.team01.webapp.model.SystemInfo;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class HomeService implements IHomeService{
	
	@Autowired
	IHomeRepository homeRepository;

	@Override
	public List<SystemInfo> getSystemMiniView(int userNo) {
		log.info("실행");
		return homeRepository.selectSysInfo(userNo);
	}

	@Override
	public List<Donut> getDonutList(String sysNo) {
		return homeRepository.selectDonutList(sysNo);
	}

	@Override
	public List<SystemInfo> getSystemMiniViewDetail(int userNo) {
		return homeRepository.selectSysInfo2(userNo);
	}

	@Override
	public Pager returnPage(int pageNo, Pager pager, SR sr) {
		int totalListNum = (int) homeRepository.selectTotalCount(sr);
		
		pager = new Pager(6, 5, totalListNum, pageNo);
		
		return pager;
	}

	@Override
	public List<SR> homeList(Pager pager, SR sr) {
		int end = pager.getPageNo() * pager.getRowsPerPage();
		int start = (pager.getPageNo()-1)* pager.getRowsPerPage()+1;
		
		sr.setEnd(end);
		sr.setStart(start);
		
		return homeRepository.selectHomeList(sr);
		
	}

}
