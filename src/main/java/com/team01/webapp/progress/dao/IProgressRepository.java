package com.team01.webapp.progress.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.team01.webapp.model.HR;
import com.team01.webapp.model.ProgressDetail;
import com.team01.webapp.model.SRFile;
import com.team01.webapp.model.SRStts;
import com.team01.webapp.model.SRType;
import com.team01.webapp.model.SrProgressAjax;
import com.team01.webapp.model.SrProgressList;
import com.team01.webapp.model.System;

@Repository
public interface IProgressRepository {
	// 필터링 용
	List<System> selectSysNmList();
	List<SRType> selectSrType();
	List<SRStts> selectSttsNmList();
	int selectTotalProgressCount(SrProgressAjax srProgressAjax);
	List<SrProgressList> selectProgressList(SrProgressAjax srProgressAjax);
	ProgressDetail selectProgressRequester(String srNo);
	ProgressDetail selectProgessdeveloper(String srNo);
	List<SRFile> selectSrFileList(String srNo);
	SRFile selectSrFile(int srFileNo);
	List<HR> selectHumanResourceList(String srNo);
}
