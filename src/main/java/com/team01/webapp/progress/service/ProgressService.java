package com.team01.webapp.progress.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.webapp.model.ProgressFilter;
import com.team01.webapp.progress.dao.IProgressRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class ProgressService implements IProgressService {
	
	@Autowired
	private IProgressRepository progressRepository;
	
	private ProgressFilter progressFilter;
	
	@Override
	public ArrayList<String> taskList() {
		List<String> list = new ArrayList<>();
		list = progressRepository.taskList();
		
		log.info(list.get(0));
		
		return null;
	}

}
