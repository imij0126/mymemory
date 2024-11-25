package com.kh.LCLINIC.common.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.LCLINIC.common.interceptor.LoginInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	private final LoginInterceptor LoginInterceptor;
	
	public WebMvcConfig(LoginInterceptor loginInterceptor) {
		this.LoginInterceptor = loginInterceptor;
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(LoginInterceptor).addPathPatterns("/counsel");
	}
	
}
