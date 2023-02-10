package com.team01.webapp.request.service;

import java.util.List;

import com.team01.webapp.model.SR;
import com.team01.webapp.util.Pager;

public interface IRequestService {
	//리스트 
		Pager returnPage(String pageNo, Pager pager);
		List<SR> getTotalArticleList(Pager pager);

}
