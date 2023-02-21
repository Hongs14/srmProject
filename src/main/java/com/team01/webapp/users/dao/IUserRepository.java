package com.team01.webapp.users.dao;

import org.apache.ibatis.annotations.Mapper;

import com.team01.webapp.users.model.User;

@Mapper
public interface IUserRepository {

	/**
	 * 유저 정보 가져오기
	 * 
	 * @author			김희률
	 * @param userId	userId로 식별
	 * @return			User 객체 리턴
	 */
	public User selectByUserId(String userId);

	/**
	 * 회원가입 처리
	 * 
	 * @author		김희률
	 * @param user	User 객체 전달
	 * @return		성공여부
	 */
	public int insert(User user);

	public void insertUserSystem(User user);
	
	public String selectSysNmByUserNo(int userNo);

}
