package com.team01.webapp.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team01.webapp.model.Notice;
import com.team01.webapp.model.NoticeFile;
import com.team01.webapp.util.Pager;

public interface INoticeRepository {

	public int count();
	public List<Notice> list(Pager pager);
	public int write(Notice notice);
	public Notice detail(int ntcNo);
	public void noticeFileUpload(NoticeFile noticeFile);
	public void noticeFileUpdateUpload(NoticeFile noticeFile);
	public void inqCnt(int ntcNo);
	public void update(@Param("ntcNo") int ntcNo, @Param("ntcCn") String ntcCn);
	public void updateFile(NoticeFile noticeFile);
	public int selectMaxFileNo();
	public void delete(int ntcNo);
}
