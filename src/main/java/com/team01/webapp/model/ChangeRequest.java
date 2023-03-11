package com.team01.webapp.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ChangeRequest {
	private int crNo;
	private Date crRegDate;
	private String srNo;
	private int userNo;
	private String userNm;
	private String crTtl;
	private String crCn;
	private String crResult;
	private String crComment;
	private String crFilePhysNm;
	private String crFileExtnNm;
	private String crFileActlNm;
	private String crDdlnDate;
	
	private MultipartFile changeRequestFile;
	
	private String date;
	
	private int choice;
}
