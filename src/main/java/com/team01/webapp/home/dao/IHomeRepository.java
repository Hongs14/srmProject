package com.team01.webapp.home.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team01.webapp.model.DevMini;
import com.team01.webapp.model.Donut;
import com.team01.webapp.model.HR;
import com.team01.webapp.model.Progress;
import com.team01.webapp.model.ProgressDetail;
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

	ProgressDetail selectRequestSr(String srNo);

	DevMini selectSrData(String srNo);

	List<Progress> selectProgressList(String srNo);

	List<HR> selectHrList(String srNo);

	int selectFileCount(String progNo);

}
