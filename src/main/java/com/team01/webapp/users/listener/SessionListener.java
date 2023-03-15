package com.team01.webapp.users.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.stereotype.Component;

@Component
public class SessionListener implements HttpSessionListener {
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		se.getSession().setMaxInactiveInterval(1800);
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		se.getSession().invalidate();
	}
}
