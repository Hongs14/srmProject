package com.team01.webapp.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Notice {
	
	private int ntcNo;
	private int userNo;
	private String ntcTtl;
	private String ntcCn;
	private int ntcInqCnt;
	private Date ntcWrtDate;
	private String ntcPry;
	private String userId;
	
}
