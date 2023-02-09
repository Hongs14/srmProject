package com.team01.webapp.service;

import org.springframework.stereotype.Service;

import com.team01.webapp.dao.HomeDao;

@Service
public class HomeService {
	
	private HomeDao homeDao;
	
	public int insert() {
		System.out.println(1);
		int a = homeDao.insert();
		System.out.println(a);
		return a;
	}
	
}
