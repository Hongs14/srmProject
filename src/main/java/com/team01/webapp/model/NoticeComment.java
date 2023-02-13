package com.team01.webapp.model;

import lombok.Data;

@Data
public class NoticeComment {
	
	private int ntcCmntNo;
	private int ntcNo;
	private int userNo;
	private String ntcCmntCn;
	private String ntcCmntDate;
	private String userId;
}
