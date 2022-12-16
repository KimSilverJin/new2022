package com.goodee.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;

import com.sample.vo.UserVO;

public class SocialInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();

		if(session.getAttribute("sessionVO") == null) {
			System.out.println("SocialInter : 세션없을때");
			response.sendRedirect(request.getContextPath() + "/loginPage/login");
			return true;
		}else {
			System.out.println("SocialInter : 세션있을때");
			response.sendRedirect(request.getContextPath() + "/msocial/socialpayment");
			return false;
		}
	}
}
