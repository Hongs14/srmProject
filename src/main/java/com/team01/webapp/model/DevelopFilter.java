package com.team01.webapp.model;

import java.util.List;

import lombok.Data;

@Data
public class DevelopFilter {
	private List<SRStts> srSttsList;
	private List<System> sysNmList;
	private List<Users> userOgdpList;
	private List<Users> userDpList;
}
