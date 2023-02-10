package com.team01.webapp.progress.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

@Repository
public interface IProgressRepository {
	ArrayList<String> taskList();
}
