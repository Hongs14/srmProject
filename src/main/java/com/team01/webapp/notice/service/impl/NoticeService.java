package com.team01.webapp.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.webapp.model.Notice;
import com.team01.webapp.notice.dao.INoticeRepository;
import com.team01.webapp.notice.service.INoticeService;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class NoticeService implements INoticeService{

	@Autowired
	INoticeRepository noticeRepository;
	@Override
	public int getTotalRows() {
		log.info("실행");
		int rows = noticeRepository.count();
		return rows;
	}
	@Override
	public List<Notice> getNoticeList(Pager pager) {
		log.info("실행");
		
		List<Notice> list = noticeRepository.list(pager);
		
		return list;
	}

}
