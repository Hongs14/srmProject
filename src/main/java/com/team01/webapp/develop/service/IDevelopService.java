package com.team01.webapp.develop.service;

import java.util.List;

import com.team01.webapp.model.HR;
import com.team01.webapp.model.SR;
import com.team01.webapp.model.SrDevelopDto;
import com.team01.webapp.util.Pager;

public interface IDevelopService {
	
	public int totalRow();
	public List<SR> getDevelopList(Pager pager);
	public SrDevelopDto getDetail(String srNo);
	public List<HR> getDevelopList();
	public void updateSR(SrDevelopDto srDevelop);

}
