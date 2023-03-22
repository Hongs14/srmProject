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

@Controller
public class UserController {
	
	@Autowired
	IUserService userService;
	
	@Autowired
	AlarmInfo alarmInfo;
	
	/**
	 * 로그인폼으로 이동
	 * 
	 * @author			김희률
	 * @param session	HttpSession 객체 주입
	 * @param model		View로 데이터 전달을 위한 Model 객체 주입
	 * @return			로그인폼으로 이동
	 */
	@RequestMapping(value="/user/login", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {
		return "user/loginForm";
	}
	

	/**
	 * 로그인 처리
	 * 
	 * @author			김희률
	 * @param user		클라이언트가 보낸 사용자 정보 저장
	 * @param session	HttpSession 객체 주입
	 * @param model 	View로 데이터 전달을 위한 Model 객체 주입
	 * @return			홈으로 리다이렉트
	 */
	@RequestMapping(value="/user/login", method = RequestMethod.POST)
	public String login(Users user, HttpSession session, Model model) {
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
			if(user.getUserPswdTempYn()=='Y') {
				return "user/tempPswd";
			}
			return "redirect:/home";
		}
	}
	
	/**
	 * 로그아웃 
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
	 * 회원가입
	 * 
	 * @author	김희률
	 * @param	model View로 데이터 전달을 위한 Model 객체 주입
	 * @return
	 */
	@RequestMapping(value = "/user/join", method = RequestMethod.GET)
	public String join(Model model) {
		return "user/joinForm";
	}


	/**
	 * @author	김희률
	 * @param user		클라이언트가 보낸 사용자 정보 저장
	 * @param model		View로 데이터 전달을 위한 Model 객체 주입
	 * @param redirectAttributes	일회성 데이터를 View에 전달하기 위한 RedirectAttribute
	 * @return 뷰로 이동
	 */
	@RequestMapping(value="/user/join", method = RequestMethod.POST)
	public String join(Users user, Model model, RedirectAttributes redirectAttributes) {
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
	
	/**
	 * 중복아이디 체크 
	 * @author 김희률
	 * @param  userId
	 * @return duplicated(중복) or success(중복이 아님)
	 */
	@ResponseBody
	@RequestMapping("/user/checkid")
	public String checkId(@RequestParam String userId)	 {
		int result = userService.checkId(userId);
		if(result == UserService.JOIN_DUPLICATED) {
			return "duplicated";
		}else {
			return "success";
		}
	}
	/**
	 * 중복이메일 체크 
	 * @author 김희률
	 * @param  userId
	 * @return duplicated(중복) or success(중복이 아님)
	 */
	@ResponseBody
	@RequestMapping("/user/checkEml")
	public String checkEml(@RequestParam String checkEml)	 {
		String userEml = checkEml;
		int result = userService.checkEml(userEml);
		if(result == UserService.JOIN_DUPLICATED) {
			return "duplicated";
		}else {
			return "success";
		}
	}
	/**
	 * @author	김희률
	 * @param userId	사용자의 아이디
	 * @param session	알림 기능 사용을 위한 session 객체 주입
	 * @param model		View로 데이터 전달을 위한 Model 객체 주입
	 * @return			나의 정보 뷰로 이동
	 */
	@RequestMapping(value = "/user/myinfo/{userId}", method = RequestMethod.GET)
	public String myinfo(@PathVariable String userId, HttpSession session, Model model) {
		//알림 수 및 리스트
		alarmInfo.info(session, model); 
		Users user = userService.getMyInfo(userId);
		model.addAttribute("user", user);
		return "user/myInfo";
	}
	
	
	/**
	 * 회원탈퇴 메서드
	 * @author	김희률		
	 * @param 	userNo	회원 식별을 위한 userNo
	 * @return	홈으로 리다이렉트
	 */
	@RequestMapping(value = "/user/unregister/{userNo}", method = RequestMethod.GET)
	public String unregister(@PathVariable int userNo) {
		int rows = userService.unregister(userNo);
		return "redirect:/";
	}
	
	/**
	 * 회원정보 수정 메서드
	 * 
	 * @author	김희률
	 * @param userNo	회원 식별을 위한 userNo
	 * @param user		사용자가 작성한 정보를 저장
	 * @param model		View로 데이터 전달을 위한 Model 객체 주입
	 * @return			나의 정보 뷰로 이동
	 */
	@RequestMapping(value="/user/update", method = RequestMethod.POST)
	public String update(Users user, Model model ) {
		int rows = userService.updateUserInfo(user);
		return "redirect:/user/myinfo/"+user.getUserId();
	}
	
	
	/**
	 * 회원정보 복구 뷰로 이동
	 * 
	 * @author	김희률
	 * @return 회원정보 복구 뷰로 이동
	 */
	@RequestMapping(value="/user/recovery", method = RequestMethod.GET)
	public String recovery() {
		return "user/recovery";
	}
	
	/**
	 * Id 복구페이지로 이동
	 * 
	 * @author	김희률
	 * @return	jsp
	 */
	@RequestMapping(value="/user/id_recovery", method = RequestMethod.GET)
	public String idRecovery() {
		return "user/idRecovery";
	}
	
	/**
	 * Id 찾기
	 * 
	 * @author	김희률
	 * @param	user	사용자가 작성한 정보를 저장
	 * @return 	userId	찾은 아이디를 리턴
	 */
	@RequestMapping(value="/user/id_recovery", method = RequestMethod.POST)
	public @ResponseBody String idRecovery(@RequestBody Users user) {
		String userId="";
		try {
			userId = userService.findUserId(user);
		} catch (Exception e) {
		}
		return userId;
	}
	/**
	 * 비밀번호 찾기 뷰로 이동
	 * 
	 * @author	김희률
	 * @return 	뷰로 이동
	 */
	@RequestMapping(value="/user/pswd_recovery", method = RequestMethod.GET)
	public String pswdRecovery() {
		return "user/pswdRecovery";
	}
	
	/**
	 * 비밀번호 찾기
	 * 
	 * @author	  	김희률
	 * @param user	회원이 입력한 정보를 저장
	 * @return		결과값 success or false
	 */
	@RequestMapping(value="/user/pswd_recovery", method = RequestMethod.POST)
	public @ResponseBody String pswdRecovery(@RequestBody Users user) {
		int rows = 0;
		try {
			rows = userService.sendRecoveryMail(user);
			return "success";
		}catch(Exception e) {
			return "false";
		}
	}
	
	/**
	 * 비밀번호 변경을 위한 현재 비밀번호 확인
	 * 
	 * @author		김희률
	 * @param user	회원이 입력한 정보를 저장
	 * @return		결과값 success or false
	 */
	@RequestMapping(value="/user/check_pswd", method = RequestMethod.POST)
	public @ResponseBody String checkPswd(@RequestBody Users user) {
		int rows = 0;
		try {
			rows = userService.getPswd(user);
			if(rows == 1) {
				return "success";
			}else {
				return "false";
			}
		}catch(Exception e) {
			return "false";
		}
	}
	
	/**
	 * 비밀번호 변경
	 * 
	 * @author		김희률
	 * @param user	회원이 입력한 정보를 저장
	 * @return		결과값 success or false
	 */
	@RequestMapping(value="/user/update_pswd", method = RequestMethod.POST)
	public @ResponseBody String updatePswd(@RequestBody Users user) {
		int rows = 0;
		try {
			rows = userService.updatePswd(user);
			return "success";
		}catch(Exception e) {
			return "false";
		}
	}
}
