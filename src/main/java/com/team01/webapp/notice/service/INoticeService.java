package com.team01.webapp.notice.service;

import java.util.List;

import com.team01.webapp.model.Notice;

public interface INoticeService {
	
	public int getTotalRows();
	public List<Notice> getNoticeList(int pageNo);

}
