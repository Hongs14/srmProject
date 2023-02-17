package com.team01.webapp.qnaboard.service;

import java.util.List;

import com.team01.webapp.model.QSTN;
import com.team01.webapp.model.QSTNComment;
import com.team01.webapp.util.Pager;


public interface IQnaboardService {
	
	public List<QSTN> getList(Pager pager);
	public int countTotalRow();
	
	public QSTN getDetail(int qstnNo);

	public void writeComment(QSTNComment qComment);
	public List<QSTNComment> getCommentList(int qstnNo);
	

	
}
