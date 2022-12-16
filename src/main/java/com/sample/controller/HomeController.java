package com.sample.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.service.GlistService;
import com.sample.vo.DataVO;
import com.sample.vo.GlistVO;



@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
	      return "index";
	}

	@GetMapping("/home")
	public String firstHome() {
	
		return "index";
	}


}

