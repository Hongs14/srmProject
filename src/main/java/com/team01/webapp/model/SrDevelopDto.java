package com.team01.webapp.model;

import java.sql.Date;

import lombok.Data;

@Data
public class SrDevelopDto {
	private String srNo;
	private int srCustNo;
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
	private String srStd;
	
	//등록자 , 소속, 개발부서
	private String userNm;
	private String userOgdp;
	private String userDpNm;
	private String sttsNm;
	private String sysNm;
}
