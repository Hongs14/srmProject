package com.team01.webapp.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public void noticeFileUpload(NoticeFile noticeFile) {
		log.info("실행");
		noticeRepository.noticeFileUpload(noticeFile);
		
	}
	
	//게시글 상세조회
	@Override
	public Notice noticeDetail(int ntcNo) {
		log.info("실행");
		Notice notice = noticeRepository.detail(ntcNo);
		return notice;
	}
	
	//게시글 조회수
	@Transactional
	public void inqCnt(int ntcNo) {
		log.info("실행");
		noticeRepository.inqCnt(ntcNo);
	}
	
	//게시글 수정
	@Override
	public void noticeUpdate(Notice notice) {
		log.info("실행");
		int ntcNo = notice.getNtcNo();
		String ntcCn = notice.getNtcCn();
		noticeRepository.update(ntcNo,ntcCn);
		
	}
	@Override
	public void noticeUpdate(Notice notice,NoticeFile noticeFile) {
		log.info("실행");
		int ntcNo = notice.getNtcNo();
		String ntcCn = notice.getNtcCn();
		noticeRepository.update(ntcNo,ntcCn);
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
				noticeRepository.noticeFileUpdateUpload(noticeFile);
				System.out.println("첨부파일 수정 업로드  실행" );
			}
		}
		
		
	}

	//게시글 삭제
	@Override
	public void noticeDelete(int ntcNo) {
		log.info("실행");
		noticeRepository.delete(ntcNo);
	}

}
