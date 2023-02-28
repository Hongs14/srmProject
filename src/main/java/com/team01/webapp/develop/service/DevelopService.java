package com.team01.webapp.develop.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team01.webapp.develop.dao.IDevelopRepository;
import com.team01.webapp.model.HR;
import com.team01.webapp.model.Progress;
import com.team01.webapp.model.SR;
import com.team01.webapp.model.SrDevelopDto;
import com.team01.webapp.model.Users;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class DevelopService implements IDevelopService{

	@Autowired
	private IDevelopRepository developRepository;
	

	 /** 전체 행수 세기
	 * @author 		 정홍주
	 * @return		develop/selectHr jsp 반환
	 */
	@Override
	public int totalRow() {
		 int totalRow = developRepository.totalRow();
		 return totalRow;
	}
	
	@Override
	public List<SR> getDevelopList(Pager pager) {
		List<SR> list = developRepository.selectDevelopList(pager);
		return list;
	}

	@Override
	public SrDevelopDto getDetail(String srNo) {
		SrDevelopDto srDdto = developRepository.selectDevelopContent(srNo);
		return srDdto;
	}

	@Override
	public List<Users> getDevelopList() {
		List<Users> devlist = developRepository.devList();
		return devlist;
	}

	//--------------------------------------------------------------------------------------
	@Transactional
	public List<Users> updateDevelopSr(SrDevelopDto srDevelop, int userNo) {
		log.info("개발계획 수정");
		List<Users> userList = new ArrayList<Users>();
		int result = developRepository.updateSr(srDevelop);
		
		Date date1 = srDevelop.getSrStartDate();
		Date date2 = srDevelop.getSrStartDate();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String sDate = format.format(date1);
		String eDate = format.format(date2);
		 
		if(result == 1) {
			userList = selectDeveloperList(srDevelop.getSrDevDp(), userNo , sDate, eDate);
			log.info("AAAAAAAAAAAAAAAAAA"+userList);
		 }
		 
		 return userList;
	}
	
	@Override
	public List<Users> selectDeveloperList(String userDpNm, int userNo, String sDate, String eDate) {
		log.info("개발자 리스트 띄우기");
		List<Users> list = developRepository.selectDeveloperByDp(userDpNm, userNo);
		
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
		return row;
	}
	
	public int insertProgress(){
		log.info("Progress리스트 insert");
		int srSeq = 0;
		List<Progress> progNoList = new ArrayList<>();
		srSeq = (developRepository.selectMaxpRrogNo()+1);		
		
		for(int i=0;i<6;i++) {
			Progress progress = new Progress();
			String progNo = "PROG-"+srSeq;
			progress.setProgNo(progNo);
			progNoList.add(progress);
			srSeq++;
		}
		System.out.println(progNoList.toString());
		
		int row = developRepository.insertProg(progNoList);

		return 1;
	}
	//-----------------------------------------------------------------------------------------
	
	

	@Override
	public List<Users> selectDevName(int userNo) {
		log.info("개발담당자 선택");
		List<Users> user = developRepository.selectNameByNo(userNo);
		return user;
	}


}
