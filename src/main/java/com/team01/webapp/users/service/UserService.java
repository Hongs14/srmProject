package com.team01.webapp.users.service;

import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team01.webapp.model.UserSystem;
import com.team01.webapp.model.Users;
import com.team01.webapp.users.dao.IUserRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class UserService implements IUserService {
	public enum LoginResult {
		SUCCESS, WRONG_ID, WRONG_PASSWORD
	}
	
	
	public static final int JOIN_SUCCESS=0;
	public static final int JOIN_FAIL=1;
	public static final int JOIN_DUPLICATED=2;
	
	@Autowired
	IUserRepository userRepository;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public LoginResult login(Users user) {
		log.info("userId: "+ user.getUserId()+ "실행");
		PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		Users dbUser = getUser(user.getUserId());
		log.info("dbUser"+ dbUser);
		log.info("ViewUser: "+ user);
		
		if(dbUser == null) {
			return LoginResult.WRONG_ID;
		}else {
			boolean checkPass =pe.matches(user.getUserPswd(), dbUser.getUserPswd());
			if(checkPass == false) {
				return LoginResult.WRONG_PASSWORD;
			}
		}
		user.setUserNo(dbUser.getUserNo());
		user.setUserId(dbUser.getUserId());
		user.setUserPswd(dbUser.getUserPswd());
		user.setUserJbps(dbUser.getUserJbps());
		user.setUserNm(dbUser.getUserNm());
		user.setUserType(dbUser.getUserType());
		user.setUserOgdp(dbUser.getUserOgdp());
		user.setUserEml(dbUser.getUserEml());
		user.setUserTelno(dbUser.getUserTelno());
		user.setUserDpNm(dbUser.getUserDpNm());
		user.setUserPswdTempYn(dbUser.getUserPswdTempYn());
		UserSystem userSystem = userRepository.selectSystemByUserNo(user.getUserNo());
		log.info("userSystem: "+userSystem);
		String sysNo = userSystem.getSysNo();
		String sysNm = userSystem.getSysNm();
		user.setSysNm(sysNm);
		user.setSysNo(sysNo);
		
		
		return LoginResult.SUCCESS;
	}
	

	@Override
	public Users getUser(String userId) {
		log.info(userId+ "실행 ");
		return userRepository.selectByUserId(userId);
	}
	

	@Override
	@Transactional
	public int join(Users user) {
		log.info(user.getUserPswd());
		try {
			user.setUserDelYn('N');
			
			PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			user.setUserPswd(pe.encode(user.getUserPswd()));
			
			String sysNo = "";
			switch(user.getUserOgdp()) {
				case "북북출판사": 
					sysNo="BOK";
					break;
				case "한국소프트":
					sysNo="SRM";
					break;
				case "사슈즈":
					sysNo="SAS";
					break;
				case "오티아이":
					sysNo="OTI";
					break;
				case "한국대학교":
					sysNo="KOR";
					break;
					
			}
			log.info("sysNo: "+sysNo);
			userRepository.insert(user);
			String userId = user.getUserId();
			user = userRepository.selectByUserId(userId);
			user.setSysNo(sysNo);
			log.info("sysNo: "+user.getSysNo());
			log.info("custNo: "+user.getUserNo());
			userRepository.insertUserSystem(user);
			return JOIN_SUCCESS;
		
		}catch(Exception e){
			log.info(e.toString());
			return JOIN_FAIL;
		}
		
	}
	

	@Override
	public int unregister(int userNo) {
		return userRepository.updateUnregister(userNo);
	}

	
	@Override
	public int updateUserInfo(Users user) {
		log.info("user: "+user);
		int rows = userRepository.updateUserInfo(user);
		log.info("변경 행수: " + rows);
		return rows;
	}


	@Override
	public Users getMyInfo(String userId) {
		log.info("실행");
		return userRepository.selectByUserId(userId);
	}


	@Override
	public int checkId(String userId) {
		Users dbUser = getUser(userId);
		if(dbUser != null) {
			return JOIN_DUPLICATED;
		}
		return 0;
	}


	@Override
	public String findUserId(Users user) throws Exception {
		log.info(user);
		user = userRepository.selectUserId(user);
		return user.getUserId();
	}


	@Override
	@Transactional
	public int sendRecoveryMail(Users user) throws Exception {
		log.info("user: "+user);
		try {
			String userEml = user.getUserEml();
			Users dbUser = userRepository.selectUserId(user);
			String userId = dbUser.getUserId();
			int userNo = dbUser.getUserNo();
			log.info("userNo: "+userNo);
			if(userId == "" || userId == null) {
				return 0;
			}
			
			String tempPswd = UUID.randomUUID().toString().replace("-", "");
			tempPswd = tempPswd.substring(0, 10);
			log.info(tempPswd);
			
			PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			String securePswd = pe.encode(tempPswd);
			char userPswdTempYn = 'Y';
			userRepository.updatePswd(securePswd, userNo, userPswdTempYn);
			
			MimeMessage mimeMessage = mailSender.createMimeMessage();
		    MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
 
		    messageHelper.setFrom("koreasoftsrm@gmail.com"); // 보내는사람 이메일 
		    messageHelper.setTo("gmlfbf5102@naver.com"); // 받는사람 이메일 userEml로 변경해야한다!!!!!!!
		    messageHelper.setSubject("[코리아소프트SRM] 임시 비밀번호 발급 안내"); // 메일제목
		    messageHelper.setText("고객님의 임시 비밀번호 안내 메일입니다. \n 계정: "+userEml + "\n 임시 비밀번호: "+tempPswd+"\n -임시 비밀번호 발급 요청에 의해 재발급된 임시 비밀번호입니다. \n -임시 비밀번호로 로그인 후 비밀번호를 변경해주세요."); // 메일 내용
 
		    mailSender.send(mimeMessage);
		} catch (Exception e) {
			throw e;
		}
		
		return 1;
	}
	
	@Override
	public int getPswd(Users user) throws Exception {
		log.info("user: "+user);
		try {
			PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			String securePswd = pe.encode(user.getUserPswd());
			Users dbUser = getUser(user.getUserId());
			if(dbUser == null) {
				return 0;
			}else {
				boolean checkPass =pe.matches(user.getUserPswd(), dbUser.getUserPswd());
				if(checkPass == false) {
					return 0;
				}
			}
			log.info(securePswd);
			log.info("dbUser:" + dbUser);
			
		} catch (Exception e) {
			throw e;
		}
		
		return 1;
	}

	@Override
	@Transactional
	public int updatePswd(Users user) throws Exception{
		log.info("user: "+user);
		int rows = 0;
		try {
			int userNo = user.getUserNo();
			PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			String securePswd = pe.encode(user.getUserPswd());
			char userPswdTempYn = 'N';
			rows = userRepository.updatePswd(securePswd, userNo,userPswdTempYn);
		} catch (Exception e) {
			throw e;
		}
		
		return rows;
	}


	


}
