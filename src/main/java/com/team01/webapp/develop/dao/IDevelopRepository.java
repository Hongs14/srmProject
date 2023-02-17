package com.team01.webapp.develop.dao;

import java.util.List;

import com.team01.webapp.model.SR;
import com.team01.webapp.model.SrDevelopDto;
import com.team01.webapp.util.Pager;

public interface IDevelopRepository {

	public int totalRow();
	public List<SR> selectDevelopList(Pager pager);
	public SrDevelopDto selectDevelopContent(String srNo);
	
}
