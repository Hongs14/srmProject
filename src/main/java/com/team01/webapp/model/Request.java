package com.team01.webapp.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Request {
	private String srNo;
	private String userNm;
	private String userOgdp;
	private Date srRegDate;
	private String sysNm;
	private String srTtl;
	private String srStd;
	private String srCn;	
}
