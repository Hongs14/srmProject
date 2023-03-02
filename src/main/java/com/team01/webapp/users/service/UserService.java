package com.team01.webapp.users.service;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@Autowired
	IUserRepository userRepository;
	
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
			case "레드주컴퍼니": 
				sysNo="JHJ";
				break;
			case "한국소프트SRM":
				sysNo="KOREASOFT_SRM";
				break;
			case "에이치알컴퍼니":
				sysNo="KHR";
				break;
			case "티에이치컴퍼니":
				sysNo="KTH";
				break;
			case "지에이치컴퍼니":
				sysNo="HGH";
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


}
