package com.team01.webapp.progress.service;

import java.util.List;

import com.team01.webapp.model.ProgressFilter;
import com.team01.webapp.model.SrProgressAjax;
import com.team01.webapp.model.SrProgressList;
import com.team01.webapp.util.Pager;

public interface IProgressService {
	public ProgressFilter filterList(ProgressFilter progressfilter);
	public Pager returnPage(String pageNo, Pager pager, SrProgressAjax srProgressAjax);
	public List<SrProgressList> ProgressList(Pager pager, SrProgressAjax srProgressAjax);
}
