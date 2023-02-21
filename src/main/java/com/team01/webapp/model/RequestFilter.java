package com.team01.webapp.model;

import java.util.List;

import lombok.Data;

@Data
public class RequestFilter {
	private List<System> SysNmList;
	private List<SRType> SrTypeList;
	private List<SRStts> SrSttsList;
	private List<String> UserOgdpList;
	private List<String> SrDevDpList;
}
