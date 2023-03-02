package com.team01.webapp.progress.service;

import java.util.List;

import com.team01.webapp.model.HR;
import com.team01.webapp.model.Progress;
import com.team01.webapp.model.ProgressDetail;
import com.team01.webapp.model.ProgressFile;
import com.team01.webapp.model.ProgressFilter;
import com.team01.webapp.model.ProgressRate;
import com.team01.webapp.model.ProgressType;
import com.team01.webapp.model.SrFile;
import com.team01.webapp.model.SrProgressAjax;
import com.team01.webapp.model.SrProgressList;
import com.team01.webapp.model.Task;
import com.team01.webapp.model.ThArr;
import com.team01.webapp.util.Pager;

public interface IProgressService {
	/**
	 * 필터링 하기 위한 데이터 저장
	 * 
	 * @author					김태희
	 * @param progressfilter 	클라이언트가 보낸 필터링 하기 위한 데이터 정보 저장
	 * @return					ProgressFilter 객체 return
	 */
	public ProgressFilter filterList(ProgressFilter progressfilter);
	
	/**
	 * 페이지 정보 저장
	 * 
	 * @author					김태희
	 * @param pageNo			클라이언트가 보낸 Page 번호 정보 저장
	 * @param pager				클라이언트가 보낸 pager 데이터 정보 저장
	 * @param srProgressAjax	클라이언트가 보낸 필터링 후 데이터 정보 저장
	 * @return					Pager 객체 return
	 */
	public Pager returnPage(String pageNo, Pager pager, SrProgressAjax srProgressAjax);
	
	/**
	 * 페이징 처리된 SrProgress 리스트 정보 저장
	 * 
	 * @author					김태희
	 * @param pager				클라이언트가 보낸 pager 객체 정보 저장
	 * @param srProgressAjax	클라이언트가 보낸 필터링 후 데이터 정보 저장
	 * @return					List<SrProgressList> 리스트 return
	 */
	public List<SrProgressList> ProgressList(Pager pager, SrProgressAjax srProgressAjax);

	/**
	 * Progress 세부 정보 저장
	 * 
	 * @author			김태희
	 * @param srNo		클라이언트가 보낸 sr 번호 정보 저장
	 * @return			ProgressDetail 객체 return
	 */
	public ProgressDetail selectDetail(String srNo);
	
	/**
	 * 파일 데이터 정보 저장
	 * 
	 * @author				김태희
	 * @param srFileNo		클라이언트가 보낸 srFile 번호 정보 저장
	 * @return				SRFile 객체 return
	 */
	public SrFile getSrFile(int srFileNo);
	
	/**
	 * SR 인적 자원 정보 리스트 저장
	 * 
	 * @author			김태희
	 * @param srNo		클라이언트가 보낸 sr 번호 정보 저장
	 * @return			List<HR> 리스트 return
	 */
	public List<HR> humanResourceList(String srNo);
	
	/**
	 * SR 개발자 리스트 저장
	 * 
	 * @author				김태희
	 * @param userDpNm		클라이언트가 보낸 userDpNm 유저 부서 이름 정보 저장
	 * @param srNo			클라이언트가 보낸 sr 번호 정보 저장
	 * @return				List<HR> 리스트 return
	 */
	public List<HR> developerList(String userDpNm, String srNo);
	
	/**
	 * 담당업무 리스트 저장
	 * 
	 * @author		김태희
	 * @return		List<Task> 리스트 return
	 */
	public List<Task> taskList();
	
	/**
	 * SR인적 자원 추가
	 * 
	 * @author			김태희
	 * @param thArr		클라이언트가 보낸 ThArr 정보 저장
	 */
	public void developerInsert(ThArr thArr);
	
	/**
	 * SR인적 자원 수정뷰 저장
	 * 
	 * @author			김태희
	 * @param srNo		클라이언트가 보낸 sr 번호 정보 저장
	 * @param userNo	클라이언트가 보낸 user 번호 정보 저장
	 * @return			
	 */
	public HR developer(String srNo, int userNo);
	
	/**
	 * SR인적 자원 수정
	 * 
	 * @author			김태희
	 * @param hr		클라이언트가 보낸 hr 정보 저장
	 */
	public void developerUpdate(HR hr);
	
	/**
	 * SR인적 자원 삭제
	 * 
	 * @author			김태희
	 * @param srNo		클라이언트가 보낸 sr 번호 정보 저장
	 * @param userNo	클라이언트가 보낸 user 번호 정보 저장
	 */
	public void developerDelete(String srNo, int userNo);
	
	/**
	 * SR진척율 리스트 저장
	 * 
	 * @author			김태희
	 * @param srNo		클라이언트가 보낸 sr 번호 정보 저장
	 * @return			List<Progress> 리스트 return
	 */
	public List<Progress> progressRateList(String srNo);

	/**
	 * 진척율 정보 저장
	 * 
	 * @author			김태희
	 * @param progNo	클라이언트가 보낸 progNo 정보 저장
	 * @return			Progress 객체 return
	 */
	public Progress progressRate(int progNo);

	/**
	 * 진척율 파일 저장
	 * 
	 * @author			김태희
	 * @param progress	클라이언트가 보낸 progress 정보 저장
	 */
	public void writeProgressRateFile(Progress progress);

	/**
	 * 진척율 정보 업데이트
	 * 
	 * @author			김태희
	 * @param progress	클라이언트가 보낸 progress 정보 저장
	 */
	public void updateProgressRate(Progress progress);

	/**
	 *	진척율 파일 다운로드 하기위한 DB 정보 저장
	 * 
	 * @author				김태희
	 * @param progFileNo	클라이언트가 보낸 progFileNo 정보 저장
	 * @return
	 */
	public ProgressFile getProgressFile(String progFileNo);

	/**
	 * 프로그램파일 리스트 정보 저장
	 * 
	 * @author			김태희
	 * @param srNo		클라이언트가 보낸 srNo 정보 저장
	 * @return			List<ProgressFile> 리스트 return
	 */
	public List<ProgressFile> progressfileList(String srNo);

	/**
	 * 프로그램 타입 리스트 정보 저장
	 * 
	 * @author			김태희
	 * @return			List<ProgressType> 리스트 return
	 */
	public List<ProgressType> getProgressTypeList();

	/**
	 * 파일 저장을 위한 progress 정보 저장
	 * 
	 * @author				김태희
	 * @param progTypeNo	클라이언트가 보낸 progTypeNo 정보 저장
	 * @param srNo			클라이언트가 보낸 srNo 정보 저장
	 * @return				Progress 객체 return
	 */
	public Progress getProgNo(int progTypeNo, String srNo);

	/**
	 * 산출물 파일 삭제
	 * 
	 * @author				김태희
	 * @param progFileNo	클라이언트가 보낸 progFileNo 정보 저장
	 */
	public void removeProgressFiles(int progFileNo);

	public void progressRateAllAdd(ProgressRate progressRate);

	public void progressRateFinishRequest(String srNo, String progNo, String choice);

	public List<ProgressDetail> getProgressList(List<String> progressArr);

}
