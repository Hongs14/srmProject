package com.team01.webapp.develop.service;

import java.util.List;

import com.team01.webapp.model.DevelopFilter;
import com.team01.webapp.model.Examine;
import com.team01.webapp.model.ExamineList;
import com.team01.webapp.model.HR;
import com.team01.webapp.model.Progress;
import com.team01.webapp.model.SR;
import com.team01.webapp.model.SrFile;
import com.team01.webapp.model.UpdateDevelop;
import com.team01.webapp.model.DevelopDto;
import com.team01.webapp.model.Users;
import com.team01.webapp.util.Pager;

/**
 * @author KOSA
 *
 */
public interface IDevelopService {
	/**SR개발관리 리스트 가져오기
	 * @author 			 	정홍주
	 * @param pager			페이징 처리
	 * @param developDto	개발관리 객체
	 * @return
	 */
	public List<DevelopDto> getDevelopList(Pager pager, DevelopDto developDto);
	
	/**SR개발관리 페이징 처리
	 * @author 				정홍주
	 * @param pageNo		SR개발관리 목록 페이지 위치
	 * @param pager			페이징 처리
	 * @param developDto	SR개발관리 페이지에 따른 리스트 가져오기
	 * @return
	 */
	public Pager returnPage(int pageNo, Pager pager, DevelopDto developDto);
	
	/**SR개발 필터링 된 목록
	 * @author				정홍주
	 * @param developFilter	필터
	 * @return
	 */
	public DevelopFilter filterList(DevelopFilter developFilter);
	
	/**SR개발 상세보기
	 * @author		정홍주
	 * @param srNo	해당 srNo
	 * @return		
	 */
	public DevelopDto getDetail(String srNo);
	
	/**SR개발
	 * @author	 정홍주
	 * @return
	 */
	public List<Users> getDevelopList();
	
	/**SR개발계획 수정하기
	 * @author				정홍주
	 * @param updateDevelop	개발계획과 투입인력을 저장한 객체
	 * @return
	 */
	public int updateDevelopSr(UpdateDevelop updateDevelop);
	
	/**투입인력 불러오기
	 * @author				정홍주
	 * @param userDpNm		팀이름
	 * @param userNo		개발자의 userNo
	 * @param hrStartDate	투입시작일
	 * @param hrEndDate		투입 종료일
	 * @return
	 */
	public List<Users> selectDeveloperList(String userDpNm, int userNo, String hrStartDate, String hrEndDate);
	
	/**개발담당자를 선택하기 위해 개발자들 불러오기
	 * @author			정홍주
	 * @param userNo	개발자의 userNo
	 * @return
	 */
	public List<Users> selectDevName(int userNo);
	
	/**파일정보 가져오기
	 * @author			정홍주
	 * @param srFileNo	sr파일 번호
	 * @return
	 */
	public SrFile getSrFile(int srFileNo);
	
	/**진척 테이블에 행 추가하기
	 * @author		정홍주
	 * @param srNo	요청서 번호
	 * @return
	 */
	public int insertProgress(String srNo);
	
	/**인력 리스트 불러오기
	 * @author 		정홍주
	 * @param srNo	요청 번호
	 * @return		HR객체
	 */
	public List<HR> selectHrList(String srNo);
	
	/**개발담당자의 정보 가져오기
	 * @author		정홍주
	 * @param srNo	요청서 번호
	 * @return
	 */
	public Users getLeader(String srNo);
	
	/**로그인한 사용자의 정보
	 * @author			정홍주
	 * @param userNo	로그인한 사용자의 userNo
	 * @return
	 */
	public Users getLoginUserInfo(int userNo);
	
	/**액셀에 출력할 정보 가져오기
	 * @author				정홍주
	 * @param developSRArr	선택된 요청서의 번호가 담겨있는 리스트
	 * @return
	 */
	public List<DevelopDto> getPrintExcelList(List<String> developSRArr);
	
	/**스케줄러를 사용한 상태 변경
	 * @author	정홍주
	 * @return	
	 */
	public int changeStatus();
	
}
