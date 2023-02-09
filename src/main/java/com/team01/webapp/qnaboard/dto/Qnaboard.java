package com.team01.webapp.qnaboard.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Qnaboard {
	private String qstnNo;
	private String qstnTtl;
	private String qstnCn;
	private int qstnInqCnt;
	private Date qstnWrtDate;
	private String userId;
}
