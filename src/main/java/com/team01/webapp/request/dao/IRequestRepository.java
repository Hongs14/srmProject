package com.team01.webapp.request.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team01.webapp.model.RequestList;
import com.team01.webapp.model.SR;
import com.team01.webapp.model.SRStts;
import com.team01.webapp.model.SRType;
import com.team01.webapp.model.SrProgressAjax;
import com.team01.webapp.model.SrProgressList;
import com.team01.webapp.model.System;

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

	String selectMaxSrNo();
	
	List<System> selectSysNmList();
	
	
	List<SRType> selectSrType();
	
	
	List<SRStts> selectSttsNmList();
	
	
	int selectTotalRequestCount(RequestList requestList);
	

	List<RequestList> selectRequestList(@Param("startRowNo") int startRowNo, @Param("endRowNo")int endRowNo, @Param("requestList")RequestList requestList);
	
	
}
