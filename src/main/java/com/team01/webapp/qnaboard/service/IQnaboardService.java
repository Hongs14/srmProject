package com.team01.webapp.qnaboard.service;

import java.util.List;

import com.team01.webapp.model.QSTN;


public interface IQnaboardService {
	
	public List<QSTN> getList();

	public QSTN getDetail(int qstnNo);

	
}
