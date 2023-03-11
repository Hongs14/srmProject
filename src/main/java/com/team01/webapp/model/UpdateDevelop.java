package com.team01.webapp.model;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class UpdateDevelop {
	//SR계발 계획
	private String srNo;
	private String sysNo;
	private int sttsNo;
	private String srCn;
	private Date srRegDate;
	private int srBgt;
	private String srDevCn;
	private String srReqSe;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date srDdlnDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date srStartDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date srEndDate;
	private String srStd;
	private String srDevDp;

	//HR등록
	private int[] userNo;
	private String[] hrLeader;
	private int[] taskNo;
	private Date[] hrStartDate;
	private Date[] hrEndDate;
}






