package com.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.service.LoginService;

@Controller
@RequestMapping("/etc")
public class EtcController {

	private LoginService service;

	public EtcController(LoginService service) {
		super();
		this.service = service;
	}

//	@GetMapping("myPage")
//	public String moveMyPage() {
//		return "etc/myPage";
//	}

	@GetMapping("etc")
	public String moveEtc() {
		return "etc/etc";
	}

}
