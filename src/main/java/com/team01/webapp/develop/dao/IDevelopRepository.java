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

	/**목록 및 상세보기
	 * @autho	정홍주
	 */
	public int totalRow(DevelopDto developDto);
	public List<DevelopDto> selectDevelopList(DevelopDto developDto);
	public DevelopDto selectDevelopContent(String srNo);

	/**	필터링 종류
	 * @author	정홍주
	 */
	public List<SRStts> selectSrSttsList(); 
	public List<System> selectSysNmList();
	public List<Users> selectUserOgdpList();
	public List<SR> selectDevDpList();

	/** 계발계획 기능
	 * @author	정홍주
	 */
	public List<Users> devList();
	public int updateSr(UpdateDevelop updateDevelop);
	public List<Users> selectDeveloperByDp(@Param("userDpNm") String userDpNm, @Param("userNo") int userNo);
	public List<Users> selectNameByNo(int userNo);
	public SrFile selectSrFile(int srFileNo);
	public List<SrFile> selectSrFileList(String srNo);
	public Users selectLoginUser(int userNo);
	public List<String> selectSrNo();
	
	/** 인력투입
	 * @author	정홍주
	 */
	public List<HR> hrlist(@Param("userDpNm")String userDpNm, @Param("userNo")int userNo, @Param("hrStartDate") Date hrStartDate, @Param("hrEndDate") Date hrEndDate);
	public List<HR> selectHrList(String srNo);
	public Users selectLeader(String srNo);
	public int checkHr(String srNo);
	public int deleteHr(String srNo);
	public int selectMaxProgNo();
	public int insertProg(List<Progress> prog);
	public void updateSttsNo(String srNo);
	public int insertHrRow(List<HR> list);
	
	

}