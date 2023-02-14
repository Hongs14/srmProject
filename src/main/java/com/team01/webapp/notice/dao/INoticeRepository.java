package com.team01.webapp.notice.dao;

import java.util.List;

import com.team01.webapp.model.Notice;
import com.team01.webapp.model.NoticeFile;
import com.team01.webapp.util.Pager;

public interface INoticeRepository {

	public int count();
	public List<Notice> list(Pager pager);
	public int write(Notice notice);
	public Notice detail(int ntcNo);
	public NoticeFile noticeFileUpload(Notice notice);
}
