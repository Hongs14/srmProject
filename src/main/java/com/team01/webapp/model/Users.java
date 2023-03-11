package com.team01.webapp.model;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class Users {

	private int userNo;
	private String userId;
	private String userPswd;
	private String checkPswd;
	private String userJbps;
	private String userNm;
	private String userType;
	private String userOgdp;
	private String userEml;
	private String userTelno;
	private char userDelYn;
	private String userDpNm;
	
	private String sysNm;
	private List<HR> devList;
	private String sysNo;
	private Date sysUpdtDate;
	
	
}
