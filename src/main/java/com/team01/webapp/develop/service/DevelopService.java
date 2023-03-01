package com.team01.webapp.develop.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team01.webapp.develop.dao.IDevelopRepository;
import com.team01.webapp.model.DevelopFilter;
import com.team01.webapp.model.Examine;
import com.team01.webapp.model.ExamineList;
import com.team01.webapp.model.HR;
import com.team01.webapp.model.Progress;
import com.team01.webapp.model.SR;
import com.team01.webapp.model.SRStts;
import com.team01.webapp.model.SrFile;
import com.team01.webapp.model.DevelopDto;
import com.team01.webapp.model.System;
import com.team01.webapp.model.Users;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class DevelopService implements IDevelopService{

	@Autowired
	private IDevelopRepository developRepository;
	
	/** 페이지 정보 저장
	 * 
	 * @author					정홍주
	 * @param pageNo			현재 Page 번호 
	 * @param pager				pager 객체
	 * @param developDto		클라이언트가 보낸 필터링 후 데이터 정보 저장
	 * @return					Pager 객체 return
	 */
	@Override
	public Pager returnPage(int pageNo, Pager pager, DevelopDto developDto) {
		int totalRow = developRepository.totalRow(developDto);
		log.info(totalRow);
		pager = new Pager(10,5,totalRow,pageNo);
		return pager;
	}
	
	/**
	 * SR 검토 검색 조건에 대한 리스트 
	 * @author				정홍주
	 * @param developFilter	검색 조건에 대한 해당 리스트 가져오기
	 * @return
	 */
	public DevelopFilter filterList(DevelopFilter developFilter) {
		List<SRStts> srSttsList = new ArrayList<>();
		List<System> sysNmList = new ArrayList<>();
		List<Users> userOgdpList = new ArrayList<>();
		List<Users> userDpList = new ArrayList<>();
		
		//요청 진행상태
		srSttsList = developRepository.selectSrSttsList();
		developFilter.setSrSttsList(srSttsList);
		
		//관련 시스템
		sysNmList = developRepository.selectSysNmList();
		developFilter.setSysNmList(sysNmList);
		
		//등록자 소속 
		userOgdpList = developRepository.selectUserOgdpList();
		developFilter.setUserOgdpList(userOgdpList);
		
		//등록자 부서
		userDpList = developRepository.selectDevDpList();
		developFilter.setSrDevDpList(userDpList);
		
		log.info(developFilter);
		return developFilter;
	}
	
	/**
	 * SR 개발 리스트 가져오기
	 * @author				정홍주
	 * @param examinelist	SR리스트 가져오기
	 * @param pager			페이징 처리
	 * @return
	 */
	@Override
	public List<DevelopDto> getDevelopList(Pager pager, DevelopDto developDto) {
		int end = pager.getPageNo() * pager.getRowsPerPage();
		int start = (pager.getPageNo()-1)* pager.getRowsPerPage()+1;
		developDto.setStartRowNo(end);
		developDto.setEndRowNo(start);
		
		List<DevelopDto> list = developRepository.selectDevelopList(developDto);
		log.info(list);
		return list;
	}

	/** SR개발 상세보기
	* @author 		정홍주
	* @param srNo	가져올 srNO
	* @return		List<Users> 리턴
	*/
	@Override
	public DevelopDto getDetail(String srNo) {
		DevelopDto srDdto = developRepository.selectDevelopContent(srNo);
		List<SrFile> srFile = developRepository.selectSrFileList(srNo);
		return srDdto;
	}
	
	/** SR개발 상세보기
	* @author 			정홍주
	* @param srFileNo	첨부파일 번호
	*/
	@Override
	public SrFile getSrFile(int srFileNo) {
		SrFile file = developRepository.selectSrFile(srFileNo);
		return file;
	}

	/** 전체 개발자 조회
	* @author 		 정홍주
	* @return		List<Users> 리턴
	*/
	@Override
	public List<Users> getDevelopList() {
		List<Users> devlist = developRepository.devList();
		return devlist;
	}
	
	/** 개발 담당자 선택
	 * @author 			 정홍주
	 * @param userNo	
	 * @return			개발 담당자의 정보 가져오기
	 */
	@Override
	public List<Users> selectDevName(int userNo) {
		log.info("개발담당자 선택");
		List<Users> user = developRepository.selectNameByNo(userNo);
		return user;
	}

	@Transactional
	public int updateDevelopSr(DevelopDto srDevelop) {
		log.info("개발계획 수정");
		int result = developRepository.updateSr(srDevelop);
		return result;
	}
	
	/** 개발자 리스트 불러오기(모달창)
	 * @author 			 정홍주
	 * @param userDpNm	
	 * @param userNo
	 * @param sDate
	 * @param eDate	
	 * @return			개발 담당자의 정보 가져오기
	 */
	@Override
	public List<Users> selectDeveloperList(String userDpNm, int userNo, String sDate, String eDate) {
		log.info("개발자 리스트 띄우기");
		
		List<Users> list = developRepository.selectDeveloperByDp(userDpNm, userNo);
		log.info(list);
		for(int i=0; i<list.size();i++) {

			LocalDate ld = LocalDate.parse(sDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			LocalDate ld2 = LocalDate.parse(eDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			java.sql.Date hrStartDate = java.sql.Date.valueOf(ld);
			java.sql.Date hrEndDate = java.sql.Date.valueOf(ld2);
			List<HR> worklist = developRepository.hrlist(userDpNm, list.get(i).getUserNo(), hrStartDate, hrEndDate);
			list.get(i).setDevList(worklist);
		}
		return list;
	}
	
	@Transactional
	public int insertHrList(List<HR> hr) {
		log.info("HR리스트 삽입");
		int row =developRepository.insertHrRow(hr);
		insertProgress(hr.get(0).getSrNo());
		return row;
	}
	
	public int insertProgress(String srNo){
		log.info("Progress리스트 insert");
		int srSeq = 0;
		List<Progress> progNoList = new ArrayList<>();
		srSeq = (developRepository.selectMaxpRrogNo()+1);		
		
		for(int i=0;i<6;i++) {
			Progress progress = new Progress();
			String progNo = "PROG-"+srSeq;
			progress.setProgNo(progNo);
			progress.setSrNo(srNo);
			progNoList.add(progress);
			log.info(progress);
			srSeq++;
		}
		
		int row = developRepository.insertProg(progNoList);

		return row;
	}

}
