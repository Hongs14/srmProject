package com.team01.webapp.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.webapp.model.Notice;
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
	
	//게시글 수
	@Override
	public int getTotalRows() {
		log.info("실행");
		int rows = noticeRepository.count();
		return rows;
	}
	
	//게시글 목록 가져오기
	@Override
	public List<Notice> getNoticeList(Pager pager) {
		log.info("실행");
		
		List<Notice> list = noticeRepository.list(pager);
		
		return list;
	}
	
	//게시글 작성
	@Override
	public void noticeWrite(Notice notice) {
		log.info("실행");
		int noticeWrite = noticeRepository.write(notice);
	}
	//첨부파일
	@Override
	public NoticeFile noticeFileUpload(Notice notice) {
		log.info("실행");
		NoticeFile fileUpload = noticeRepository.noticeFileUpload(notice);
		
		return fileUpload;
	}
	
	//게시글 상세조회
	@Override
	public Notice noticeDetail(int ntcNo) {
		log.info("실행");
		Notice notice =(Notice) noticeRepository.detail(ntcNo);
		
		return notice;
	}


}
