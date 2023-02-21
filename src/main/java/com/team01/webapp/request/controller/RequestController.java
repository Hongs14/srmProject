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
	 * @param pager			paging처리를 위한 pager객체 주입
	 * @param requestFilter	검색을 위한 필터 불러오기
	 * @return				list뷰로 이동
	 */
	@RequestMapping(value="/list/{pageNo}", method = RequestMethod.GET)
	public String getListAll(@PathVariable int pageNo, HttpSession session, RequestFilter requestFilter, Model model, Pager pager) {
		log.info("정보 로그 실행");
		requestFilter = requestService.getFilterList(requestFilter);
		model.addAttribute("requestfilter", requestFilter);
		return "request/list";
		
	}
	
	@PostMapping(value="/list/filter/{pageNo}", produces="application/json; charset=UTF-8")
	public String getExamineFilter(@PathVariable int pageNo,@RequestBody RequestAjax requestAjax, Model model, Pager pager) {
		log.info("pageNo"+pageNo);
		
		pager = requestService.returnPage(pageNo,pager,requestAjax);
		log.info("페이저1: " + pager);
		List<RequestList> list = requestService.getRequestList(pager, requestAjax);
		
		log.info("페이저2: " + pager);
		model.addAttribute("requestLists",list);
		model.addAttribute("pager",pager);
		
		return "request/ajaxList";
	}
	
	 
	
	@RequestMapping(value="/detail/{no}", method = RequestMethod.GET)
	public String getDetail(@PathVariable String no, HttpSession session, Model model, Pager pager) {
		log.info("정보 로그 실행");
		return "request/detail";
		
	}
	
	@RequestMapping(value="/detail/sr/{no}", method = RequestMethod.GET)
	public String getSrDetail(@PathVariable String no, HttpSession session, Model model, Pager pager) {
		log.info("정보 로그 실행");
		return "request/detailView";
		
	}
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public String writeRequest(HttpSession session, Model model, Pager pager) {
		return "request/write";
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
		
		try {
			sr.setSrTtl(Jsoup.clean(sr.getSrTtl(), Whitelist.basic()));
			String content = sr.getSrCn();
			content = content.replace("\r\n", "<br>");
			content = content.replace("\r", "<br>");
			content = content.replace("\n", "<br>");
			sr.setSrCn(Jsoup.clean(content, Whitelist.basic()));
			int userNo = (int) session.getAttribute("userNo");
			sr.setSrCustId(userNo); 
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
				requestService.writeRequest(sr);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/write";
	}

}
