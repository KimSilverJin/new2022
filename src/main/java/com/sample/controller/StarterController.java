package com.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.service.StarterService;

@Controller
@RequestMapping("/starter")
public class StarterController {
	private StarterService service;

	public StarterController(StarterService service) {
		super();
		this.service = service;
	}
	
	@GetMapping
	public String moveStarterPage() {
		return "starter/starterPage";
	}
	
	
}
