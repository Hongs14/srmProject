package com.team01.webapp.qnaboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.webapp.model.QSTN;
import com.team01.webapp.qnaboard.dao.IQnaboardRepository;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class QnaboardService implements IQnaboardService {
	
	@Autowired
	public IQnaboardRepository qnaboardRepository;

	@Override
	public List<QSTN> getList() {
		int totalrow = qnaboardRepository.totalRow();
		System.out.println("totalrow: "+totalrow);
		Pager pager = new Pager(10, 5, totalrow, totalrow/5+1);
		List<QSTN> list = qnaboardRepository.selectQnaboardList(pager);
		return list;
	}
	
}
