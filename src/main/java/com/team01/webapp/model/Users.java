package com.team01.webapp.model;

import java.util.List;

import lombok.Data;

@Data
public class Users {

	private int userNo;
	private String userId;
	private String userPswd;
	private String userjbps;
	private String userNm;
	private String usertype;
	private String userOgdp;
	private String userEml;
	private String userTelNo;
	private String userDelYn;
	private String userDpNm;
	
	private List<HR> devList;
}
