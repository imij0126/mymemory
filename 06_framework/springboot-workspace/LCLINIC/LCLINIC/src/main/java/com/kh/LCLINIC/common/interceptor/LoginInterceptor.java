package com.kh.LCLINIC.common.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// false 리턴 => 기존 동작을 실행하지 않음! 별도 처리가 필요
		// true 리턴 => 기존 동작을 그대로 실행
		
		//로그인 여부에 따라 기존 동작을 수행하지 않도록 할 것임!
		if(request.getSession().getAttribute("user") != null) {
			return true;
		}else {
			response.sendRedirect(request.getContextPath());
			return false;
		}
	}
}
