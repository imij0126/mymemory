package com.kh.lclinic.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.lclinic.model.vo.Counsel;
import com.kh.lclinic.model.vo.User;
import com.kh.lclinic.service.CounselService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CounselController {
	
	private final CounselService cService;

	@GetMapping("/counsel")
	public String counselPage(Model model, HttpSession session) {
		// request scope에 로그인한 사용자가 추가한 상담 내역을 저장!
		// * Model : request scope에 데이터 저장하기 위해 사용
		// * HttpSession : session 영역에 저장된 데이터를 사용하기 위해 (로그인한 정보:user)
		
		User loginUser = (User)session.getAttribute("user");
		if (loginUser != null) {
			List<Counsel> list = cService.selectAllCounsel(loginUser.getId());
			model.addAttribute("list", list);
			
		}
		return "counsel/counselList";
	}
	
	@PostMapping("/add.cs")
	public String addCounsel(Counsel c, HttpSession session) {
		int result = cService.addCounsel(c);
		if (result > 0) {
			session.setAttribute("alertMsg", "신청 완료 되었습니다.");
		} else {
			session.setAttribute("alertMsg", "문제가 발생되었습니다. 잠시 후 다시 시도해주세요.");
		}
		return "redirect:/";
	}
}
