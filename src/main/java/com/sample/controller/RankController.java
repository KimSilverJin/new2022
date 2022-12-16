package com.sample.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.service.RankService;
import com.sample.service.TeamService;
import com.sample.vo.DataVO;
import com.sample.vo.GameResultVO;
import com.sample.vo.GlistVO;
import com.sample.vo.MatchRegVO;
import com.sample.vo.SearchVO;
import com.sample.vo.TeamMemberVO;
import com.sample.vo.TlistVO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/rank")
public class RankController {
	
	private RankService service;
	
	public RankController(RankService service) {
		super();
		this.service = service;
	}
	
	@GetMapping("/rank")
	public String rank(Model model) {
		model.addAttribute("rank", service.rank());
		return "rank/rankMain";
	}
	
	@PostMapping("selevel")
	@ResponseBody
	public UinVO selevel(@RequestBody DataVO vo) {
		System.out.println("컨트롤러q");
		System.out.println(vo.getUserCode());
		int usercode = vo.getUserCode();
		return service.selevel(usercode);
	}
	
	
	@PostMapping("/result")
	@ResponseBody
	public int result(@RequestBody GameResultVO vo) {
		System.out.println("컨트롤러w");
		return service.result(vo);
	}
	
	
	@PostMapping("/lose")
	@ResponseBody
	public int lose(@RequestBody GameResultVO vo) {
		System.out.println("컨트롤러lolololo");
		return service.lose(vo);
	}
	

}
