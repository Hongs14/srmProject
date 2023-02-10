package com.team01.webapp.progress.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.team01.webapp.progress.dao.IProgressRepository;

@Service
public class ProgressService implements IProgressService {
	
	IProgressRepository progressRepository;
	
	@Override
	public ArrayList<String> taskList() {
		
		return null;
	}

}
