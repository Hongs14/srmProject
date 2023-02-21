package com.team01.webapp.users.service;

import com.team01.webapp.model.Users;
import com.team01.webapp.users.service.UserService.LoginResult;

public interface IUserService {

	LoginResult login(Users user);

	Users getUser(String userId);

	int join(Users user);
}
