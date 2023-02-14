package com.team01.webapp.notice.service;

import java.util.List;

import com.team01.webapp.model.Notice;
import com.team01.webapp.model.NoticeFile;
import com.team01.webapp.util.Pager;

public interface INoticeService {
	//게시글 수
	public int getTotalRows();
	//게시글 목록 가져오기
	public List<Notice> getNoticeList(Pager pager);
	//게시글 작성
	public void noticeWrite(Notice notice);
	//게시글 첨부파일
	public NoticeFile noticeFileUpload(Notice notice);
	//게시글 상세조회
	public Notice noticeDetail(int ntcNo);

}
