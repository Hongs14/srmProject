package com.team01.webapp.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Examine {
	private String srNo;
	private int srCustId;
	private String sysNo;
	private int sttsNo;
	private String srTtl;
	private String srCn;
	private Date srRegDate;
	private String srPry;
	private String srOpnn;
	private int srBgt;
	private String srDevCn;
	private String srReqSe;
	private Date srDdlnDate;
	private Date srStartDate;
	private Date srEndDate;
	private String srViewYn;
	
	//시스템
	private String sysNm;
	
	//USERS
	private String userNm;
	private String userOgdp;
	private String userDpNm;
	
	//SR Stauts
	private String sttsNm;
	
	//seq
	private int seq;
}
