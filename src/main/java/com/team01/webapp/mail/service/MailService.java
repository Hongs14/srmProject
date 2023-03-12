package com.team01.webapp.mail.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class MailService implements IMailService{
	
	@Autowired
	private JavaMailSender mailSender;
    
	
	public String mailSend(String message) {
		log.info("message: "+message);
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
		    MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
 
		    messageHelper.setFrom("koreasoftsrm@gmail.com"); // 보내는사람 이메일 여기선 google 메일서버 사용하는 아이디를 작성하면됨
		    messageHelper.setTo("gmlfbf5102@naver.com"); // 받는사람 이메일
		    messageHelper.setSubject("[포트폴리오] 안녕하세요 코리아소프트SRM 입니다."); // 메일제목
		    messageHelper.setText(message + " 가입하신 이메일은 ~~~ 입니다. "); // 메일 내용
 
		    mailSender.send(mimeMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/home";
	}
}
