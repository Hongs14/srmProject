package com.team01.webapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.team01.webapp.dao.MemberDao;
import com.team01.webapp.dto.Member;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class MemberService {
	
	public enum LoginResult {
		SUCCESS, WRONG_ID, WRONG_PASSWORD
	}
	
	public static final int JOIN_SUCCESS = 0;
	public static final int JOIN_FAIL = 1;
	
	@Autowired
	private MemberDao memberDao;
	
	public LoginResult login(Member member) {
		log.info("실행"); 
		PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		Member dbMember = getMember(member.getMid());
		
		if(dbMember == null) {
			return LoginResult.WRONG_ID;
		}else {
			boolean checkPass = pe.matches(member.getMpassword(), dbMember.getMpassword());
			if(checkPass == false) {
				return LoginResult.WRONG_PASSWORD;
			}
		}
		member.setMname(dbMember.getMname());
		member.setMenabled(dbMember.isMenabled());
		member.setMrole(dbMember.getMrole());
		member.setMemail(dbMember.getMemail());
		return LoginResult.SUCCESS;
	}
	
	public Member getMember(String mid) {
		log.info("실행"); 
		return memberDao.selectByMid(mid);
	}

	public int join(Member member) {
		try {
			//멤버 활성화
			member.setMenabled(true);
			
			//패스워드 암호화
			PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			member.setMpassword(pe.encode(member.getMpassword()));
			
			//DB에 저장
			int rows = memberDao.insert(member);
			return JOIN_SUCCESS;
		}catch(Exception e) {
			log.info(e.toString());
			return JOIN_FAIL;
		}
		
	}

}
