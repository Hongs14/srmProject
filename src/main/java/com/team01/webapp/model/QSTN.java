package com.team01.webapp.model;

import java.sql.Date;

import lombok.Data;

@Data
public class QSTN {

	private int qstnNo;
	private String userId;
	private String qstnTtl;
	private String qstnCn;
	private int qstnInqCnt;
	private Date qstnWrtDate;
	
}
