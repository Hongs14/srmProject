package com.team01.webapp.home.service;

import java.util.List;

import com.team01.webapp.model.Donut;
import com.team01.webapp.model.SystemInfo;

public interface IHomeService {

	SystemInfo getSystemMiniView(int userNo);

	List<Donut> getDonutList(String sysNo);

}
