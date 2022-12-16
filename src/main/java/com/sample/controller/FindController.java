package com.sample.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.service.FindService;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/find")
public class FindController {

	private FindService findService;

	public FindController(FindService findService) {
		super();
		this.findService = findService;
	}

	@GetMapping("/findInfo")
	public String findInfo() {
		return "/find/findInfo";
	}

	@GetMapping("/findId")
	public String findId() {
		return "/find/findId";
	}

	@GetMapping("/findPw")
	public String findPw() {
		return "/find/findPw";
	}

	@PostMapping("/searchId")
	public String searchId(UserVO userVO, Model model) {
		model.addAttribute("userVO", findService.searchUser1(userVO));
		return "/find/searchId";
	}

	@GetMapping("/searchId")
	public String searchId1(UserVO userVO, Model model) {
		model.addAttribute("userVO", findService.searchUser1(userVO));
		return "/find/searchId";
	}

	@PostMapping("/searchPw")
	public String searchPw(UserVO userVO, HttpSession session) {
		session.setAttribute("userVO", findService.searchUser2(userVO));
		System.out.println(findService.searchUser2(userVO).getUserId());
		return "/find/searchPw";
	}

	@PostMapping("/newPw")
	public String newPw(UserVO userVO, String pw1, String pw2, HttpSession session) {
		userVO = (UserVO) session.getAttribute("userVO");
		System.out.println("id : " + userVO.getUserId());
		userVO.setUserPw(pw1);
		System.out.println("pw1 : " + pw1);
		System.out.println("pw2 : " + pw2);
		System.out.println(userVO.getUserPw());
		findService.setPassword(userVO);
		return "/loginPage/login";
	}

}
