package com.team01.webapp.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SR {
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
	private String srStd;
	private MultipartFile file;

}
