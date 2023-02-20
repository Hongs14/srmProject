package com.team01.webapp.request.service;

import java.io.File;
import java.util.List;

import com.team01.webapp.model.SR;
import com.team01.webapp.util.Pager;

public interface IRequestService {
		
		/**
		 * 리스트 페이징 처리
		 * 
		 * @author			김희률
		 * @param pageNo	현재 페이지넘버
		 * @param pager		페이저 객체
		 * @return			페이저 리턴
		 */
		Pager returnPage(String pageNo, Pager pager);
		List<SR> getTotalArticleList(Pager pager);
		
		
		/**
		 * 작성자의 시스템 정보 가져오기
		 * 
		 * @author	김희률
		 * @param userNo
		 * @return
		 */
		String getSysNo(int userNo);
		
		/**
		 * SR 요청 작성 
		 * 
		 * @author		김희률
		 * @param sr	SR요청 정보
		 * @param file	첨부파일
		 */
		void writeRequest(SR sr, File file);
		void writeRequest(SR sr);

}
