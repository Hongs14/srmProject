package com.team01.webapp.notice.dao;

import java.util.List;

import com.team01.webapp.model.Notice;
import com.team01.webapp.util.Pager;

public interface INoticeRepository {

	public int count();
	public List<Notice> list(Pager pager);

	
}
