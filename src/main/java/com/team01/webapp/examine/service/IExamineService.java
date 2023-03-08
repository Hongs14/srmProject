package com.team01.webapp.examine.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.team01.webapp.model.Examine;
import com.team01.webapp.model.ExamineFilter;
import com.team01.webapp.model.ExamineList;
import com.team01.webapp.model.SrFile;
import com.team01.webapp.model.Users;
import com.team01.webapp.util.Pager;

public interface IExamineService {
	
	
	/**
	 * SR 요청에 대한 리스트 수
	 * @author : 황건희
	 * @return
	 */
	public int getTotalRows();
	
	/**
	 * SR 검토 검색 조건에 대한 리스트 
	 * @author : 황건희
	 * @param examineFilter	SR 검토 검색 조건에 대해 해당 리스트 가져오기
	 * @return
	 */
	public ExamineFilter filterList(ExamineFilter examineFilter);

	/**
	 * SR 검토 리스트 가져오기
	 * @author : 황건희
	 * @param examinelist	SR 검토 리스트 가져오기
	 * @param pager			페이징 처리
	 * @return
	 */
	public List<Examine> getExamineList(Pager pager,ExamineList examinelist);
	
	
	/**
	 * SR 검토 목록 페이지 처리
	 * @author : 황건희
	 * @param examinelist	SR 검토 목록 페이지에 따른 리스트 가져오기
	 * @param pageNo		SR 검토 목록 페이지 위치
	 * @param pager			페이징 처리
	 * @return
	 */
	public Pager returnPage(int pageNo, Pager pager, ExamineList examinelist);
	
	
	/**
	 * SR 검토 상세 조회
	 * @author : 황건희
	 * @param srNo 상세조회를 위한 srNo
	 * @return
	 */
	public Examine getExamine(String srNo);
	public List<MultipartFile> selectExamineFileList(String srNo);
	public SrFile selectFileDownload(int srFileNo);
	
	public void updateExamine(Examine examine);
	public void updateExamineProcessing(ExamineList examinelist);
	
	//로그인한 유저 정보 가져오기
	public Users selectLoginUser(int userNo);
}
