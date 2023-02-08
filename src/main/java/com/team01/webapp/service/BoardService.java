package com.team01.webapp.service;

import java.util.List;

import com.team01.webapp.dto.Board;
import com.team01.webapp.dto.Pager;

public interface BoardService {
	//쓰기
	public void write(Board board);
	
	//전체 행수
	public int getTotalRows();
	
	//리스트 가져오기
	public List<Board> getBoards(Pager pager);
	
	//하나의 보드 가져오기
	public Board getBoard(int bno);
	
	//삭제
	public void delete(int bno);
}
