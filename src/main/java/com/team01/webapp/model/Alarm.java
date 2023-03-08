package com.team01.webapp.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Alarm {
	private int alarmNo;
	private String srNo;
	private String message;
	private char messageCheck;
	private Date messageDate;
	private String alarmPry;
	private String alarmTtl;
	private String alarmCategory;
	
	//SR
	private String srTtl;
	
	//USERS
	private int userNo;
	private String userNm;
	private String userOgdp;
	private String userDpNm;
	
	//SR Stauts
	private String sttsNm;
	
}
