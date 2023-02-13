package com.team01.webapp.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Qnaboard {
	private String qstnNo;
	private String qstnTtl;
	private String qstnCn;
	private int qstnInqCnt;
	private Date qstnWrtDate;
	private String userNo;
	private String userNm;
}
