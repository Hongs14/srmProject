package com.team01.webapp.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QSTN {

	private int qstnNo;
	private int rnum;
	private String qstnTtl;
	private String qstnCn;
	private int qstnInqCnt;
	private Date qstnWrtDate;
	private String userNo;
	private String userNm;
	private int countCmnt;
	private String sysNo;
	private String qstnSecret;
	
	private String qstnFilePhysNm; //바꾼 파일 명
	private String qstnFileActlNm; //원본 파일 이름
	private String qstnFileExtnNm; //파일 확장명
	
	/*private List<QSTNComment> qstnCmnt;*/
	//첨부파일
	private int qstnFileNo;
	private List<MultipartFile> qstnMFile;
	private List<String> deleteFile;
	
	//조건
	private String startDate;
	private String endDate;
	private String range;
	
	//paging
	private int startRowNo;
	private int endRowNo;
	
	
}
