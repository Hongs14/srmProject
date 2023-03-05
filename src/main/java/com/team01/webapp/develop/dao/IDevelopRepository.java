package com.team01.webapp.develop.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team01.webapp.model.DevelopDto;
import com.team01.webapp.model.HR;
import com.team01.webapp.model.Progress;
import com.team01.webapp.model.SR;
import com.team01.webapp.model.SRStts;
import com.team01.webapp.model.SrFile;
import com.team01.webapp.model.System;
import com.team01.webapp.model.UpdateDevelop;
import com.team01.webapp.model.Users;

public interface IDevelopRepository {

	/**
	 * @author				정홍주
	 * @param developDto	검색조건
	 * @return				전체 행의 개수
	 */
	public int totalRow(DevelopDto developDto);
	
	/**
	 * @author 				정홍주
	 * @param developDto	
	 * @return				개발관리 목록
	 */
	public List<DevelopDto> selectDevelopList(DevelopDto developDto);
	
	/**	필터링 종류
	 * @author	정홍주
	 * @return	
	 */
	public List<SRStts> selectSrSttsList(); 
	public List<System> selectSysNmList();
	public List<Users> selectUserOgdpList();
	public List<SR> selectDevDpList();
	/**
	 * @author	정홍주
	 * @param 	srNo
	 * @return	상세 내용
	 */
	public DevelopDto selectDevelopContent(String srNo);
	
	/**
	 * @author	정홍주
	 * @return	담당개발자를 정하기 위한 개발자 목록	
	 */
	public List<Users> devList();
	
	/**
	 * @author	정홍주
	 * @param	srDevelop객체에 값을 넣어 SR테이블을 update한다.
	 * @return	update에 성공하면 1 리턴
	 */
	public int updateSr(UpdateDevelop updateDevelop);
	
	/**
	 * @author 	정홍주
	 * @param 	userDpNm를 이용해 팀별 개발자목록 조회
	 * @return	List형태
	 */
	public List<Users> selectDeveloperByDp(@Param("userDpNm") String userDpNm, @Param("userNo") int userNo);
	
	public List<HR> hrlist(@Param("userDpNm")String userDpNm, @Param("userNo")int userNo, @Param("hrStartDate") Date hrStartDate, @Param("hrEndDate") Date hrEndDate);

	public List<Users> selectNameByNo(int userNo);
	
	/**
	 * @author 	정홍주
	 * @param 	List<HR>를 이용해 insert한다.
	 * @return	insert에 성공하면 1을 리턴
	 */
	public int insertHrRow(List<HR> list);

	public int selectMaxProgNo();
	
	public int insertProg(List<Progress> prog);

	public SrFile selectSrFile(int srFileNo);

	public List<SrFile> selectSrFileList(String srNo);
	
	/**
	 * @author		 정홍주
	 * @param srNo	
	 * @return		HR객체
	 */
	public List<HR> selectHrList(String srNo);

	public Users selectLeader(String srNo);
	
	public int checkHr(String srNo);
	public int deleteHr(String srNo);

}