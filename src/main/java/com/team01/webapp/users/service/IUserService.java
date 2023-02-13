package com.team01.webapp.users.service;

import com.team01.webapp.users.model.User;
import com.team01.webapp.users.service.UserService.LoginResult;

public interface IUserService {

	LoginResult login(User user);

	User getUser(String userId);

	int join(User user);
}
