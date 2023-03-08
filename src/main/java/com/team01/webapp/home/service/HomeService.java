package com.team01.webapp.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team01.webapp.home.dao.IHomeRepository;
import com.team01.webapp.model.DevMini;
import com.team01.webapp.model.Donut;
import com.team01.webapp.model.HR;
import com.team01.webapp.model.Progress;
import com.team01.webapp.model.ProgressDetail;
import com.team01.webapp.model.SR;
import com.team01.webapp.model.SystemInfo;
import com.team01.webapp.progress.dao.IProgressRepository;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class HomeService implements IHomeService{
	
	@Autowired
	IHomeRepository homeRepository;
	
	@Autowired
	IProgressRepository progressRepository;

	@Override
	public List<SystemInfo> getSystemMiniView(int userNo) {
		log.info("실행");
		return homeRepository.selectSysInfo(userNo);
	}

	@Override
	public List<Donut> getDonutList(String sysNo) {
		return homeRepository.selectDonutList(sysNo);
	}

	@Override
	public List<SystemInfo> getSystemMiniViewDetail(int userNo) {
		return homeRepository.selectSysInfo2(userNo);
	}

	@Override
	public Pager returnPage(int pageNo, Pager pager, SR sr) {
		int totalListNum = (int) homeRepository.selectTotalCount(sr);
		
		pager = new Pager(6, 5, totalListNum, pageNo);
		
		return pager;
	}

	@Override
	public List<SR> homeList(Pager pager, SR sr) {
		int end = pager.getPageNo() * pager.getRowsPerPage();
		int start = (pager.getPageNo()-1)* pager.getRowsPerPage()+1;
		
		sr.setEnd(end);
		sr.setStart(start);
		
		log.info(start);
		log.info(end);
		
		return homeRepository.selectHomeList(sr);
		
	}

	@Override
	public List<Donut> getDonutListDeveloper(int userNo) {
		return homeRepository.selectDonutListDeveloper(userNo);
	}

	@Override
	public ProgressDetail selectDetailHome(String srNo) {
		ProgressDetail progressDetail = progressRepository.selectProgressRequester(srNo);
		
		if(progressDetail == null) {
			progressDetail = homeRepository.selectRequestSr(srNo);
			
		}
		
		String sttsNm = progressDetail.getSttsNm();
		
		if(sttsNm.equals("요청") || sttsNm.equals("검토중") || sttsNm.equals("접수") || sttsNm.equals("반려") || sttsNm.equals("재검토")) {
		
		} else {
			// 개발자 정보 담아주기
			ProgressDetail progressDetailDeveloper = progressRepository.selectProgessdeveloper(srNo);
			progressDetail.setDpNm(progressDetailDeveloper.getDpNm());
			progressDetail.setDeveloperNm(progressDetailDeveloper.getDeveloperNm());
			progressDetail.setSrStartDate(progressDetailDeveloper.getSrStartDate());
			progressDetail.setSrEndDate(progressDetailDeveloper.getSrEndDate());
		}
		
		return progressDetail;
	}

	@Override
	public List<HR> DeveloperList(String srNo) {
		return progressRepository.selectHumanResourceList(srNo);
	}

	@Override
	public DevMini getDevMini(DevMini devMini) {
		devMini = homeRepository.selectSrData(devMini.getSrNo());
		int count = 0;
		int plus = 0;
		List<Progress> progressList = homeRepository.selectProgressList(devMini.getSrNo());
		devMini.setProgressList(progressList);
		List<HR> hrList = homeRepository.selectHrList(devMini.getSrNo());
		devMini.setHrList(hrList);
		
		for(int i=0; i<progressList.size(); i++) {
			plus = homeRepository.selectFileCount(progressList.get(i).getProgNo());
			count += plus;
		}
		devMini.setCount(count);
		
		return devMini;
	}

}
