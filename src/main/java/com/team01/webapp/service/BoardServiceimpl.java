package com.team01.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.webapp.dao.BoardDao;
import com.team01.webapp.dto.Board;
import com.team01.webapp.dto.Pager;
import com.team01.webapp.interceptor.Authorization;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class BoardServiceimpl implements BoardService{
	
	@Autowired
	private BoardDao boardDao;
	
	public void write(Board board) {
		log.info("실행");
		int rows = boardDao.insert(board);
		log.info("반영된 행수: "+rows);
	}

	@Override
	public int getTotalRows() {
		log.info("실행");
		int rows = boardDao.count();
		return rows;
	}

	@Override
	public List<Board> getBoards(Pager pager) {
		log.info("실행");
		List<Board> boards = boardDao.selectAll(pager);
		return boards;
	}

	@Override
	public Board getBoard(int bno) {
		log.info("실행");
		Board board =boardDao.selectByBno(bno);
		return board;
	}

	@Override
	public void delete(int bno) {
		log.info("실행");
		int rows = boardDao.deleteByBno(bno);
	};
}
