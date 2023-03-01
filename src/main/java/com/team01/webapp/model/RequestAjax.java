package com.team01.webapp.model;

import lombok.Data;

@Data
public class RequestAjax {
	private int checkMySR;
	private int userNo;
	private String srDevDp;
	private String sysNo;
	private String sttsNo;
	private String userOgdp;
	private String srNo;
	private String srTtl;
	
	private String srRegStartDate;
	private String srRegEndDate;
	
	// pageing 이용
	private int start;
	private int end;
}
