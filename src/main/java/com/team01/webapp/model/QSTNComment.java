package com.team01.webapp.model;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class QSTNComment {

	private int qstnCmntNo;
	private int qstnNo;
	private int userNo;
	private String userId;
	private String qstnCmntCn;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date qstnCmntDate;
	private String userNm;
	
}
