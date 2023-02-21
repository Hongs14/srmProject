package com.team01.webapp.model;

import java.sql.Date;

import lombok.Data;

@Data
public class RequestList {
	private String srNo;
	private String srTtl;
	private String sysNm;
	private String userNm;
	private String userDpNm;
	private String srDevDp;
	private String srTypeNm;
	private String sttsNm;
	private Date srRegDate;
	private Date srDdlnDate;
	private String srPry;
	private String sysNo;
	private String sttsNo;
	private String userOgdp;
	//seq
	private int seq;
	
}
