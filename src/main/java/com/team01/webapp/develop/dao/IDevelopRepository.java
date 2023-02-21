package com.team01.webapp.develop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team01.webapp.model.HR;
import com.team01.webapp.model.SR;
import com.team01.webapp.model.SrDevelopDto;
import com.team01.webapp.model.Users;
import com.team01.webapp.util.Pager;

public interface IDevelopRepository {

	/**
	 * @author	정홍주
	 * @return	전체 행의 개수
	 */
	public int totalRow();
	
	/**
	 * @author 	정홍주
	 * @param 	pager
	 * @return	개발관리 목록
	 */
	public List<SR> selectDevelopList(Pager pager);
	
	/**
	 * @author	정홍주
	 * @param 	srNo
	 * @return	상세 내용
	 */
	public SrDevelopDto selectDevelopContent(String srNo);
	
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
	public int updateSr(SrDevelopDto srDevelop);
	
	/**
	 * @author 	정홍주
	 * @param 	userDpNm를 이용해 팀별 개발자목록 조회
	 * @return	List형태
	 */
	public List<Users> selectDeveloperByDp(String userDpNm);
	
	public List<HR> hrlist(@Param("userDpNm")String userDpNm, @Param("userNo")int userNo);
}
