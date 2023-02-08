package com.team01.webapp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team01.webapp.dto.Member;
import com.team01.webapp.service.MemberService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/member")
@Log4j2
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/login")
	public String loginForm() {
		log.info("실행");
		return "member/loginForm";
	}
	
	@PostMapping("/login")
	public String login(Member member, Model model, HttpSession session) {
		log.info("실행");
		MemberService.LoginResult loginResult =memberService.login(member);
		if(loginResult == MemberService.LoginResult.WRONG_ID) {
			model.addAttribute("member", member);
			model.addAttribute("result", "wrongMid");
			return "member/loginForm";
		}else if(loginResult == MemberService.LoginResult.WRONG_PASSWORD){
			model.addAttribute("member", member);
			model.addAttribute("result", "wrongMpassword");
			return "member/loginForm";
		}else {
			session.setAttribute("loginMember", member);
			log.info(member);
			return "redirect:/";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		log.info("실행");
		session.removeAttribute("loginMember");
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public String join() {
		return "member/joinForm";
	}
	
	@PostMapping("/join")
	public String join(Member member, Model model) {
		log.info("실행");
		
		int result = memberService.join(member);
		if(result == MemberService.JOIN_SUCCESS) {
			return "redirect:/member/login";
		} else {
			model.addAttribute("result", "wrongJoin");
			return "member/joinForm";
		}
	}
	
}
