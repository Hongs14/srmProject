package com.team01.webapp.model;

import java.util.List;

import lombok.Data;

@Data
public class Users {

	private int userNo;
	private String userId;
	private String userPswd;
	private String userJbps;
	private String userNm;
	private String userType;
	private String userOgdp;
	private String userEml;
	private String userTelNo;
	private char userDelYn;
	private String userDpNm;
	
	private String sysNm;
	private List<HR> devList;
	
	
}
