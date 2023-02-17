package com.team01.webapp.examine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team01.webapp.model.Examine;
import com.team01.webapp.model.ExamineList;
import com.team01.webapp.model.SRStts;
import com.team01.webapp.model.System;
import com.team01.webapp.model.Users;

public interface IExamineRepository {

	public int count();
	public List<Examine> list(ExamineList examineList);
	public List<SRStts> selectSrSttsList();
	public List<System> selectSysNmList();
	public List<Users> selectUserOgdpList();
	public List<Users> selectUserDpList();
	public int selectTotalExamineCount(ExamineList examineList);
}
