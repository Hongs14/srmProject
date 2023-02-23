package com.team01.webapp.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.webapp.home.dao.IHomeRepository;
import com.team01.webapp.model.Donut;
import com.team01.webapp.model.SystemInfo;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class HomeService implements IHomeService{
	
	@Autowired
	IHomeRepository homeRepository;

	@Override
	public SystemInfo getSystemMiniView(int userNo) {
		log.info("실행");
		SystemInfo system = homeRepository.selectSysInfo(userNo);
		return system;
	}

	@Override
	public List<Donut> getDonutList(String sysNo) {
		return homeRepository.selectDonutList(sysNo);
	}

}
