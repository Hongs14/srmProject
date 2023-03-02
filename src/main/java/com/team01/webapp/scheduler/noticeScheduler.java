package com.team01.webapp.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.team01.webapp.notice.service.INoticeService;

import lombok.extern.log4j.Log4j2;


@EnableScheduling
@Component
@Log4j2
public class noticeScheduler {

	@Autowired
	INoticeService noticeService;
	
	@Scheduled(cron="0 0 0 * * *")
	public void noticePryCheck() {
		//이벤트기간 종료시 중요도를 NO로 변경
		log.info("스케줄러 실행");
		
		noticeService.updatePryCheck();
		
		
	}

}
