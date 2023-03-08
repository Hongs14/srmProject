package com.team01.webapp.model;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class DevMini {
	private String srNo;
	private String srTypeNm;
	private String srTtl;
	private String sysNm;
	private String srRequesterNm;
	private int srBgt;
	private Date srStartDate;
	private int count;
	
	private List<Progress> progressList;
	private List<HR> hrList;
}
