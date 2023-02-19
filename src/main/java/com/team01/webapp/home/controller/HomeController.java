package com.team01.webapp.home.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team01.webapp.home.service.IHomeService;
import com.team01.webapp.users.model.User;

import lombok.extern.log4j.Log4j2;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j2
public class HomeController {
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		log.info("정보 로그 실행");
		
		return "home";
		
	}
	@RequestMapping(value = "/home/systemMiniView", method = RequestMethod.GET)
	public String getSystemMiniView(HttpSession session, Model model) {

		return "home/systemMiniView";
	}
	
}
