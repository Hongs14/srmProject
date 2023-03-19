package com.team01.webapp.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class NoticeComment {
	
	private int ntcCmntNo;
	private int ntcNo;
	private int userNo;
	private String ntcCmntCn;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private String ntcCmntDate;
	private String userNm;
}
