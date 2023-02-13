package com.team01.webapp.users.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team01.webapp.users.model.User;
import com.team01.webapp.users.service.IUserService;
import com.team01.webapp.users.service.UserService;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/user")
@Log4j2
public class UserController {
	
	@Autowired
	IUserService userService;
	
	//로그인하기 
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(HttpSession session, Model model, Pager pager) {
		log.info("실행");
		return "user/loginForm";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(User user, HttpSession session, Model model) {
		log.info(user+" post 실행");
		UserService.LoginResult loginResult = userService.login(user);
		
		if(loginResult == UserService.LoginResult.WRONG_ID) {
			model.addAttribute("user", user);
			model.addAttribute("result", "wrongId");
			return "user/loginForm";
		}else if(loginResult == UserService.LoginResult.WRONG_PASSWORD) {
			model.addAttribute("user", user);
			model.addAttribute("result", "wrongPassword");
			return "user/loginForm";
		}else {
			session.setAttribute("loginUser", user);
			log.info(user);
			return "redirect:/";
		}
	}
	
	 // 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//회원가입 
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "user/joinForm";
	}
	
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(User user, Model model) {
		log.info(user.getUserPswd()+"실행");
		
		int result = userService.join(user);
		if(result == UserService.JOIN_SUCCESS) {
			return "redirect:/user/login";
		}else {
			model.addAttribute("result", "wrongJoin");
			return "user/joinForm";
		}
	}

}
