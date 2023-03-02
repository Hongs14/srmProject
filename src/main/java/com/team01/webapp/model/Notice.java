package com.team01.webapp.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
	private String ntcPryStartDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
	private String ntcPryEndDate;
	private String userId;
	private int countCmnt;
	private String sysNo;
	private String ntcFilePhysNm; //바꾼 파일 명
	private String ntcFileActlNm; //원본 파일 이름
	private String ntcFileExtnNm; //파일 확장명
	
	private int seq;
	
	private String startDate;
	private String endDate;
	private String ntcToday;
	private String ntcWeek;
	private String ntcMonth;
	
	private List<NoticeComment> ntcCmnt;
	
	//공지사항 첨부파일
	private int ntcFileNo;
	private List<MultipartFile> ntcMFile;
	
	//paging
	private int startRowNo;
	private int endRowNo;
}
