package com.goodee.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		if (session.getAttribute("sessionVO") == null) {
			System.out.println("loginInterceptor : 세션없을때");
			session.removeAttribute("sessionVO");
			return true;

		} else {
			System.out.println("loginInterceptor : 세션있을때");
			response.sendRedirect(request.getContextPath() + "/myPage/myPage");
			return false;
		}
	}
}
