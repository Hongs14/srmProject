package com.team01.webapp.users.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team01.webapp.model.Users;
import com.team01.webapp.users.service.IUserService;
import com.team01.webapp.users.service.UserService;
import com.team01.webapp.util.AlarmInfo;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class UserController {
	
	@Autowired
	IUserService userService;
	
	@Autowired
	AlarmInfo alarmInfo;
	
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
			session.setAttribute("userId", user.getUserId());
			session.setAttribute("sysNo", user.getSysNo());
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
	public String join(Model model) {
		log.info("정보 로그 실행");
		log.info(model.getAttribute("result"));
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
	public String join(Users user, Model model, RedirectAttributes redirectAttributes) {
		log.info(user.getUserPswd()+"실행");
		int result = userService.join(user);
		if(result == UserService.JOIN_SUCCESS) {
			redirectAttributes.addFlashAttribute("result", "success");
			return "redirect:/user/login";
		}else if (result == UserService.JOIN_DUPLICATED){
			model.addAttribute("result", "duplicatedId");
			return "user/joinForm";
		}else {
			model.addAttribute("result", "wrongJoin");
			return "user/joinForm";
			
		}
	}
	
	@ResponseBody
	@RequestMapping("/user/checkid")
	public String checkId(@RequestParam String userId)	 {
		log.info(userId+"실행");
		int result = userService.checkId(userId);
		if(result == UserService.JOIN_DUPLICATED) {
			log.info("중복 아이디");
			return "duplicated";
		}else {
			log.info("중복이 아닌 아이디");
			return "success";
		}
	}
	
	/**
	 * 나의 정보 확인 메서드
	 * 
	 * @author	김희률
	 * @return	나의 정보 뷰로 이동
	 */
	@RequestMapping(value = "/user/myinfo/{userId}", method = RequestMethod.GET)
	public String myinfo(@PathVariable String userId, HttpSession session, Model model) {
		log.info("실행");
		//알림 수 및 리스트
		alarmInfo.info(session, model); 
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
		log.info("변경 행수: " + rows);
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
	
	
	@RequestMapping(value="/user/recovery", method = RequestMethod.GET)
	public String recovery() {
		return "user/recovery";
	}
	
	@RequestMapping(value="/user/id_recovery", method = RequestMethod.GET)
	public String idRecovery() {
		return "user/idRecovery";
	}
	
	@RequestMapping(value="/user/id_recovery", method = RequestMethod.POST)
	public @ResponseBody String idRecovery(@RequestBody Users user) {
		log.info("실행"+user);
		String userId="";
		try {
			userId = userService.findUserId(user);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return userId;
	}
	@RequestMapping(value="/user/pswd_recovery", method = RequestMethod.GET)
	public String pswdRecovery() {
		return "user/pswdRecovery";
	}
	
	@RequestMapping(value="/user/pswd_recovery", method = RequestMethod.POST)
	public @ResponseBody String pswdRecovery(@RequestBody Users user) {
		int rows = 0;
		try {
			rows = userService.sendRecoveryMail(user);
			log.info("변경 행수: "+rows);
			return "success";
		}catch(Exception e) {
			log.info(e.getMessage());
			return "false";
		}
	}
	@RequestMapping(value="/user/check_pswd", method = RequestMethod.POST)
	public @ResponseBody String checkPswd(@RequestBody Users user) {
		int rows = 0;
		try {
			rows = userService.getPswd(user);
			log.info("결과: "+rows);
			if(rows == 1) {
				return "success";
			}else {
				return "false";
			}
		}catch(Exception e) {
			log.info(e.getMessage());
			return "false";
		}
	}
	
	@RequestMapping(value="/user/update_pswd", method = RequestMethod.POST)
	public @ResponseBody String updatePswd(@RequestBody Users user) {
		int rows = 0;
		try {
			rows = userService.updatePswd(user);
			log.info("변경 행수: "+rows);
			return "success";
		}catch(Exception e) {
			log.info(e.getMessage());
			return "false";
		}
	}
}
