package com.team01.webapp.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.team01.webapp.model.Notice;
import com.team01.webapp.model.NoticeComment;
import com.team01.webapp.model.NoticeFile;
import com.team01.webapp.util.Pager;

public interface INoticeRepository {
	
	/*전체 공지사항 행수*/
	public int selectTotalNoticeListCount();
	
	/*필터링된 공지사항 행수*/
	public int selectTotalNoticeCount(Notice notice);
	
	/**
	 * 공지사항 목록
	 * @author : 황건희
	 * @param pager 공지사항 페이징 처리 
	 * @return 공지사항 정보 return
	 */
	public List<Notice> selectNoticeList(Pager pager);
	
	//필터링 된 공지사항 목록
	public List<Notice> selectFilterNoticeList(Notice notice);
	
	/**
	 * 공지사항 작성
	 * @author : 황건희
	 * @param notice 공지사항 작성 내용
	 * @return 공지사항 정보 return
	 */
	public int insertNoticeWrite(Notice notice);
	
	/**
	 * 공지사항 상세정보
	 * @author : 황건희
	 * @param ntcNo	공지사항 상세조회를 위한 공지사항 No
	 * @return
	 */
	public Notice selectNoticeDetail(int ntcNo);
	
	//공지사항 상세조회 첨부파일 읽어오기
	public List<MultipartFile> selectNoticeFileDetail(int ntcNo);
	
	//공지사항 상세조회 첨부파일 다운로드
	public NoticeFile selectFileDownload(int ntcFileNo);
	
	
	/**
	 * 공지사항 첨부파일 업로드
	 * @author : 황건희
	 * @param noticeFile 공지사항 첨부파일 업로드
	 */
	public void insertNoticeFileUpload(Notice notice);
	
	
	/** 
	 * 공지사항 수정한 첨부파일 업로드
	 * @author : 황건희
	 * @param noticeFile 공지사항 첨부파일 수정
	 */
	public void updateNoticeFileUpload(NoticeFile noticeFile);
	
	/**
	 * 공지사항 조회수
	 * @author : 황건희
	 * @param ntcNo 공지사항 No
	 */
	public void selectInqCnt(int ntcNo);
	
	
	/**
	 * 공지사항 수정
	 * @author : 황건희
	 * @param ntcNo	공지사항 수정을 위한 공지사항 No
	 * @param ntcCn 수정된 공지사항 내용
	 */
	public void updateNotice(@Param("ntcNo") int ntcNo, @Param("ntcCn") String ntcCn);
	
	
	/**
	 * 공지사항 첨부파일 수정
	 * @author : 황건희
	 * @param noticeFile 수정된 첨부 파일
	 */
	public void updateFile(NoticeFile noticeFile);
	
	
	/**
	 * DB의 최신 첨부파일 No
	 * @author : 황건희
	 * @return
	 */
	public int selectMaxFileNo();
	
	/**
	 * 공지사항 삭제
	 * @author : 황건희
	 * @param ntcNo 공지사항 삭제를 위한 No
	 */
	public void delete(int ntcNo);
	
	//공지사항 첨부파일 삭제
	public int deleteFile(int ntcFileNo);
	
	//댓글 읽기
	public List<NoticeComment> selectNoticeCommentList(int ntcNo);
	
	//댓글 작성
	public void insertComment(NoticeComment ntcComment);
	public NoticeComment selectComment();
	
	//댓글 수정
	public int updateComment(NoticeComment ntcComment);
	
	//댓글 삭제
	public void deleteComment(int ntcCmntNo);
	
}
