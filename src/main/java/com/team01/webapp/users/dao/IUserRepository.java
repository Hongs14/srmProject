package com.team01.webapp.users.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team01.webapp.model.UserSystem;
import com.team01.webapp.model.Users;

@Mapper
public interface IUserRepository {

	/**
	 * 유저 정보 가져오기
	 * 
	 * @author			김희률
	 * @param userId	userId로 식별
	 * @return			User 객체 리턴
	 */
	public Users selectByUserId(String userId);

	/**
	 * 회원가입 처리
	 * 
	 * @author		김희률
	 * @param user	User 객체 전달
	 * @return		성공여부
	 */
	public int insert(Users user);

	public int insertUserSystem(Users user);
	
	public UserSystem selectSystemByUserNo(int userNo);
	
	public String selectSysNmByUserNo(int userNo);

	public String getSysNoByUserOgdp(String userOgdp);

	public int updateUnregister(int userNo);

	public int updateUserInfo(Users user);

	public Users selectUserId(Users user);

	public int updatePswd(String securePswd);

	public int updatePswd(@Param("securePswd") String securePswd, @Param("userNo") int userNo, @Param("userPswdTempYn") char userPswdTempYn);

	public Users getUserByEml(String userEml);

	
}
