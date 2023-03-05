package com.team01.webapp.qnaboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team01.webapp.model.Notice;
import com.team01.webapp.model.QSTN;
import com.team01.webapp.model.QSTNComment;
import com.team01.webapp.qnaboard.dao.IQnaboardRepository;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class QnaboardService implements IQnaboardService {
	
	@Autowired
	public IQnaboardRepository qnaboardRepository;
	

	@Override
	public Pager returnPage(int pageNo, Pager pager, QSTN qstn) {
		int totalList = (int) qnaboardRepository.totalRow(qstn);
		log.info(totalList);
		pager = new Pager(10,5,totalList,pageNo);
		return pager;
	}
	
	@Override
	public List<QSTN> getQstnList(Pager pager, QSTN qstn){
		log.info("실행");
		qstn.setStartRowNo(pager.getStartRowNo());
		qstn.setEndRowNo(pager.getEndRowNo());
		List<QSTN> list = qnaboardRepository.selectQstnList(qstn);
		
		return list;
	}

	@Override
	public QSTN getDetail(int qstnNo) {
		//게시물 상세
		QSTN qstn = qnaboardRepository.selectDetail(qstnNo);
		
		//댓글 개수
		int countCmnt = qnaboardRepository.countComment(qstnNo);
		
		qstn.setCountCmnt(countCmnt);
		return qstn;
	}
	
	/* QnA게시글 작성
	 * @author	정홍주
	 * @param qstn
	 */
	@Override
	public int writeQSTN(QSTN qstn) {
		int result = qnaboardRepository.insertQSTN(qstn);
		return result;
	}

	@Override
	public QSTNComment writeComment(QSTNComment qComment) {
		qnaboardRepository.insertComment(qComment);
		qComment = qnaboardRepository.selectComment();
		return qComment;
	}

	@Override
	public List<QSTNComment> getCommentList(int qstnNo) {
		List<QSTNComment> list = qnaboardRepository.selectCommentList(qstnNo);
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

	
}
