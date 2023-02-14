package com.team01.webapp.model;

import lombok.Data;

@Data
public class SrProgressAjax {
	private int sysNo;
	private int srTypeNo;
	private int srSttsNo;
	private String srName;
	private String srNo;
	
	// pageing 이용
	private int start;
	private int end;
}
