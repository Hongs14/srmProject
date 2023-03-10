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
import com.team01.webapp.model.UpdateDevelop;
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
		List<SR> srDevdpList = new ArrayList<>();
		
		//요청 진행상태
		srSttsList = developRepository.selectSrSttsList();
		developFilter.setSrSttsList(srSttsList);
		
		//관련 시스템
		sysNmList = developRepository.selectSysNmList();
		developFilter.setSysNmList(sysNmList);
		
		//등록자 소속 
		userOgdpList = developRepository.selectUserOgdpList();
		developFilter.setUserOgdpList(userOgdpList);
		
		//개발자 부서
		srDevdpList = developRepository.selectDevDpList();
		developFilter.setSrDevDpList(srDevdpList);
		
		return developFilter;
	}
	
	/** SR 개발 리스트 가져오기
	 * @author				정홍주
	 * @param examinelist	SR리스트 가져오기
	 * @param pager			페이징 처리
	 * @return
	 */
	@Override
	public List<DevelopDto> getDevelopList(Pager pager, DevelopDto developDto) {
		int start = (pager.getPageNo()-1)* pager.getRowsPerPage()+1;
		int end = pager.getPageNo() * pager.getRowsPerPage();
		
		developDto.setStartRowNo(start);
		developDto.setEndRowNo(end);
		List<DevelopDto> list = developRepository.selectDevelopList(developDto);
		return list;
	}
	
	@Override
	public Users getLoginUserInfo(int userNo) {
		Users info = developRepository.selectLoginUser(userNo);
		return info;
	}

	/** SR개발 상세보기
	* @author 		정홍주
	* @param srNo	가져올 srNO
	* @return		List<Users> 리턴
	*/
	@Override
	public DevelopDto getDetail(String srNo) {
		DevelopDto srDdto = developRepository.selectDevelopContent(srNo);
		List<SrFile> fileList = developRepository.selectSrFileList(srNo);
		srDdto.setSrDevelopFile(fileList);
		return srDdto;
	}
	
	@Override
	public List<HR> selectHrList(String srNo) {
		List<HR> hrlist = developRepository.selectHrList(srNo);
		return hrlist;
	}
	
	/** 파일 읽어오기
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
	
	@Override
	public Users getLeader(String srNo) {
		log.info("개발담당자 불러오기");
		Users user = developRepository.selectLeader(srNo);
		return user;
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
	

	/** 개발계획 및 인력 추가 
	 * @author 			 	정홍주
	 * @param updateDevelop	SR개발관리 업데이트
	 * @return				개발 담당자의 정보 가져오기
	 */
	@Transactional
	public int updateDevelopSr(UpdateDevelop updateDevelop) {
		try {
			int check = developRepository.checkHr(updateDevelop.getSrNo());
			log.info(check);
			int result1 = developRepository.updateSr(updateDevelop);
			int result3 = 0;
			log.info("개발계획 수정 result1: "+result1); 
			
			List<HR> listHR = new ArrayList<>();
			for(int i=0; i<updateDevelop.getUserNo().length; i++) {
				HR hr = new HR();
				hr.setSrNo(updateDevelop.getSrNo());
				hr.setUserNo((int)updateDevelop.getUserNo()[i]);
				hr.setTaskNo((int)updateDevelop.getTaskNo()[i]);
				hr.setHrStartDate(updateDevelop.getHrStartDate()[i]);
				hr.setHrEndDate(updateDevelop.getHrEndDate()[i]);
				hr.setHrLeader(updateDevelop.getHrLeader()[i]);
				listHR.add(hr);
			}
			log.info(listHR);
			
			if(check > 0) {
				int result2 = developRepository.deleteHr(updateDevelop.getSrNo());
				log.info("HR리스트 삭제 result2: "+ result2);
				result3 =developRepository.insertHrRow(listHR);
				log.info("HR리스트 삽입 result3: "+ result3);
			} else {
				int result2 =developRepository.insertHrRow(listHR);
				log.info("HR리스트 삽입 result2: "+ result2);
				
				if(updateDevelop.getSttsNo() == 5) {
					result3 = insertProgress(updateDevelop.getSrNo());
					log.info("progress삽입 완료");
				}
				log.info("Progress 삽입 result3"+result3);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return 1;
	}
	
	@Transactional
	public int insertProgress(String srNo){
		int row = 0;
		try {
			log.info("Progress리스트 insert"+ srNo);
			int srSeq = 0;
			List<Progress> progNoList = new ArrayList<>();
			srSeq = developRepository.selectMaxProgNo()+1;		
			
			for(int i=0; i<6; i++) {
				Progress progress = new Progress();
				String progNo = "PROG-"+srSeq;
				progress.setProgNo(progNo);
				progress.setSrNo(srNo);
				progress.setProgType(i+1);
				progNoList.add(progress);
				log.info(progress);
				srSeq++;
			}
		
			row = developRepository.insertProg(progNoList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return row;
	}

	/**엑셀파일 다운로드
	 * @author				정홍주, 김태희
	 * @param developSRArr	SR번호를 저장
	 * @return				
	 */
	@Override
	public List<DevelopDto> getPrintExcelList(List<String> developSRArr) {
		List<DevelopDto> list =	new ArrayList<>();
		DevelopDto develop = null;
		for(int i=0; i<developSRArr.size(); i++){
			develop = developRepository.selectDevelopContent(developSRArr.get(i));
			list.add(develop);
		}
		log.info(list);
		return list;
	}

}
