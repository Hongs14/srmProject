package com.team01.webapp.users.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class UserController {

	
	//로그인하기 
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(HttpSession session, Model model, Pager pager) {
		log.info("정보 로그 실행");
		return "user/loginForm";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(HttpSession session, Model model) {
		return "redirect:/home";
	}

}
