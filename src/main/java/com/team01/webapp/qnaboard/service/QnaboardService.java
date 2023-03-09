package com.team01.webapp.qnaboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.team01.webapp.model.Notice;
import com.team01.webapp.model.NoticeFile;
import com.team01.webapp.model.QSTN;
import com.team01.webapp.model.QSTNComment;
import com.team01.webapp.model.QSTNFile;
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
		log.info("페이징");
		int totalList = (int) qnaboardRepository.totalRow(qstn);
		log.info(totalList);
		pager = new Pager(10,5,totalList,pageNo);
		log.info(pager);
		return pager;
	}
	
	@Override
	public List<QSTN> getQstnList(Pager pager, QSTN qstn){
		
		int start = (pager.getPageNo()-1)* pager.getRowsPerPage()+1;
		int end = pager.getPageNo() * pager.getRowsPerPage();
		
		qstn.setStartRowNo(start);
		qstn.setEndRowNo(end);
		log.info(qstn);
		List<QSTN> list = qnaboardRepository.selectQstnList(qstn);
		
		return list;
	}
	
	/* Qna 상세보기
	 * @author			정홍주
	 * @param qstnNo	해당 질문 번호
	 */
	@Override
	public QSTN getDetail(int qstnNo) {
		//게시물 상세
		QSTN qstn = qnaboardRepository.selectDetail(qstnNo);
		
		//조회수
		int countInq = qnaboardRepository.countInqCnt(qstnNo);
		
		return qstn;
	}
	
	/* 상세조회 첨부파일 읽어오기
	 * @author			정홍주
	 * @param qstnNo	해당 질문 번호
	 */
	@Override
	public List<MultipartFile> getQstnFileDetail(int qstnNo) {
		List<MultipartFile> qstnFile = qnaboardRepository.selectQstnFileDetail(qstnNo);
		return qstnFile;
	}
	
	/* 첨부파일 다운로드
	 * @author				정홍주
	 * @param qstnFileNo	해당 파일 번호
	 */
	@Override
	public QSTNFile selectFiledownload(int qstnFileNo) {
		QSTNFile qstnFile = qnaboardRepository.selectFileDownload(qstnFileNo);
		return qstnFile;
	}
	
	/* 댓글수 증가하기
	 * @author			정홍주
	 * @param qstnNo	해당 질문 번호
	 */
	@Override
	public int countInq(int qstnNo) {
		//댓글 개수
		int countCmnt = qnaboardRepository.countComment(qstnNo);
		return countCmnt;
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
	public void qstnFileUpload(QSTN qstn) {
		log.info("실행");
		qnaboardRepository.insertQstnFileUpload(qstn);
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
