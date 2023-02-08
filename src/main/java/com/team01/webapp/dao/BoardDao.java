package com.team01.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team01.webapp.dto.Board;
import com.team01.webapp.dto.Pager;

@Mapper
public interface BoardDao {
	
	public int insert(Board board);
	//행수 반환
	public int count();
	public List<Board> selectAll(Pager pager);
	//게시글 조회
	public Board selectByBno(int bno);
	
	//삭제
	public int deleteByBno(int bno);

}
