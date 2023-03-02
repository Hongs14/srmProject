package com.team01.webapp.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SR {
	private String srNo;
	private int srCustNo;
	private String sysNo;
	private int sttsNo;
	private String srTtl;
	private String srCn;
	private Date srRegDate;
	private String srDevDp;
	private String srPry;
	private String srOpnn;
	private int srBgt;
	private String srDevCn;
	private String srReqSe;
	private Date srDdlnDate;
	private Date srStartDate;
	private Date srEndDate;
	private char srDelYn;
	private String srStd;
	
	private int pageNo;
	private String sysNm;
	private String sttsNm;
	private String userType;
	
	private int requestFileNo;
	private List<MultipartFile> requestMFile;
	private List<String> deleteFile; 
	

	// pageing 이용
	private int start;
	private int end;
}
