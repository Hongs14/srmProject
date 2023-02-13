package com.team01.webapp.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Progress {

	private String progNo;
	private String srNo;
	private String progType;
	private Date progStartDate;
	private Date progEndDate;
	private int progRate;
	
}
