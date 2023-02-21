package com.team01.webapp.develop.controller;

import java.util.List;
import java.util.Map;

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
	public	int developPlan(@RequestBody SrDevelopDto srDevelop) {
		int result = developService.updateDevelop(srDevelop);
		log.info("SR개발관리 계획 등록");
		return result;
	}
	
	
	@PostMapping(value="/devlist", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<Users> getDevList(@RequestBody Map<String, String> userDpNmMap) {
		String userDpNm = userDpNmMap.get("userDpNm");
		List<Users> list = developService.selectDeveloperList(userDpNm);
		log.info(userDpNm+"팀별 개발자 조회");
		log.info(list);
		return list;
	}

}
