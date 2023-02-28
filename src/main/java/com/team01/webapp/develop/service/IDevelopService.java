package com.team01.webapp.develop.service;

import java.util.List;

import com.team01.webapp.model.DevelopFilter;
import com.team01.webapp.model.HR;
import com.team01.webapp.model.Progress;
import com.team01.webapp.model.SR;
import com.team01.webapp.model.SrDevelopDto;
import com.team01.webapp.model.Users;
import com.team01.webapp.util.Pager;

public interface IDevelopService {
	
	public int totalRow();
	public List<SR> getDevelopList(Pager pager);
	public SrDevelopDto getDetail(String srNo);
	
	public List<Users> getDevelopList();
	public int updateDevelopSr(SrDevelopDto srDevelop);
	public List<Users> selectDeveloperList(String userDpNm, int userNo, String hrStartDate, String hrEndDate);
	
	public List<Users> selectDevName(int userNo);
	public int insertHrList(List<HR> listHR);
	public DevelopFilter filterList(DevelopFilter developFilter);

}
