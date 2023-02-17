package com.team01.webapp.home.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.webapp.home.dao.IHomeRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class HomeService implements IHomeService{
	
	@Autowired
	IHomeRepository homeRepository;

	@Override
	public System getSystemMiniView(int userNo) {
		log.info("실행");
		return homeRepository.selectSysInfo(userNo);
	}

}
