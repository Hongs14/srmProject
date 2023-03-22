package com.team01.webapp.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.team01.webapp.notice.service.INoticeService;


@EnableScheduling
@Component
public class noticeScheduler {

	@Autowired
	INoticeService noticeService;
	
	@Scheduled(cron="0 0 0 * * *")
	public void noticePryCheck() {
		//이벤트기간 종료시 중요도를 NO로 변경
		noticeService.updatePryCheck();
		
		
	}

}
