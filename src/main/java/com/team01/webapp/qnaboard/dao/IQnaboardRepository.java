package com.team01.webapp.qnaboard.dao;

import java.util.List;

import com.team01.webapp.qnaboard.dto.Qnaboard;
import com.team01.webapp.util.Pager;

public interface IQnaboardRepository {
	public List<Qnaboard> selectQnaboardList(Pager pager);
	public int totalRow();
	
}
