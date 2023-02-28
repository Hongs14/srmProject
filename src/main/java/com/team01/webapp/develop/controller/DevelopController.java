package com.team01.webapp.develop.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team01.webapp.develop.service.IDevelopService;
import com.team01.webapp.model.CheckBoxArr;
import com.team01.webapp.model.HR;
import com.team01.webapp.model.SR;
import com.team01.webapp.model.SrDevelopDto;
import com.team01.webapp.model.Users;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/develop")
@Log4j2
public class DevelopController {
	
	@Autowired
	private IDevelopService developService;
	
	/**
	 * @author 			 정홍주
	 * @param pageNo	
	 * @param model		View로 데이터 전달을 위한 Model 객체 주입
	 * @param pager		페이징 처리를 위한 pager객체 주입
	 * @return 			develop/developlist로 이동
	 */
	@GetMapping("/list/{pageNo}")
	public String getDevelopList(@PathVariable int pageNo, Model model, Pager pager) {
		int totalRow = developService.totalRow();
		pager = new Pager(10, 5, totalRow, pageNo);
		List<SR> list = developService.getDevelopList(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("developlist",list);
		model.addAttribute("pageNo", pageNo);
		log.info("SR개발관리 리스트 목록");
		return "develop/developlist";
	}
	
	
	/**
	 * @author 			정홍주
	 * @param pageNo	
	 * @param srNo		서비스에 보내줄 int타입 객체
	 * @param model		View로 데이터 전달을 위한 Model 객체 주입
	 * @return			develop/developdetail로 이동
	 */
	@GetMapping("/view/{pageNo}")
	public String getDevelopDetail(@PathVariable int pageNo, @RequestParam String srNo, Model model) {
		SrDevelopDto srDetail = developService.getDetail(srNo);
		List<Users> devList = developService.getDevelopList();
		model.addAttribute("dlist", srDetail);
		log.info(srDetail);
		model.addAttribute("devlist", devList);
		log.info("SR개발관리 상세보기");
		
		return "develop/developdetail";
	}
	
	
	/**
	 * @author				 정홍주
	 * @param srDevelop		서비스에 보내줄 DTO객체 주입
	 * @return				
	 */
	@PostMapping(value="/register", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String developPlan(@RequestBody SrDevelopDto srDevelop, @RequestParam int userNo, HttpSession session, Model model) {
		userNo = (int)session.getAttribute("userNo"); 
		log.info("userNO"+userNo);
		
		List<Users> list = developService.updateDevelopSr(srDevelop, userNo);
		log.info("SR개발관리 계획 등록");
		model.addAttribute("devlistByDp", list);
		
		return "develop/devlistView";
	}
	
	
	/**모달창에 해당 팀의 개발자들 목록 띄우기
	 * @author				정홍주
	 * @param userDpNmMap	
	 * @param model			View로 데이터 전달을 위한 Model 객체 주입
	 * @return				develop/devlistView jsp 파일
	 *//*
	@PostMapping(value="/devlist")
	public String getDevList(@RequestBody Map<String, Object> userDpNmDateMap, Model model) {
		String userDpNm = (String)userDpNmDateMap.get("userDpNm");
		int userNo = Integer.parseInt((String)userDpNmDateMap.get("userNo"));
		
		String sDate = (String)userDpNmDateMap.get("hrStartDate");
		String eDate = (String)userDpNmDateMap.get("hrEndDate");
	
		
		List<Users> list = developService.selectDeveloperList(userDpNm, userNo, sDate, eDate);
		log.info("팀별 개발자 조회: " + userDpNm);
//		log.info(list);
		model.addAttribute("devlistByDp", list);
		return "develop/devlistView";
	}*/
	
	@GetMapping(value="/devLeader")
	@ResponseBody
	public List<Users> updateDevLeader(@RequestParam int userNo) {
		List<Users> user = developService.selectDevName(userNo);
		log.info("개발담당자 선택");
		log.info(user);
		return user;
	}
	
	 /**
	 * @author 				김태희, 정홍주
	 * @param checkBoxArr	선택된 값을 배열로 받음
	 * @param model			View로 데이터 전달을 위한 Model 객체 주입
	 * @return				develop/selectHr jsp 반환
	 */
	@PostMapping(value="/selectNm")
	 public String getName(@RequestBody List<CheckBoxArr> checkBoxArr, Model model) {
		 List<Users> user = new ArrayList<Users>();    
		 for(int i=0; i<checkBoxArr.size(); i++) {
		      user.addAll(developService.selectDevName(checkBoxArr.get(i).getUserNo()));
		 }
	 
	     log.info("HR등록 인력리스트");
	     log.info(user);
	     model.addAttribute("pickName", user);  
	     
	     return "develop/selectHr";
	  }
	 
	 @PostMapping(value="/updateHr")
	 public String insertHrList(String srNo, int[] userNo, String[] hrLeader, int[] taskNo, 
			 @DateTimeFormat(pattern="yyyy-MM-dd") Date[] hrStartDate, 
			 @DateTimeFormat(pattern="yyyy-MM-dd") Date[] hrEndDate){
		 
		 List<HR> listHR = new ArrayList<>();
		 for(int i=0; i<userNo.length; i++) {
			 HR hr = new HR();
			 hr.setSrNo(srNo);
			 hr.setUserNo(userNo[i]);
			 hr.setHrLeader(hrLeader[i]);
			 hr.setTaskNo(taskNo[i]);
			 hr.setHrStartDate(hrStartDate[i]);
			 hr.setHrEndDate(hrEndDate[i]);
			 listHR.add(hr);
		 }
		 		 
		 int result = developService.insertHrList(listHR);
		 int result2 = developService.insertProgress(); ///////////////////PROGRESS 삽입
		 log.info(result);
		 log.info("HR등록");
		 return "redirect:/develop/list/1";
	 }

}
