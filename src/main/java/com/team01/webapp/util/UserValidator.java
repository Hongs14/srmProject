package com.team01.webapp.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.team01.webapp.model.Users;

public class UserValidator implements Validator	{
	
	//이메일 패턴
	private static final String emailRegExp =
            "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
            "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    
	private Pattern pattern;
 
    public void RegisterRequestValidator() {
        pattern = Pattern.compile(emailRegExp);
    }
    
	@Override
	public boolean supports(Class<?> cls) {
		return Users.class.isAssignableFrom(cls);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Users user = (Users)target;
		
		String userId = user.getUserId();
		String userEml = user.getUserEml();
		
		Matcher matcher = pattern.matcher(userEml);
		
		if(!matcher.matches()) {
			errors.rejectValue("userEml", "not_matched", "이메일 형식이 올바르지 않습니다.");
		}
		
		if(user.getCheckPswd() != user.getUserPswd()) {
			errors.rejectValue("checkPswd", "not_matched", "비밀번호가 일치하지 않습니다.");
		}
	}
	
}
