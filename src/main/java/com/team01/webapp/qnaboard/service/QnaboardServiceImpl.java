package com.team01.webapp.qnaboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.webapp.qnaboard.dao.IQnaboardRepository;
import com.team01.webapp.qnaboard.dto.Qnaboard;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class QnaboardServiceImpl implements QnaboardService {
	
	@Autowired
	public IQnaboardRepository qnaboardRepository;

	@Override
	public List<Qnaboard> getList() {
		int totalrow = qnaboardRepository.totalRow();
		System.out.println("totalrow: "+totalrow);
		Pager pager = new Pager(10, 5, totalrow, totalrow/5+1);
		log.info(pager.toString());
		List<Qnaboard> list = qnaboardRepository.selectQnaboardList(pager);
		return list;
	}
	
}
