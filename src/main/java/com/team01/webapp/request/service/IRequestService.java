package com.team01.webapp.request.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.team01.webapp.model.Request;
import com.team01.webapp.model.RequestAjax;
import com.team01.webapp.model.RequestFilter;
import com.team01.webapp.model.RequestList;
import com.team01.webapp.model.SR;
import com.team01.webapp.model.SrFile;
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
		 * @param srFile	첨부파일
		 */
		String writeRequest(SR sr);
		
		
		RequestFilter getFilterList(RequestFilter requestFilter);
		
		Pager returnPage(String pageNo, Pager pager, RequestAjax requestAjax);
		List<RequestList> getRequestList(Pager pager, RequestAjax requestAjax);

		Request getRequestDetail(String srNo);	

		int requestFileUpload(SrFile srFile);
	
		List<MultipartFile> selectRequestFileDetail(String srNo);

		SrFile selectFileDownload(String srFileNo);

		int updateRequest(SR sr);
		//업데이트시 파일삭제
		int deleteExistingFile(String string);
		
		//요청 삭제처리
		int deleteRequest(String srNo);

		List<RequestList> getRequestExcelList(List<String> requestArr);

}
