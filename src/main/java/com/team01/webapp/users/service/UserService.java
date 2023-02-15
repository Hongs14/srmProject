package com.team01.webapp.users.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.team01.webapp.users.dao.IUserRepository;
import com.team01.webapp.users.model.User;

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
	public LoginResult login(User user) {
		log.info("userId: "+ user.getUserId()+ "실행");
		PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		User dbUser = getUser(user.getUserId());
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
		return LoginResult.SUCCESS;
	}
	
	@Override
	public User getUser(String userId) {
		log.info(userId+ "실행 ");
		return userRepository.selectByUserId(userId);
	}

	@Override
	public int join(User user) {
		log.info(user.getUserPswd());
		try {
		user.setUserDelYn('N');
		
		PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		user.setUserPswd(pe.encode(user.getUserPswd()));
		
		int rows= userRepository.insert(user);
		return JOIN_SUCCESS;
		}catch(Exception e){
			log.info(e.toString());
			return JOIN_FAIL;
		}
		
	}


}
