package com.team01.webapp.request.dao;

import org.apache.ibatis.annotations.Mapper;

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

}
