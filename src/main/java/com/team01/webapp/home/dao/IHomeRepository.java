package com.team01.webapp.home.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team01.webapp.model.Donut;
import com.team01.webapp.model.SR;
import com.team01.webapp.model.SystemInfo;

@Mapper
public interface IHomeRepository {

	List<SystemInfo> selectSysInfo(int userNo);

	List<Donut> selectDonutList(String sysNo);

	List<SystemInfo> selectSysInfo2(int userNo);

	int selectTotalCount(SR sr);

	List<SR> selectHomeList(SR sr);

	List<Donut> selectDonutListDeveloper(int userNo);

}
