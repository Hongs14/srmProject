package com.team01.webapp.examine.service;

import java.util.List;

import com.team01.webapp.model.Examine;
import com.team01.webapp.model.ExamineFilter;
import com.team01.webapp.model.ExamineList;
import com.team01.webapp.util.Pager;

public interface IExamineService {

	public int getTotalRows();
	public List<Examine> getExamineList(Pager pager,int sttsNo);
	
	public ExamineFilter filterList(ExamineFilter examineFilter);
}
