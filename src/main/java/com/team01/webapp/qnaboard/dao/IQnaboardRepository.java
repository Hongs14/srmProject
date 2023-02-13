package com.team01.webapp.qnaboard.dao;

import java.util.List;

import com.team01.webapp.model.QSTN;
import com.team01.webapp.util.Pager;

public interface IQnaboardRepository {
	public List<QSTN> selectQnaboardList(Pager pager);
	public int totalRow();
	
}
