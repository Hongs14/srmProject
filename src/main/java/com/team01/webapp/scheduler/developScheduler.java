package com.team01.webapp.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.team01.webapp.develop.service.IDevelopService;


@EnableScheduling
@Component
public class developScheduler {

	@Autowired
	private IDevelopService developService;
	
	/**매일 12시 5분에 실행
	 * @author	 정홍주
	 */
	@Scheduled(cron="0 5 12 * * *")
	public void changeStatus() {
		//해당 날짜가 되면 개발계획 -> 개발중으로 바뀌기
		
		int result = developService.changeStatus();
		if(result == 1) {
			
		}
		
	}

}
