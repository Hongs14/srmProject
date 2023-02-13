package com.team01.webapp.model;

import java.util.List;

import lombok.Data;

@Data
public class ProgressFilter {
	private String name;
	private List<String> taskList;
}
