package com.team01.webapp.model;

import java.util.List;

import lombok.Data;

@Data
public class ProgressRate {
	private String srNo;
	private List<Progress> progressArr;
}
