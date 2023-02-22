package com.team01.webapp.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ProgressFile {

	private int progFileNo;
	private String progNo;
	private String progFilePhysNm;
	private String progFileActlNm;
	private String progFileExtnNm;
	private Date progRegDate;
	
	private String progTypeNm;
}
