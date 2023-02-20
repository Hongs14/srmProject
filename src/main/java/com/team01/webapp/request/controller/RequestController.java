package com.team01.webapp.request.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team01.webapp.request.service.IRequestService;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/request")
@Log4j2
public class RequestController {
	
	@Autowired
	IRequestService requestService;
	
	/**
	 * 모든 SR리스트 조회
	 * 
	 * @author			김희률
	 * @param session	HttpSession 객체 주입
	 * @param model		View로 데이터 전달을 위한 Model 객체 주입
	 * @param pager		paging처리를 위한 pager객체 주입
	 * @return			list뷰로 이동
	 */
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String getListAll(HttpSession session, Model model, Pager pager) {
		log.info("정보 로그 실행");
		
		return "request/list";
		
	}
	 
	
	@RequestMapping(value="/detail/{no}", method = RequestMethod.GET)
	public String getDetail(@PathVariable String no, HttpSession session, Model model, Pager pager) {
		log.info("정보 로그 실행");
		return "request/detail";
		
	}
	
	@RequestMapping(value="/detail/sr/{no}", method = RequestMethod.GET)
	public String getSrDetail(@PathVariable String no, HttpSession session, Model model, Pager pager) {
		log.info("정보 로그 실행");
		return "request/detailView";
		
	}
	
	
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public String writeRequest(HttpSession session, Model model, Pager pager) {
		log.info("정보 로그 실행");
		
		return "request/write";
		
	}

}
