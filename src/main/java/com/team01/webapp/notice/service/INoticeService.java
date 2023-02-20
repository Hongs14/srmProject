package com.team01.webapp.notice.service;

import java.util.List;

import com.team01.webapp.model.Notice;
import com.team01.webapp.model.NoticeFile;
import com.team01.webapp.util.Pager;

public interface INoticeService {
	/**
	 * 공지사항 리스트 수
	 * @author : 황건희
	 * @return
	 */
	public int getTotalRows();

	/**
	 * 공지사항 리스트
	 * @author : 황건희
	 * @param pager 공지사항 페이징 처리
	 * @return
	 */
	public List<Notice> getNoticeList(Pager pager);
	
	/**
	 * 공지사항 작성
	 * @author : 황건희
	 * @param notice 공지사항 정보
	 */
	public void noticeWrite(Notice notice);
	
	
	/**
	 * 공지사항 첨부파일
	 * @author : 황건희
	 * @param noticeFile 공지사항 작성 시 첨부한 파일
	 */
	public void noticeFileUpload(NoticeFile noticeFile);
	
	
	/**
	 * 공지사항 상세 조회
	 * @author : 황건희
	 * @param ntcNo 해당 공지사항의 No
	 * @return
	 */
	public Notice noticeDetail(int ntcNo);
	
	
	/**
	 * 공지사항 조회수
	 * @author : 황건희
	 * @param ntcNo	해당 공지사항의 조회수
	 */
	public void inqCnt(int ntcNo);
	
	/**
	 * 공지사항 수정
	 * @author : 황건희
	 * @param notice		수정된 공지사항 정보
	 * @param noticeFile	수정된 공지사항 첨부파일
	 */
	public void noticeUpdate(Notice notice);
	public void noticeUpdate(Notice notice, NoticeFile noticeFile);
	
	/**
	 * 공지사항 삭제
	 * @author : 황건희
	 * @param ntcNo	삭제하려는 공지사항 No
	 */
	public void noticeDelete(int ntcNo);

}
