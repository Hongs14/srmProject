package com.team01.webapp.qnaboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.team01.webapp.model.QSTN;
import com.team01.webapp.model.QSTNComment;
import com.team01.webapp.model.QSTNFile;
import com.team01.webapp.qnaboard.dao.IQnaboardRepository;
import com.team01.webapp.util.Pager;

/**
 * @author KOSA
 *
 */
@Service
public class QnaboardService implements IQnaboardService {
	
	@Autowired
	public IQnaboardRepository qnaboardRepository;
	

	@Override
	public Pager returnPage(int pageNo, Pager pager, QSTN qstn) {
		int totalList = (int) qnaboardRepository.totalRow(qstn);
		pager = new Pager(10,5,totalList,pageNo);
		return pager;
	}
	
	/* Qna 목록
	 * @author		정홍주
	 * @param pager	
	 * @param qstn	해당 질문 번호
	 */
	@Override
	public List<QSTN> getQstnList(Pager pager, QSTN qstn){
		
		int start = (pager.getPageNo()-1)* pager.getRowsPerPage()+1;
		int end = pager.getPageNo() * pager.getRowsPerPage();
		
		qstn.setStartRowNo(start);
		qstn.setEndRowNo(end);
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
	
	/* 댓글수 
	 * @author			정홍주
	 * @param qstnNo	해당 질문 번호
	 */
	@Override
	public int countComment(int qstnNo) {
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
	public void qstnFileUpload(QSTNFile qstnFile) {
		qnaboardRepository.insertQstnFileUpload(qstnFile);
	}
	
	
	@Override
	public int changeQstn(QSTN qstn) {
		int result = 0;
		qnaboardRepository.updateQstn(qstn);
		return result;
	}
	
	@Override
	public int changeQstnFile(QSTNFile qstnFile) {
		int result = 0;
		result = qnaboardRepository.insertQstnFileUpload(qstnFile);
		return result;
	}
	
	@Override
	public int EraseExistingFile(String qstnFilePhysNm) {
		int result = 0;
		qnaboardRepository.deleteExistingFile(qstnFilePhysNm);
		return result;
	}
	
	
	/* Q&A삭제
	 * @param qstnNo Qna번호
	 */
	public int eraseQstn(int qstnNo) {
		int result = 0;
		qnaboardRepository.deleteQstn(qstnNo);
		return result;
	}

	/* Q&A작성
	 * @author			정홍주
	 * @param qComment 	댓글 객체
	 */
	@Override
	public QSTNComment writeComment(QSTNComment qComment) {
		qnaboardRepository.insertComment(qComment);
		qComment = qnaboardRepository.selectComment();
		return qComment;
	}
	
	
	/* 댓글 목록 불러오기
	 * @author			정홍주
	 * @param qstnNo 	게시글 번호
	 */
	@Override
	public List<QSTNComment> getCommentList(int qstnNo) {
		List<QSTNComment> list = qnaboardRepository.selectCommentList(qstnNo);
		return list;
	}
	
	/* 댓글 수정하기
	 * @author			정홍주
	 * @param qComment 	
	 */
	@Override
	public void updateComment(QSTNComment qComment) {
		qnaboardRepository.updateComment(qComment);
	}

	/* 댓글 삭제하기
	 * @author				정홍주
	 * @param qstnCmntNo 	댓글 번호	
	 */
	@Override
	public void deleteComment(int qstnCmntNo) {
		qnaboardRepository.deleteComment(qstnCmntNo);
		
	}
	
}
