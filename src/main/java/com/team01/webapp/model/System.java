package com.team01.webapp.model;

import java.sql.Date;

import lombok.Data;

@Data
public class System {

	private String sysNo;
	private int ManagerNo;
	private String sysNm;
	private Date sysUpdtDate;
	private String ManagerNm;
}
