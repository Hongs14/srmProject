package com.team01.webapp.examine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team01.webapp.model.Examine;
import com.team01.webapp.model.ExamineList;
import com.team01.webapp.model.SRStts;
import com.team01.webapp.model.System;
import com.team01.webapp.model.Users;

public interface IExamineRepository {
	/**
	 * SR 검토 리스트 카운트
	 * @author : 황건희
	 * @return
	 */
	public int selectExamineListAllCount();
	
	/**
	 * SR 검토 리스트 
	 * @author : 황건희
	 * @param examineList SR 검토 리스트 가져오기
	 * @return
	 */
	public List<Examine> selectExaminelist(ExamineList examineList);
	
	/**
	 * SR 상태 리스트 가져오기
	 * @author : 황건희
	 * @return
	 */
	public List<SRStts> selectSrSttsList();
	
	/**
	 * SR 관련 시스템 리스트
	 * @author : 황건희
	 * @return
	 */
	public List<System> selectSysNmList();
	
	/**
	 * 고객의 소속 리스트
	 * @author : 황건희
	 * @return
	 */
	public List<Users> selectUserOgdpList();
	/**
	 * 고객의 소속 부서 리스트
	 * @author : 황건희
	 * @return
	 */
	public List<Users> selectUserDpList();
	/**
	 * SR 검색 리스트 카운트
	 * @author : 황건희
	 * @param examineList
	 * @return
	 */
	public int selectTotalExamineCount(ExamineList examineList);
	
	/**
	 * SR 검토 상세 조회
	 * @author : 황건희
	 * @param srNo
	 * @return
	 */
	public Examine selectExamine(String srNo);
	
	public void updateExamine(Examine examine);
	
	public void updateExamineProcessing(ExamineList examineList);
	
}
