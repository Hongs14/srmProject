package com.team01.webapp.model;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class QSTN {

	private String qstnNo;
	private String qstnTtl;
	private String qstnCn;
	private int qstnInqCnt;
	private Date qstnWrtDate;
	private String sysNo;
	private String userNo;
	private String userNm;
	private int countCmnt;
	
	private List<QSTNComment> qstnCmnt;
	
	private Date startDate;
	private Date endDate;
	//paging
	private int startRowNo;
	private int endRowNo;
	
}
