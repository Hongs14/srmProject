package com.team01.webapp.qnaboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team01.webapp.model.QSTN;
import com.team01.webapp.model.QSTNComment;
import com.team01.webapp.qnaboard.dao.IQnaboardRepository;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Service
public class QnaboardService implements IQnaboardService {
	
	@Autowired
	public IQnaboardRepository qnaboardRepository;

	@Override
	public int countTotalRow() {
		int totalrow = qnaboardRepository.totalRow();
		return totalrow;
	}
	
	@Override
	public List<QSTN> getList(Pager pager) {
		List<QSTN> list = qnaboardRepository.selectQnaboardList(pager);
		return list;
	}

	@Override
	public QSTN getDetail(int qstnNo) {
		//게시물 상세
		QSTN qstn = qnaboardRepository.getDetail(qstnNo);
		
		//댓글 개수
		int countCmnt = qnaboardRepository.countComment(qstnNo);
		
		qstn.setCountCmnt(countCmnt);
		return qstn;
	}

	@Override
	public QSTNComment writeComment(QSTNComment qComment) {
		qnaboardRepository.writeComment(qComment);
		qComment = qnaboardRepository.getComment();
		return qComment;
	}

	@Override
	public List<QSTNComment> getCommentList(int qstnNo) {
		List<QSTNComment> list = qnaboardRepository.getCommentList(qstnNo);
		return list;
	}

	@Override
	public void updateComment(QSTNComment qComment) {
		qnaboardRepository.updateComment(qComment);
	}

	@Override
	public void deleteComment(int qstnCmntNo) {
		qnaboardRepository.deleteComment(qstnCmntNo);
		
	}

	@Override
	public void writeQSTN(QSTN qstn) {
		qnaboardRepository.insertQSTN(qstn);
	}

	

	
}
