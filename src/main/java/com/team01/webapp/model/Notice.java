package com.team01.webapp.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Notice {
	
	private int ntcNo;
	private int userNo;
	private String ntcTtl;
	private String ntcCn;
	private int ntcInqCnt;
	private Date ntcWrtDate;
	private String ntcPry;
	private String userId;
	private String ntcFilePhysNm; //바꾼 파일 명
	private String ntcFileActlNm; //원본 파일 이름
	private String ntcFileExtnNm; //파일 확장명
	private MultipartFile ntcMFile;
}
