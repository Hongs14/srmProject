package com.team01.webapp.request.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team01.webapp.model.RequestAjax;
import com.team01.webapp.model.RequestList;
import com.team01.webapp.model.SR;
import com.team01.webapp.model.SRStts;
import com.team01.webapp.model.SRType;
import com.team01.webapp.model.System;
import com.team01.webapp.model.Users;

@Mapper
public interface IRequestRepository {
	
	/**
	 * User가 소속된 시스템 넘버 가져오기
	 * 
	 * @author	김희률
	 * @param userNo
	 * @return
	 */
	String selectSysNo(int userNo);

	String selectMaxSrNo(String sysNo);
	
	List<System> selectSysNmList();
	
	
	List<SRType> selectSrType();
	
	
	List<SRStts> selectSttsNmList();
	
	List<Users> selectUserOgdpList();
	
	List<SR> selectSrDevDpList();

	int selectTotalRequestCount(RequestAjax requestAjax);
	
	List<RequestList> selectRequestList(RequestAjax requestAjax);

	int insertRequest(SR sr);


	
	
}
