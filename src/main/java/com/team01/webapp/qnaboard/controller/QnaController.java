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
	

	/**
	 * @author 			 정홍주
	 * @param pageNo
	 * @param model		
	 * @return
	 */
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
	//QNA작성하기
	@PostMapping("/write")
	public String writeQna(QSTN qstn, Model model) {
		log.info("Qna작성하기");
		qnaboardService.writeQSTN(qstn);
		return "redirect:/qna/list";
	}
	
	//QNA수정하기
	@GetMapping("/update")
	public String updateQna() {
		log.info("Qna수정하기");
		return "qnaboard/qnaupdate";
	}
	
	//Qna댓글읽기
	@GetMapping(value="/read/comment")
	@ResponseBody
	public List<QSTNComment> readComment(@RequestParam int qstnNo) {
		List<QSTNComment> list = qnaboardService.getCommentList(qstnNo);
		log.info("QSTN댓글 읽기" );
		return list ;
	}
	
	//Qna댓글작성
	@PostMapping(value="/write/comment", produces="application/json; charset=UTF-8")
	@ResponseBody
	public QSTNComment writeComment(@RequestBody QSTNComment qComment){
		//RequestBody안에는 json타입으로 있어야 함.
		log.info("QSTN댓글달기");
		log.info(qComment);
		
		qComment = qnaboardService.writeComment(qComment);
		return qComment;
	}
	
	//Qna댓글 수정
	@PostMapping(value="/update/comment", produces="application/json; charset=UTF-8")
	@ResponseBody
	public QSTNComment updateComment(@RequestBody QSTNComment qComment) {
		log.info("QSTN댓글 수정");
		log.info(qComment);
		qnaboardService.updateComment(qComment);
		return qComment;
	}
	
	//Qna댓글삭제
	@GetMapping(value="/delete/comment")
	@ResponseBody
	public int deleteComment(@RequestParam int qstnCmntNo) {
		log.info("QSTN댓글 삭제");
		qnaboardService.deleteComment(qstnCmntNo);
		return qstnCmntNo;
	}
	
}
