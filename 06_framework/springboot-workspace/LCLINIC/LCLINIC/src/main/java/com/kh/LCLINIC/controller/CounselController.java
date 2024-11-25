package com.kh.LCLINIC.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.LCLINIC.model.vo.Counsel;
import com.kh.LCLINIC.model.vo.User;
import com.kh.LCLINIC.service.CounselService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CounselController {
	
	private final CounselService cService;
	
	@GetMapping("/counsel")
	public String counselPage(Model model, HttpSession session) {
		
		// request scope 에 로그인한 사용자가 추가한 상담내역을 저장!
		// * Model : request scope에 데이터 저장하기 위해 사용
		// * HttpSession : session 영역에 저장된 데이터를 사용하기 위해 (로그인한 정보 : user)
		
		User loginUser = (User)session.getAttribute("user");
		if(loginUser != null) {
			List<Counsel> list = cService.selectAllCounsel(loginUser.getId());
			model.addAttribute("list",list);
			
			System.out.println(list);
		}
		cService.selectAllCounsel(loginUser.getId());
		
		return "counsel/counselList";
	}
}
