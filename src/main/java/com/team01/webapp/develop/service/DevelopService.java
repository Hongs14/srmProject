package com.team01.webapp.develop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.team01.webapp.develop.dao.IDevelopRepository;
import com.team01.webapp.model.HR;
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

	@Override
	public int updateDevelop(SrDevelopDto srDevelop) {
		 int result = developRepository.updateSr(srDevelop);
		 return result;
	}

	@Override
	public List<Users> selectDeveloperList(String userDpNm) {
		List<Users> list = developRepository.selectDeveloperByDp(userDpNm);
		
		for(int i=0; i<list.size();i++) {
			List<HR> worklist = developRepository.hrlist(userDpNm, list.get(i).getUserNo());
			list.get(i).setDevList(worklist);
		}
		return list;
	}

	@Override
	public List<Users> selectDevName(List<Integer> userNo) {
		List<Users> user = developRepository.selecNameByNo(userNo);
		return user;
	}



}
