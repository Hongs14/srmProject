package com.team01.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team01.webapp.dto.ImageInfo;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/ajax")
@Log4j2
public class AjaxController {
	
	@GetMapping("/content")
	public String content() {
		return "ajax/content";
	}
	
	//jsp로 포워드
	@GetMapping("/ajax1")
	public String ajax1() {
		return "ajax/ajax1";
	}
	
	//jsp로 포워드 시키지 않고 JSON응답 생성
/*	@GetMapping("/ajax2")
	public void ajax2(HttpServletResponse response) throws IOException{
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("name", "photo5.jpg");
		jsonObject.put("info", "아름다운 풍경");
		String json = jsonObject.toString();
		
		response.setContentType("application/json; charset=UTF-8");
		//바디로 출력
		PrintWriter pw = response.getWriter();
		pw.println(json);
		
		//응답끝나면 flush, close되기때문에 굳이 안써도 되지만 써주자
		pw.flush();
		pw.close();
	}*/
	@GetMapping(value="/ajax2", produces="application/json; charset=UTF-8")
	@ResponseBody
	public ImageInfo ajax2(){
		log.info("실행");
		ImageInfo imageInfo = new ImageInfo();
		imageInfo.setName("photo5.jpg");
		imageInfo.setInfo("아름다운 풍경");
		return imageInfo;
	}
	
	//서버에서 브라우저로 응답 보낼때 객체를 이렇게 보내주겠다
	@PostMapping(value="/ajax3", produces="application/json; charset=UTF-8")
	@ResponseBody
	public ImageInfo ajax3(@RequestBody ImageInfo imageInfo){
		log.info("실행");
		log.info(imageInfo);
		return imageInfo;
	}
}
