package com.team01.webapp.notice.service;

import java.util.List;

import com.team01.webapp.model.Notice;
import com.team01.webapp.util.Pager;

public interface INoticeService {
	
	public int getTotalRows();
	public List<Notice> getNoticeList(Pager pager);

}
