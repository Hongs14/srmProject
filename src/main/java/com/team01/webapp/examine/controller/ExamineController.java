package com.team01.webapp.examine.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team01.webapp.examine.service.IExamineService;
import com.team01.webapp.model.Examine;
import com.team01.webapp.model.ExamineFilter;
import com.team01.webapp.model.ExamineList;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;


@Controller
@RequestMapping("/examine")
@Log4j2
public class ExamineController {

	@Autowired
	IExamineService examineService;
	
	
	/**
	 * SR요청에 대한 필터링 
	 * @author : 황건희
	 * @param examineFilter SR요청에 대한 검색 조건
	 * @param model	View로 데이터 전달을 위한 Model 객체 주입
	 * @return
	 */
	@GetMapping(value="/list")
	public String getExamineList(ExamineFilter examineFilter , Model model) {
		log.info("실행");
		
		examineFilter = examineService.filterList(examineFilter);
		model.addAttribute("examineFilter",examineFilter);
		
		return "examine/list";
	}
	
	
	/**
	 * SR 요청에 대한 필터링 후 리스트 가져오기
	 * @author : 황건희
	 * @param pageNo		SR검토 목록 페이지 위치
	 * @param examineList	SR검토 리스트
	 * @param pager			페이지 처리	
	 * @param model			View로 데이터 전달을 위한 Model 객체 주입
	 * @return
	 */
	@PostMapping(value="/filter/{pageNo}", produces="application/json; charset=UTF-8")
	public String getExamineFilter(@PathVariable int pageNo,@RequestBody ExamineList examineList, Model model, Pager pager) {
		log.info("실행");
		log.info("pageNo"+pageNo);
		pager = examineService.returnPage(pageNo,pager,examineList);
		
		List<Examine> list = examineService.getExamineList(pager, examineList);
		
		model.addAttribute("examine",list);
		model.addAttribute("pager",pager);

		return "examine/ajaxList";
	}
	
	/**
	 * SR 검토 상세 조회
	 * @author : 황건희
	 * @param examineFilter 필터링 후 SR 검토 리스트 가져오기
	 * @param model
	 * @return
	 */
	@GetMapping(value="/detail/{srNo}")
	public String getExamineDetail(@PathVariable String srNo, HttpSession session, Model model) {
		log.info("실행");

		Examine examine = examineService.getExamine(srNo);
		model.addAttribute("examine",examine);
		
		
		
		return "examine/detailView";
	}
	
	/**
	 * SR 검토 상태 변경
	 * @author : 황건희
	 * @param examine	detailView.jsp에서 요청 검토 처리
	 * @return
	 */
	@PostMapping(value="/detail")
	public String updateExamine(Examine examine) {
		log.info("실행");
		log.info(examine);
		
		examineService.updateExamine(examine);
		
		return "examine/list";
	}
	
	//일괄 처리(검토중) or 일괄처리(접수)
	@PostMapping(value="/processing")
	public String updateExamineProcessing(@RequestBody ExamineList examineList,Model model, Pager pager) {
		log.info("실행");

		examineService.updateExamineProcessing(examineList);
		
		pager = examineService.returnPage(1,pager,examineList);
		
		List<Examine> list = examineService.getExamineList(pager, examineList);
		
		model.addAttribute("examine",list);
		model.addAttribute("pager",pager);
		
		return "examine/ajaxList";
	}
	
}
