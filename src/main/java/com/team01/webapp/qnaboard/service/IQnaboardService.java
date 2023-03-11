package com.team01.webapp.qnaboard.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.team01.webapp.model.QSTN;
import com.team01.webapp.model.QSTNComment;
import com.team01.webapp.model.QSTNFile;
import com.team01.webapp.util.Pager;


public interface IQnaboardService {
	
	public List<QSTN> getQstnList(Pager pager, QSTN qstn);
	public Pager returnPage(int pageNo, Pager pager, QSTN qstn);
	
	public QSTN getDetail(int qstnNo);

	public QSTNComment writeComment(QSTNComment qComment);
	public List<QSTNComment> getCommentList(int qstnNo);
	public void updateComment(QSTNComment qComment);
	public void deleteComment(int qstnCmntNo);
	public int writeQSTN(QSTN qstn);
	
	public int countInq(int qstnNo);
	public List<MultipartFile> getQstnFileDetail(int qstnNo);
	public QSTNFile selectFiledownload(int qstnNo);
	public void qstnFileUpload(QSTN qstn);

	
	

	
}
