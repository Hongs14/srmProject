package com.team01.webapp.home.service;

import java.util.List;

import com.team01.webapp.model.Donut;
import com.team01.webapp.model.SR;
import com.team01.webapp.model.SystemInfo;
import com.team01.webapp.util.Pager;

public interface IHomeService {

	List<SystemInfo> getSystemMiniView(int userNo);

	List<Donut> getDonutList(String sysNo);

	List<SystemInfo> getSystemMiniViewDetail(int userNo);

	Pager returnPage(int pageNo, Pager pager, SR sr);

	List<SR> homeList(Pager pager, SR sr);

	List<Donut> getDonutListDeveloper(int userNo);

}
