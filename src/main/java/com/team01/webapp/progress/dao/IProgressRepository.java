package com.team01.webapp.progress.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.team01.webapp.model.SRStts;
import com.team01.webapp.model.SRType;

@Repository
public interface IProgressRepository {
	// 필터링 용
	List<String> selectSysNmList();
	List<SRType> selectSrType();
	List<SRStts> selectSttsNmList();
	
}
