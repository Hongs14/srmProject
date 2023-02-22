package com.team01.webapp.develop.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
	public int developPlan(@RequestBody SrDevelopDto srDevelop) {
		int result = developService.updateDevelop(srDevelop);
		log.info("SR개발관리 계획 등록");
		return result;
	}
	
	
	@PostMapping(value="/devlist")
	public String getDevList(@RequestBody Map<String, String> userDpNmMap, Model model) {
		String userDpNm = userDpNmMap.get("userDpNm");
		List<Users> list = developService.selectDeveloperList(userDpNm);
		log.info("팀별 개발자 조회: " + userDpNm);
		log.info(list);
		model.addAttribute("devlistByDp", list);
		return "develop/devlistView";
	}
	
	@PostMapping(value="/selectNm")
	@ResponseBody
	public String getName(HttpServletRequest request, Model model) {
		String[] arr = request.getParameterValues("checkBoxArr");
		
		for(int i=0; i<arr.length; i++) {
			log.info(arr[i]);
		}
		
//		List<Users> user = developService.selectDevName(userNo);
//		log.info("HR등록 인력");
//		log.info(user);
//		model.addAttribute("pickName", user);
		return "develop/selectHr";
	}

}
