package com.team01.webapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.webapp.dao.BoardDao;
import com.team01.webapp.dto.Board;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class BoardServiceimpl2 {
	
	@Autowired
	private BoardDao boardDao;
	
	public void write(Board board) {
		log.info("실행");
		int rows = boardDao.insert(board);
		log.info("반영된 행수: "+rows);
	};
}
