package com.team01.webapp.model;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProgressDetail {
	private String srNo;
	private String srTypeNm;
	private String srTtl;
	private String srStd;
	private String sysNm;
	private String sttsNm;
	private String userDpNm;
	private String requesterNm;
	private int srBgt;
	private Date srRegDate;
	private Date srDdlnDate;
	private String srCn;
	private String dpNm;
	private String developerNm;
	private Date srStartDate;
	private Date srEndDate;
	
	// 멀티 파일
	private List<SrFile> srFile;
	
	private String srPry;
}
