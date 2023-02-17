package com.team01.webapp.progress.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team01.webapp.model.HR;
import com.team01.webapp.model.ProgressDetail;
import com.team01.webapp.model.ProgressFilter;
import com.team01.webapp.model.SRFile;
import com.team01.webapp.model.SrProgressAjax;
import com.team01.webapp.model.SrProgressList;
import com.team01.webapp.model.Task;
import com.team01.webapp.model.ThArr;
import com.team01.webapp.progress.service.IProgressService;
import com.team01.webapp.util.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ProgressController {
	
	@Autowired
	private IProgressService progressService;
	
	// 리스트 필터링 값 불러오기
	@RequestMapping(value="/progress/list/{pageNo}", method = RequestMethod.GET)
	public String progressList(@PathVariable int pageNo, ProgressFilter progressfilter, Model model) {
		
		progressfilter = progressService.filterList(progressfilter);
		
		model.addAttribute("progressFilter", progressfilter);
		
		return "progress/list";
	}
	
	@RequestMapping(value="/progress/detail/{srNo}", method = RequestMethod.GET)
	public String progressDetail(@PathVariable String srNo, Model model) {
		
		ProgressDetail progressdetail = progressService.selectDetail(srNo);
		
		model.addAttribute("progressDetail", progressdetail);
		
		return "progress/detail";
	}
	
	// progress 리스트 ajax 안에 필터링된 리스트 불러오기
	@RequestMapping(value="progress/list/progressajax/{pageNo}", produces="application/json; charset=UTF-8")
	public String progressAjax(@PathVariable String pageNo, @RequestBody SrProgressAjax srProgressAjax, Model model, Pager pager) {
		
		log.info("pageNo " + pageNo);
		log.info("srProgressAjax " + srProgressAjax);
		
		pager = progressService.returnPage(pageNo, pager, srProgressAjax);
		
		List<SrProgressList> list = progressService.ProgressList(pager, srProgressAjax);
		
		model.addAttribute("ProgressList", list);
		model.addAttribute("pager", pager);
		
		log.info(pager);
		
		return "progress/progressListView";
	}
	
	@RequestMapping(value="progress/detail/filedownload", method = RequestMethod.GET)
	public void filedownload(int srFileNo, @RequestHeader("User-Agent") String userAgent, HttpServletResponse response) throws Exception {
		SRFile srFile = progressService.getSrFile(srFileNo);
		
		String originalName = srFile.getSrFileActlNm();
		String savedName = srFile.getSrFilePhysNm();
		String contentType = srFile.getSrFileExtnNm();
		
		// originalName이 한글이 포함되어 있을 경우, 브라우저별로 한글을 인코딩
		if(userAgent.contains("Trident") || userAgent.contains("MSIE")) {
			originalName = URLEncoder.encode(originalName, "UTF-8");
		} else {
			originalName = new String(originalName.getBytes("UTF-8"), "ISO-8859-1");
		}
		
		// 응답 헤더 설정
		response.setHeader("Content-Disposition", "attachment; filename=\"" + originalName + "\"");
		response.setContentType(contentType);
		
		// 응답 바디에 파일 데이터 싣기
		String filePath = "C:/Temp/uploadfiles/" + savedName;
		
		File file = new File(filePath);
		
		if(file.exists()) {
			InputStream is = new FileInputStream(file);
			OutputStream os = response.getOutputStream();
			FileCopyUtils.copy(is, os);
			os.flush();
			os.close();
			is.close();
		}
	}
	
	// Detail SR 인적 자원 list
	@RequestMapping(value="progress/detail/progressajax/1", produces="application/json; charset=UTF-8")
	public String humanResourceAjax(@RequestBody HR hr, Model model) {
		
		List<Task> taskList = progressService.taskList();
		model.addAttribute("taskList", taskList);
		
		String srNo = hr.getSrNo();
		model.addAttribute("srNo", srNo);
		
		List<HR> hrList = progressService.humanResourceList(srNo);
		model.addAttribute("hrList", hrList);
		
		List<HR> developerList = progressService.developerList(hrList.get(0).getUserDpNm(), srNo);
		model.addAttribute("developerList", developerList);
		
		return "progress/humanResourceList";
	}
	
	// 개발자 추가
	@RequestMapping(value="progress/detail/developerinsert/{srNo}", produces="application/json; charset=UTF-8")
	public String developerinsert(@PathVariable String srNo, @RequestBody ThArr thArr) {
		
		log.info(thArr.getThArr().size());
		
		progressService.developerInsert(thArr);
		
		return "redirect:/progress/detail/" + srNo;
	}
	
	// 개발자 일정 수정
	@RequestMapping(value="progress/detail/developerUpdateView", produces="application/json; charset=UTF-8")
	public String developerUpdateView(@RequestBody HR hr, Model model) {
		Date sysdate = new Date();
		
		HR developer = progressService.developer(hr.getSrNo(), hr.getUserNo());
		
		boolean startresult = developer.getHrStartDate().after(sysdate);
		boolean endresult = developer.getHrEndDate().after(sysdate);
		
		model.addAttribute("developer", developer);
		model.addAttribute("startresult", startresult);
		model.addAttribute("endresult", endresult);
		
		return "progress/humanResourceUpdateView";
	}
	
	@RequestMapping(value="progress/detail/developerUpdate", produces="application/json; charset=UTF-8")
	public String developerUpdate(@RequestBody HR hr) {
		
		progressService.developerUpdate(hr);
		
		return "redirect:/progress/detail/" + hr.getSrNo();
	}
	
	@RequestMapping(value="progress/detail/developerDelete", produces="application/json; charset=UTF-8")
	public String developerDelete(@RequestBody HR hr) {
		
		log.info(hr.getSrNo());
		log.info(hr.getUserNo());
		
		
		
		
		return null;
	}
	
	
	// Detail SR 진척율
	@RequestMapping(value="progress/detail/progressajax/2", produces="application/json; charset=UTF-8")
	public String Progressrate(@RequestBody HR hr, Model model) {
		
		return "progress/list";
	}
}
