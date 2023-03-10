package com.team01.webapp.model;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class HR {
	private String srNo;
	private int userNo;
	private int taskNo;
	private Date hrStartDate;
	private Date hrEndDate;
	private String hrLeader;
	
	private String userNm;
	private String userDpNm;
	private String userJbps;
	private String userTelno;
	private String taskNm;
	private String srTtl;
	
	private String status;
	
	private List<DeveloperSR> srList;
	
}
