package com.team01.webapp.model;

import java.util.List;

import lombok.Data;

@Data
public class ProgressFilter {
	private List<System> SysNmList;
	private List<SRType> SrTypeList;
	private List<SRStts> SrSttsList;
}
