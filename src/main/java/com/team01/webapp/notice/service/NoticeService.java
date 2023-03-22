package com.team01.webapp.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.team01.webapp.model.Notice;
import com.team01.webapp.model.NoticeComment;
import com.team01.webapp.model.NoticeFile;
import com.team01.webapp.notice.dao.INoticeRepository;
import com.team01.webapp.util.Pager;

@Service
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
		int rows = noticeRepository.selectTotalNoticeListCount();
		return rows;
	}
	
	@Override
	public Pager returnPage(int pageNo, Pager pager, Notice notice) {
		int totalListNum = (int) noticeRepository.selectTotalNoticeCount(notice);
		pager = new Pager(10,5,totalListNum,pageNo);
		return pager;
	}
	
	/**
	 * 공지사항 리스트
	 * @author : 황건희
	 * @param pager 공지사항 페이징 처리
	 * @return
	 */
	@Override
	public List<Notice> getNoticeList(Pager pager) {
		List<Notice> list = noticeRepository.selectNoticeList(pager);
		
		return list;
	}
	
	// 필터링 된 공지사항 리스트
	@Override
	public List<Notice> getNoticeListAjax(Pager pager, Notice notice){
		notice.setStartRowNo(pager.getStartRowNo());
		notice.setEndRowNo(pager.getEndRowNo());
		List<Notice> list = noticeRepository.selectFilterNoticeList(notice);
		
		return list;
	}
	
	
	/**
	 * 공지사항 작성
	 * @author : 황건희
	 * @param notice 공지사항 정보
	 */
	@Override
	public void noticeWrite(Notice notice) {
		if(notice.getSysNo().equals("한국소프트")) {
			notice.setSysNo("SRM");
		}else if(notice.getSysNo().equals("북북")) {
			notice.setSysNo("BOK");
		}else if(notice.getSysNo().equals("사슈즈")) {
			notice.setSysNo("SAS");
		}else if(notice.getSysNo().equals("한국대학교")) {
			notice.setSysNo("KOR");
		}else if(notice.getSysNo().equals("오티아이")) {
			notice.setSysNo("OTI");
		}
		
		int noticeWrite = noticeRepository.insertNoticeWrite(notice);
	}
	
	/**
	 * 공지사항 첨부파일
	 * @author : 황건희
	 * @param noticeFile 공지사항 작성 시 첨부한 파일
	 */
	@Override
	public void noticeFileUpload(Notice notice) {
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
		Notice notice = noticeRepository.selectNoticeDetail(ntcNo);
		return notice;
	}
	
	//공지사항 상세조회 첨부파일 읽어오기
	@Override
	public List<MultipartFile> selectNoticeFileDetail(int ntcNo) {
		List<MultipartFile> noticeFile = noticeRepository.selectNoticeFileDetail(ntcNo);
		return noticeFile;
	}
	
	//공지사항 상세조회 첨부파일 다운로드
	@Override
	public NoticeFile selectFiledownload(int ntcFileNo) {
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
		int ntcNo = notice.getNtcNo();
		String ntcCn = notice.getNtcCn();
		noticeRepository.updateNotice(ntcNo,ntcCn);
	}
	@Override
	public void noticeUpdate(Notice notice,NoticeFile noticeFile) {
		int ntcNo = notice.getNtcNo();
		String ntcCn = notice.getNtcCn();
		noticeRepository.updateNotice(ntcNo,ntcCn);
		
		//첨부파일 수정
		noticeFile.setNtcNo(ntcNo);
		noticeRepository.updateNoticeFileUpload(noticeFile);
		
	}

	/**
	 * 공지사항 삭제
	 * @author : 황건희
	 * @param ntcNo	삭제하려는 공지사항 No
	 */
	@Override
	public void noticeDelete(int ntcNo) {
		noticeRepository.delete(ntcNo);
	}
	
	//공지사항 첨부파일 삭제
	@Override
	public int noticeFileDelete(int ntcFileNo) {
		int ntcNo = noticeRepository.deleteFile(ntcFileNo);
		return ntcNo;
	}
	
	//공지사항 중요도 체크 변경
	@Override
	public void updatePryCheck() {
		noticeRepository.updatePryCheck();
	}
	
	//댓글 수
	@Override
	public int countComment(int ntcNo) {
		int countCmnt = noticeRepository.countComment(ntcNo);
		return countCmnt;
	}
	
	//댓글 읽기
	@Override
	public List<NoticeComment> getCommentList(int ntcNo) {
		List<NoticeComment> list = noticeRepository.selectNoticeCommentList(ntcNo);
		return list;
	}
	
	//댓글 작성
	@Override
	public NoticeComment writeComment(NoticeComment ntcComment) {
		noticeRepository.insertComment(ntcComment);
		ntcComment = noticeRepository.selectComment();
		return ntcComment;
	}

	//댓글 수정
	@Override
	public void updateComment(NoticeComment ntcComment) {
		int a = noticeRepository.updateComment(ntcComment);
	}

	//댓글 삭제
	@Override
	public void deleteComment(int ntcCmntNo) {
		noticeRepository.deleteComment(ntcCmntNo);
	}
	

	
	

}
