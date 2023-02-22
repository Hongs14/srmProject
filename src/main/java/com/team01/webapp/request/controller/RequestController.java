package com.team01.webapp.request.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.team01.webapp.model.Request;
import com.team01.webapp.model.RequestAjax;
import com.team01.webapp.model.RequestFilter;
import com.team01.webapp.model.RequestList;
import com.team01.webapp.model.SR;
import com.team01.webapp.model.SrFile;
import com.team01.webapp.request.service.IRequestService;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/request")
@Log4j2
public class RequestController {
	
	@Autowired
	IRequestService requestService;
	
	/**
	 * 모든 SR리스트 조회
	 * 
	 * @author				김희률
	 * @param session		HttpSession 객체 주입
	 * @param model			View로 데이터 전달을 위한 Model 객체 주입
	 * @param requestFilter	검색을 위한 필터 불러오기
	 * @return				list뷰로 이동
	 */
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String getRequestFilter( HttpSession session, RequestFilter requestFilter, Model model) {
		log.info("실행");
		requestFilter = requestService.getFilterList(requestFilter);
		model.addAttribute("requestfilter", requestFilter);
		return "request/list";
		
	}
	
	/**
	 * 필터링한 리스트 조회
	 * 
	 * @author				김희률
	 * @param pageNo		페이지정보를 저장
	 * @param requestAjax	필터링에 필요한 정보를 저장
	 * @param model			View로 데이터 전달을 위한 Model 객체 주입
	 * @param pager			paging처리를 위한 
	 * @return
	 */
	@PostMapping(value="/filter/{pageNo}")
	public String getFilteredList(@PathVariable String pageNo, @RequestBody RequestAjax requestAjax, Model model, Pager pager) {
		pager = requestService.returnPage(pageNo, pager, requestAjax);
		List<RequestList> list = requestService.getRequestList(pager, requestAjax);
		
		model.addAttribute("requestLists",list);
		model.addAttribute("pager",pager);
		
		return "request/ajaxList";
	}
	
	
	/**
	 * @author					김희률
	 * @param session			
	 * @param requestFilter		필터 유지하기
	 * @param model
	 * @param pager
	 * @return
	 */
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public String writeRequest(HttpSession session, RequestFilter requestFilter,  Model model, Pager pager) {
		log.info("정보 로그 실행");
		requestFilter = requestService.getFilterList(requestFilter);
		model.addAttribute("requestfilter", requestFilter);
		model.addAttribute("pager", pager);
		return "request/write";
	}
	
	/**
	 * SR 상세 확인 하기
	 * 
	 * @author	김희률
	 * @param srNo
	 * @param requestFilter
	 * @param session
	 * @param model
	 * @param pager
	 * @return
	 */
	@RequestMapping(value="/detail/{srNo}", method = RequestMethod.GET)
	public String getDetail(@PathVariable String srNo, RequestFilter requestFilter, HttpSession session, Model model, Pager pager) {
		log.info("실행"+srNo);

		Request request = requestService.getRequestDetail(srNo);
		model.addAttribute("sr", request);
		model.addAttribute("srNo", srNo);
		return "request/detail";
		
	}
	
	@RequestMapping(value="/detail/sr/{srNo}", method = RequestMethod.GET)
	public String getSrDetail(@PathVariable String srNo, HttpSession session, Model model, Pager pager) {
		log.info("srNo: "+srNo);
		Request request = requestService.getRequestDetail(srNo);
		model.addAttribute("sr", request);
		return "request/detailView";
		
	}
	
	
	
	/**
	 * SR 요청 작성
	 * 
	 * @author			김희률
	 * @param sr		요청 정보를 담은 sr객체 주입
	 * @param session	HttpSession 객체 주입
	 * @param model		View로 데이터 전달을 위한 Model 객체 주입
	 * @return
	 */
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String writeRequest(SR sr, HttpSession session, Model model) {
		int rows =0;
		try {
			sr.setSrTtl(Jsoup.clean(sr.getSrTtl(), Whitelist.basic()));
			String content = sr.getSrCn();
			content = content.replace("\r\n", "<br>");
			content = content.replace("\r", "<br>");
			content = content.replace("\n", "<br>");
			sr.setSrCn(Jsoup.clean(content, Whitelist.basic()));
			int userNo = (int) session.getAttribute("userNo");
			log.info("loginUser:"+ userNo);
			sr.setSrCustNo(userNo); 
			sr.setSysNo(requestService.getSysNo(userNo));
			sr.setSttsNo(1);
			
			
			MultipartFile mfile = sr.getFile();
			if(mfile!=null&& !mfile.isEmpty()) {
				log.info(mfile.getOriginalFilename());
				SrFile srFile = new SrFile();
				srFile.setSrFileActlNm(mfile.getOriginalFilename());
				srFile.setSrFileExtnNm(mfile.getContentType());
				String physNm = new Date().getTime()+"_"+mfile.getOriginalFilename();
				srFile.setSrFilePhysNm(physNm);
				
				File file = new File("C:/Temp/uploadfiles/"+physNm);
				mfile.transferTo(file);
				
				requestService.writeRequest(sr, file);
			}else {
				rows = requestService.writeRequest(sr);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		log.info("변경 행수 : "+ rows);
		return "redirect:/request/write/1";
	}

}
