package com.team01.webapp.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team01.webapp.model.Notice;
import com.team01.webapp.model.NoticeComment;
import com.team01.webapp.model.NoticeFile;
import com.team01.webapp.notice.dao.INoticeRepository;
import com.team01.webapp.notice.service.INoticeService;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class NoticeService implements INoticeService{

	@Autowired
	INoticeRepository noticeRepository;
	
	/**
	 * 공지사항 리스트 수
	 * @author : 황건희
	 * @return
	 */
	@Override
	public int getTotalRows() {
		log.info("실행");
		int rows = noticeRepository.selectTotalNoticeListCount();
		return rows;
	}
	
	/**
	 * 공지사항 리스트
	 * @author : 황건희
	 * @param pager 공지사항 페이징 처리
	 * @return
	 */
	@Override
	public List<Notice> getNoticeList(Pager pager) {
		log.info("실행");
		
		List<Notice> list = noticeRepository.selectNoticeList(pager);
		
		return list;
	}
	
	/**
	 * 공지사항 작성
	 * @author : 황건희
	 * @param notice 공지사항 정보
	 */
	@Override
	public void noticeWrite(Notice notice) {
		log.info("실행");
		int noticeWrite = noticeRepository.insertNoticeWrite(notice);
	}
	
	/**
	 * 공지사항 첨부파일
	 * @author : 황건희
	 * @param noticeFile 공지사항 작성 시 첨부한 파일
	 */
	@Override
	public void noticeFileUpload(Notice notice) {
		log.info("실행");
		noticeRepository.insertNoticeFileUpload(notice);
		
	}
	
	/**
	 * 공지사항 상세 조회
	 * @author : 황건희
	 * @param ntcNo 해당 공지사항의 No
	 * @return
	 */
	@Override
	public Notice noticeDetail(int ntcNo) {
		log.info("실행");
		Notice notice = noticeRepository.selectNoticeDetail(ntcNo);
		return notice;
	}
	
	//공지사항 상세조회 첨부파일 읽어오기
	@Override
	public List<NoticeFile> selectNoticeFileDetail(int ntcNo) {
		log.info("실행");
		List<NoticeFile> noticeFile = noticeRepository.selectNoticeFileDetail(ntcNo);
		return noticeFile;
	}
	
	//공지사항 상세조회 첨부파일 다운로드
	@Override
	public NoticeFile selectFiledownload(int ntcFileNo) {
		log.info("실행");
		NoticeFile noticeFile = noticeRepository.selectFileDownload(ntcFileNo);
		
		return noticeFile;
	}
	
	
	/**
	 * 공지사항 조회수
	 * @author : 황건희
	 * @param ntcNo	해당 공지사항의 조회수
	 */
	@Transactional
	public void inqCnt(int ntcNo) {
		log.info("실행");
		noticeRepository.selectInqCnt(ntcNo);
	}
	
	/**
	 * 공지사항 수정
	 * @author : 황건희
	 * @param notice		수정된 공지사항 정보
	 * @param noticeFile	수정된 공지사항 첨부파일
	 */
	@Override
	public void noticeUpdate(Notice notice) {
		log.info("실행");
		int ntcNo = notice.getNtcNo();
		String ntcCn = notice.getNtcCn();
		noticeRepository.updateNotice(ntcNo,ntcCn);
		
	}
	@Override
	public void noticeUpdate(Notice notice,NoticeFile noticeFile) {
		log.info("실행");
		int ntcNo = notice.getNtcNo();
		String ntcCn = notice.getNtcCn();
		noticeRepository.updateNotice(ntcNo,ntcCn);
		System.out.println(noticeFile.getNtcFileActlNm());
		//첨부파일 수정
		if(noticeFile.getNtcFileActlNm() != null && !noticeFile.getNtcFileActlNm().equals("")) {
			if(noticeFile.getNtcFileNo()>0) {
				noticeFile.setNtcNo(ntcNo);
				System.out.println("첨수:"+ntcNo);
				noticeRepository.updateFile(noticeFile);
				System.out.println("첨부파일 수정  실행" );
			}else {
				noticeFile.setNtcNo(ntcNo);
				noticeFile.setNtcFileNo(noticeRepository.selectMaxFileNo()+1);
				noticeRepository.updateNoticeFileUpload(noticeFile);
				System.out.println("첨부파일 수정 업로드  실행" );
			}
		}
		
		
	}

	/**
	 * 공지사항 삭제
	 * @author : 황건희
	 * @param ntcNo	삭제하려는 공지사항 No
	 */
	@Override
	public void noticeDelete(int ntcNo) {
		log.info("실행");
		noticeRepository.delete(ntcNo);
	}
	
	//공지사항 첨부파일 삭제
	@Override
	public int noticeFileDelete(int ntcFileNo) {
		log.info("실행");
		int ntcNo = noticeRepository.deleteFile(ntcFileNo);
		return ntcNo;
	}
	
	
	//댓글 읽기
	@Override
	public List<NoticeComment> getCommentList(int ntcNo) {
		log.info("실행");
		List<NoticeComment> list = noticeRepository.selectNoticeCommentList(ntcNo);
		return list;
	}
	
	//댓글 작성
	@Override
	public NoticeComment writeComment(NoticeComment ntcComment) {
		log.info("실행");
		noticeRepository.insertComment(ntcComment);
		ntcComment = noticeRepository.selectComment();
		return ntcComment;
	}

	//댓글 수정
	@Override
	public void updateComment(NoticeComment ntcComment) {
		log.info("실행");
		noticeRepository.updateComment(ntcComment);
	}

	//댓글 삭제
	@Override
	public void deleteComment(int ntcCmntNo) {
		log.info("실행");
		noticeRepository.deleteComment(ntcCmntNo);
	}
	

	
	

}
