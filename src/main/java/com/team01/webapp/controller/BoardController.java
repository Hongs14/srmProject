package com.team01.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.team01.webapp.dto.Board;
import com.team01.webapp.dto.Pager;
import com.team01.webapp.interceptor.Authorization;
import com.team01.webapp.service.BoardService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/board")
@Log4j2
public class BoardController {
	
	@Resource(name="boardServiceimpl")
	private BoardService boardService;
	
	@GetMapping("/write")
	public String writeForm() {
		log.info("실행");
		return "board/writeForm";
	}
	
	@PostMapping("/write")
	public String write(Board board) throws IOException{
		log.info("실행");
		
		//첨부파일이 있는지 조사
		MultipartFile mf = board.getBattach();
		if(!mf.isEmpty()) {
			//파일의 원래이름 저장
			board.setBattachoname(mf.getOriginalFilename());
			//파일의 저장이름
			/*String battachsname = UUID.randomUUID()+"_"+mf.getOriginalFilename();*/
			String battachsname = new Date().getTime()+"_"+mf.getOriginalFilename();
			
			board.setBattachsname(battachsname);
			//파일의 타입 설정
			board.setBattachtype(mf.getContentType());
			//서버파일시스템에 파일로 저장
			File file = new File("C:/Temp/uploadfiles/"+battachsname);
			mf.transferTo(file);
		}
		boardService.write(board);
		log.info("새로 저장된 bno:"+board.getBno());
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public String list(@RequestParam(defaultValue="1") int pageNo, Model model) {
		int totalRows = boardService.getTotalRows();
		Pager pager = new Pager(5, 5, totalRows, pageNo);
		List<Board> boards = boardService.getBoards(pager);
		
		model.addAttribute("boards", boards);
		model.addAttribute("pager", pager);
		return "board/list";
	}
	
	@GetMapping("/detail")
	public String detail(int bno, Model model) {
		log.info("실행");
		Board board =boardService.getBoard(bno);
		model.addAttribute("board", board);
		return "board/detail";
	}
	
	@GetMapping("/filedownload")
	public void filedownload(int bno, @RequestHeader("User-Agent") String userAgent, HttpServletResponse response) throws Exception {
		log.info("파일 다운로드 실행");
		Board board =boardService.getBoard(bno);
		String originalName = board.getBattachoname();
		String savedName = board.getBattachsname();
		String contentType = board.getBattachtype();
		
		log.info(userAgent);
		//OriginalName이 한글이 포함되어 있을경우 브라우저별로 한글 인코딩하는 방법
		if(userAgent.contains("Trident")||userAgent.contains("MSIE")) {
			//Trident : IE 11
			//MSIE : IE 10이하
			originalName = URLEncoder.encode(originalName, "UTF-8");
		}else {
			//edge, Chrome, Safari
			originalName = new String(originalName.getBytes("UTF-8"), "ISO-8859-1");
		}
		
		//응답헤더 설정
		response.setHeader("Content-Disposition", "attachment; filename=\"" + originalName + "\"");
		response.setContentType(contentType);
		/*response.setHeader("Content-type", contentType);*/
		
		//응답 바디에 파일 데이터 싣기
		String filePath = "C:/Temp/uploadfiles/"+savedName;
		File file = new File(filePath);
		if(file.exists()) {
			InputStream is = new FileInputStream(file);
			OutputStream os = response.getOutputStream();
			FileCopyUtils.copy(is, os);
			//java read , write를 써도 된다
			os.flush();
			os.close();
			is.close();
		}
	}
	
	@GetMapping("/delete")
	@Authorization("ROLE_ADMIN")
	public String delete(int bno) {
		log.info("실행");
		boardService.delete(bno);
		return "redirect:/board/list";
	}
	
}
