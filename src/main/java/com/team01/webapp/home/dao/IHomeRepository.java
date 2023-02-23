package com.team01.webapp.home.dao;

import org.apache.ibatis.annotations.Mapper;

import com.team01.webapp.model.SystemInfo;

@Mapper
public interface IHomeRepository {

	SystemInfo selectSysInfo(int userNo);

}
