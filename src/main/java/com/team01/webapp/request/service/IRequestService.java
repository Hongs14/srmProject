package com.team01.webapp.request.service;

import java.io.File;
import java.util.List;

import com.team01.webapp.model.RequestAjax;
import com.team01.webapp.model.RequestFilter;
import com.team01.webapp.model.RequestList;
import com.team01.webapp.model.SR;
import com.team01.webapp.util.Pager;

public interface IRequestService {
		
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
		
		
		RequestFilter getFilterList(RequestFilter requestFilter);
		
		Pager returnPage(int pageNo, Pager pager, RequestAjax requestAjax);
		List<RequestList> getRequestList(Pager pager, RequestAjax requestAjax);

}
