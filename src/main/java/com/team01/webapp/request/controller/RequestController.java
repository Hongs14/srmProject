package com.team01.webapp.request.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team01.webapp.request.service.IRequestService;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class RequestController {
	
	//모든 리스트 가져오기 
	@RequestMapping(value="/request/list", method = RequestMethod.GET)
	public String getListAll(HttpSession session, Model model, Pager pager) {
		log.info("정보 로그 실행");
		return "request/list1";
		
	}

}
