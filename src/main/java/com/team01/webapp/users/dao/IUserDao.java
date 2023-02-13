package com.team01.webapp.users.dao;

import org.apache.ibatis.annotations.Mapper;

import com.team01.webapp.users.model.User;

@Mapper
public interface IUserDao {

	User selectUser(String userId);

	User selectByUserId(String userId);

	int insert(User user);

}
