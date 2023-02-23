package com.team01.webapp.home.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team01.webapp.model.Donut;
import com.team01.webapp.model.SystemInfo;

@Mapper
public interface IHomeRepository {

	SystemInfo selectSysInfo(int userNo);

	List<Donut> selectDonutList(String sysNo);

}
