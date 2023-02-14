package com.team01.webapp.develop.service;

import java.util.List;

import com.team01.webapp.model.SR;
import com.team01.webapp.util.Pager;

public interface IDevelopService {
	
	public int totalRow();
	public List<SR> getDevelopList(Pager pager);

}
