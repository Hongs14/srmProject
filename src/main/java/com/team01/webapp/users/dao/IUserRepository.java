package com.team01.webapp.users.dao;

import org.apache.ibatis.annotations.Mapper;

import com.team01.webapp.users.model.User;

@Mapper
public interface IUserRepository {

	public User selectByUserId(String userId);

	public int insert(User user);

}
