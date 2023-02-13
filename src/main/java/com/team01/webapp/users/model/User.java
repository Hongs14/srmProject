package com.team01.webapp.users.model;

import lombok.Data;
import lombok.extern.log4j.Log4j2;

@Data
public class User {
	
	private int userNo;
	private String userId;
	private String userPswd;
	private String userJbps;
	private String userNm;
	private String userType;
	private String userOgdp;
	private String userEml;
	private String userTelno;
	private char userDelYn;
	private String userDpNm;

}
