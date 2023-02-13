package com.team01.webapp.model;

import java.sql.Date;

import lombok.Data;

@Data
public class QSTNComment {

	private int qstnCmntNo;
	private int qstnNo;
	private int userNo;
	private String userId;
	private String qstnCmntCn;
	private Date qstnCmntDate;
	
}
