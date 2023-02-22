package com.team01.webapp.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Progress {

	private String progNo;
	private String srNo;
	private String progType;
	private Date progStartDate;
	private Date progEndDate;
	private int progRate;
	
	private String progTypeNm;
	private int progTypeNo;
	
	private String progFilePhysNm;
	private String progFileActlNm;
	private String progFileExtnNm;
	private List<MultipartFile> progressattach;
	
	private List<ProgressFile> progressFile;
	
}
