package com.team01.webapp.progress.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.team01.webapp.model.DeveloperSR;
import com.team01.webapp.model.HR;
import com.team01.webapp.model.Progress;
import com.team01.webapp.model.ProgressDetail;
import com.team01.webapp.model.SRFile;
import com.team01.webapp.model.SRStts;
import com.team01.webapp.model.SRType;
import com.team01.webapp.model.SrProgressAjax;
import com.team01.webapp.model.SrProgressList;
import com.team01.webapp.model.System;
import com.team01.webapp.model.Task;
import com.team01.webapp.model.ThArr;

@Repository
public interface IProgressRepository {
	// 필터링 용
	/**
	 * 필터링 시스템 구분 조회
	 * 
	 * @author					김태희
	 * @return					List<System> 리스트 return
	 */
	List<System> selectSysNmList();
	
	/**
	 * 필터링 업무 구분 조회
	 * 
	 * @author					김태희
	 * @return					List<SRType> 리스트 return
	 */
	List<SRType> selectSrType();
	
	/**
	 * 필터링 진행 상태 조회
	 * 
	 * @author					김태희
	 * @return					List<SRStts> 리스트 return
	 */
	List<SRStts> selectSttsNmList();
	
	/**
	 * 페이징 처리 하기 위한 행의 수 조회
	 * 
	 * @author					김태희
	 * @param srProgressAjax	클라이언트가 보낸 srProgressAjax 객체 저장
	 * @return					조회된 행의 수 return
	 */
	int selectTotalProgressCount(SrProgressAjax srProgressAjax);
	
	/**
	 * 페이징 된 리스트 조회
	 * 
	 * @author					김태희
	 * @param srProgressAjax	클라이언트가 보낸 srProgressAjax 객체 저장
	 * @return					List<SrProgressList> 리스트 return
	 */
	List<SrProgressList> selectProgressList(SrProgressAjax srProgressAjax);
	
	/**
	 * 상세 뷰 SR 상세 정보 조회(requester 정보)
	 * 
	 * @author					김태희
	 * @param srNo				클라이언트가 보낸 sr 번호 정보 저장
	 * @return					SR 상세 정보 return
	 */
	ProgressDetail selectProgressRequester(String srNo);
	
	/**
	 * 상세 뷰 SR 상세 정보 조회(developer 정보)
	 * 
	 * @author					김태희
	 * @param srNo				클라이언트가 보낸 sr 번호 정보 저장
	 * @return					SR 상세 정보 return
	 */
	ProgressDetail selectProgessdeveloper(String srNo);
	
	/**
	 * 상세 뷰 첨부파일 List 조회
	 * 
	 * @author					김태희
	 * @param srNo				클라이언트가 보낸 sr 번호 정보 저장
	 * @return					뷰 첨부파일 경로 정보 리스트 return
	 */
	List<SRFile> selectSrFileList(String srNo);
	
	/**
	 * 상세 뷰 첨부파일 조회
	 * 
	 * @author					김태희
	 * @param srFileNo			클라이언트가 보낸 sr 파일 번호 정보 저장
	 * @return					뷰 첨부파일 경로 정보 return
	 */
	SRFile selectSrFile(int srFileNo);
	
	/**
	 * SR 인적자원 리스트 조회
	 * 
	 * @author					김태희
	 * @param srNo				클라이언트가 보낸 sr 번호 정보 저장
	 * @return			 		인적 자원 정보 리스트 return
	 */
	List<HR> selectHumanResourceList(String srNo);
	
	/**
	 * 개발자 리스트 조회
	 * 
	 * @author					김태희
	 * @param userDpNm			클라이언트가 보낸 userDpNm 유저 부서 이름 정보 저장
	 * @param srNo				클라이언트가 보낸 sr 번호 정보 저장
	 * @return					부서에 맞는 개발자 리스트 return
	 */
	List<HR> selectDeveloperList(@Param("userDpNm") String userDpNm, @Param("srNo") String srNo);
	
	/**
	 * 개발자 sr 현황 조회
	 * 
	 * @author					김태희
	 * @param userNo			클라이언트가 보낸 user 번호 정보 저장
	 * @return					개발자가 현재 일하고 있는 sr 정보 리스트 return
	 */
	List<DeveloperSR> selectDeveloperSR(int userNo);
	
	/**
	 * 개발자 업무 리스트 조회
	 * 
	 * @author					김태희
	 * @return					개발자 업무 리스트 return
	 */
	List<Task> selectTaskList();
	
	/**
	 * SR인적자원 개발자 추가
	 * 
	 * @author					김태희
	 * @param thArr				클라이언트가 보낸 thArr 객체 정보 저장
	 */
	void insertDeveloper(ThArr thArr);
	
	/**
	 * 수정 클릭 시 수정 할 개발자 조회
	 * 
	 * @author					김태희
	 * @param srNo				클라이언트가 보낸 sr 번호 정보 저장
	 * @param userNo			클라이언트가 보낸 user 번호 정보 저장
	 * @return					수정 클릭시 수정 할 개발자 return
	 */
	HR selectDeveloper(@Param("srNo") String srNo, @Param("userNo") int userNo);
	
	/**
	 * 개발자 투입 날짜, 끝 날짜 수정
	 * 
	 * @author					김태희
	 * @param hr				클라이언트가 보낸 hr 객체 정보 저장
	 */
	void updateDeveloper(HR hr);
	
	/**
	 * SR인적자원 개발자 삭제
	 * 
	 * @author					김태희
	 * @param srNo				클라이언트가 보낸 sr 번호 정보 저장
	 * @param userNo			클라이언트가 보낸 user 번호 정보 저장
	 */
	void deleteDeveloper(@Param("srNo") String srNo, @Param("userNo") int userNo);
	
	/**
	 * 진척율 리스트 조회
	 * 
	 * @author					김태희
	 * @param srNo				클라이언트가 보낸 sr 번호 정보 저장
	 * @return					진척율 리스트 return
	 */
	List<Progress> selectProgressRateList(String srNo);

	Progress selectProgressRate(int progNo);
	
	
}
