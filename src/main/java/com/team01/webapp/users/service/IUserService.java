package com.team01.webapp.users.service;

import com.team01.webapp.model.Users;
import com.team01.webapp.users.service.UserService.LoginResult;

public interface IUserService {

	LoginResult login(Users user);

	Users getUser(String userId);

	int join(Users user);

	int unregister(int userNo);

	int updateUserInfo(Users user);

	Users getMyInfo(String userId);

	int checkId(String userId);

	String findUserId(Users user) throws Exception;

	int sendRecoveryMail(Users user) throws Exception;

	int updatePswd(Users user) throws Exception;

	int getPswd(Users user) throws Exception;

	int checkEml(String userEml);
}
