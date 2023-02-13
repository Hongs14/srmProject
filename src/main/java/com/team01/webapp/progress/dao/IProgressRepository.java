package com.team01.webapp.progress.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface IProgressRepository {
	List<String> taskList();
}
