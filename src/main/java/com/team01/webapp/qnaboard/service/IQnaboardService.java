package com.team01.webapp.qnaboard.service;

import java.util.List;

import com.team01.webapp.model.QSTN;
import com.team01.webapp.model.QSTNComment;


public interface IQnaboardService {
	
	public List<QSTN> getList();
	public QSTN getDetail(int qstnNo);

	public void writeComment(QSTNComment qComment);

	
}
