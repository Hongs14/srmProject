package com.team01.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.team01.webapp.dto.Member;

@Mapper
public interface MemberDao {
	
	public Member selectByMid(String mid);

	public int insert(Member member);
	
}
