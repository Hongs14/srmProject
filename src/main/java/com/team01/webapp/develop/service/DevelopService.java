package com.team01.webapp.develop.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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

@Service
public class DevelopService implements IDevelopService{

	@Autowired
	private IDevelopRepository developRepository;
	
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

	@Transactional
	public int updateDevelopSr(SrDevelopDto srDevelop) {
		 int result = developRepository.updateSr(srDevelop);
		 return result;
	}

	@Override
	public List<Users> selectDeveloperList(String userDpNm, int userNo, String sDate, String eDate) {
		
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

	@Override
	public List<Users> selectDevName(int userNo) {
		//개발담당자 
		List<Users> user = developRepository.selectNameByNo(userNo);
		return user;
	}

	@Transactional
	public int insertHrList(List<HR> hr) {
		int row =developRepository.insertHrRow(hr);
		return row;
	}
	
	public int insertProgress(){
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

	@Override
	public int updateDevelop(SrDevelopDto srDevelop) {
		// TODO Auto-generated method stub
		return 0;
	}


}
