package com.team01.webapp.model;

import java.sql.Date;

import lombok.Data;

@Data
public class SrProgressList {
	private String srNo;
	private String sysNm;
	private String srTypeNm;
	private String srTtl;
	private String userNm;
	private Date srDdlnDate;
	private String sttsNm;
	private String srPry;
}
