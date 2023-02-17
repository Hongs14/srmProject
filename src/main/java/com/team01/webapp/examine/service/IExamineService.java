package com.team01.webapp.examine.service;

import java.util.List;

import com.team01.webapp.model.Examine;
import com.team01.webapp.model.ExamineFilter;
import com.team01.webapp.model.ExamineList;
import com.team01.webapp.model.SrProgressAjax;
import com.team01.webapp.util.Pager;

public interface IExamineService {

	public int getTotalRows();
	public ExamineFilter filterList(ExamineFilter examineFilter);
	public List<Examine> getExamineList(Pager pager,ExamineList examinelist);
	
	public  Pager returnPage(int pageNo, Pager pager, ExamineList examinelist);
	
}
