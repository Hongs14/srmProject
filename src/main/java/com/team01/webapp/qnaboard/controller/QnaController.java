package com.team01.webapp.qnaboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team01.webapp.model.QSTN;
import com.team01.webapp.model.QSTNComment;
import com.team01.webapp.qnaboard.service.IQnaboardService;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/qna")
public class QnaController {
	
	@Autowired
	private IQnaboardService qnaboardService;
	
	//QNA목록보기
	@GetMapping("/list")
	public String getQnaList(@RequestParam(defaultValue="1") int pageNo, Model model) {
		int totalRow = qnaboardService.countTotalRow();
		Pager pager = new Pager(10, 5, totalRow, pageNo);
		List<QSTN> list = qnaboardService.getList(pager);
		model.addAttribute("qnalist", list);
		model.addAttribute("pager", pager);
		log.info("qna목록보기");
		return "qnaboard/qnalist";
	}
	
	//QNA상세보기
	@GetMapping("/view")
	public String getQnaDetail(Model model, int qstnNo) {
		QSTN qstn = qnaboardService.getDetail(qstnNo);
		model.addAttribute("qstn", qstn);
		log.info("qna상세보기");
		return "qnaboard/qnadetail";
	}
	
	//QNA작성하기
	@GetMapping("/write")
	public String writeQna() {
		log.info("Qna작성하기");
		return "qnaboard/qnawrite";
	}
	
	//QNA수정하기
	@GetMapping("/update")
	public String updateQna() {
		log.info("Qna수정하기");
		return "qnaboard/qnaupdate";
	}
	
//	@PostMapping("/write/comment")
//	public String writeComment(QSTNComment qComment, RedirectAttributes redirectAttrs) {
//		qnaboardService.writeComment(qComment);
//		log.info("Qna댓글달기");
//		return "redirect:/qna/view?qnaNo="+qComment.getQstnNo();
//	}
	
	//Qna댓글읽기
	@GetMapping(value="/write/comment", produces="application/json; charset=UTF-8")
	@ResponseBody
	public QSTNComment readComment(@RequestBody QSTNComment qComment, int qstnNo) {
		log.info("QSTN댓글 읽기");
		return qComment;
	}
	
	//Qna댓글작성
	@PostMapping(value="/write/comment", produces="application/json; charset=UTF-8")
	@ResponseBody
	public QSTNComment writeComment(@RequestBody QSTNComment qComment){
		//RequestBody안에는 json타입으로 있어야 함.
		log.info("QSTN댓글달기");
		log.info(qComment);
		
		qnaboardService.writeComment(qComment);
		return qComment;
	}
	
	
	
	
}
