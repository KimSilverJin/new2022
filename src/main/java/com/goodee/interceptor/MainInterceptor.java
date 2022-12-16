package com.goodee.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;

import com.sample.vo.UserVO;

public class MainInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();

		if(session.getAttribute("sessionVO") != null) {
			UserVO vo = (UserVO)session.getAttribute("userVO");
			session.removeAttribute("snum");
			session.removeAttribute("tnum");
//			if(vo.getSerialkey() == 1231254653L) {				
//				System.out.println("MainInter 세션있고 시리얼키값 맞을때");
//			}else {
//				return false;
//			}
			return true;
		}else {

			System.out.println("mainInter 세션 없을 때");
			session.invalidate();
			response.sendRedirect(request.getContextPath()+"/starter");
			return false;
		}
	}
}
