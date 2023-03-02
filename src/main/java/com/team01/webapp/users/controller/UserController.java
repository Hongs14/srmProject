package com.team01.webapp.users.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team01.webapp.model.Users;
import com.team01.webapp.users.service.IUserService;
import com.team01.webapp.users.service.UserService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class UserController {
	
	@Autowired
	IUserService userService;
	
	/**
	 * 로그인 메서드
	 * 
	 * @author			김희률
	 * @param session	HttpSession 객체 주입
	 * @param model		View로 데이터 전달을 위한 Model 객체 주입
	 * @return			로그인폼으로 이동
	 */
	@RequestMapping(value="/user/login", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {
		log.info("실행");
		return "user/loginForm";
	}
	

	/**
	 * 로그인 메서드
	 * 
	 * @author			김희률
	 * @param user		클라이언트가 보낸 사용자 정보 저장
	 * @param session	HttpSession 객체 주입
	 * @param model 	View로 데이터 전달을 위한 Model 객체 주입
	 * @return			홈으로 리다이렉트
	 */
	@RequestMapping(value="/user/login", method = RequestMethod.POST)
	public String login(Users user, HttpSession session, Model model) {
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
			session.setAttribute("userType", user.getUserType());
			session.setAttribute("userNo", user.getUserNo());

			log.info(user);
			return "redirect:/home";
		}
	}
	
	/**
	 * 로그아웃 메서드 
	 * 
	 * @author			김희률
	 * @param session	HttpSession 객체 주입, 세션 초기화
	 * @return 			로그인폼으로 이동
	 */
	@RequestMapping(value = "/user/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "user/loginForm";
	}
	
	/**
	 * 회원가입 메서드
	 * 
	 * @author	김희률
	 * @return	로그인폼으로 이동
	 */
	@RequestMapping(value = "/user/join", method = RequestMethod.GET)
	public String join() {
		log.info("정보 로그 실행");
		
		return "user/joinForm";
	}

	/**
	 * 회원가입 메서드
	 * 
	 * @author		김희률
	 * @param user	클라이언트가 보낸 사용자 정보 저장
	 * @param model	View로 데이터 전달을 위한 Model 객체 주입
	 * @return		뷰로 이동
	 */
	@RequestMapping(value="/user/join", method = RequestMethod.POST)
	public String join(Users user, Model model) {
		log.info(user.getUserPswd()+"실행");
		
		int result = userService.join(user);
		if(result == UserService.JOIN_SUCCESS) {
			return "redirect:/user/login";
		}else {
			model.addAttribute("result", "wrongJoin");
			return "user/joinForm";
		}
	}
	
	/**
	 * 나의 정보 확인 메서드
	 * 
	 * @author	김희률
	 * @return	나의 정보 뷰로 이동
	 */
	@RequestMapping(value = "/user/myinfo/{userId}", method = RequestMethod.GET)
	public String myinfo(@PathVariable String userId, Model model) {
		log.info("실행");
		Users user = userService.getMyInfo(userId);
		model.addAttribute("user", user);
		log.info("user: "+user);
		return "user/myInfo";
	}
	
	
	/**
	 * 회원탈퇴 메서드
	 * @author	김희률
	 * @param userNo
	 * @return
	 */
	@RequestMapping(value = "/user/unregister/{userNo}", method = RequestMethod.GET)
	public String unregister(@PathVariable int userNo) {
		log.info("unregister 실행"+ userNo);
		
		int rows = userService.unregister(userNo);
		return "redirect:/";
	}
	
	/**
	 * 회원정보 수정 메서드
	 * @author	김희률
	 * @param userNo
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user/update", method = RequestMethod.POST)
	public String update(Users user, Model model ) {
			log.info("user: "+user);
			int rows = userService.updateUserInfo(user);
			log.info("변경행수: "+rows);
			return "redirect:/user/myinfo/"+user.getUserId();
	}
}
