package com.sample.admincontroller;

import java.util.ArrayList;
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

import com.sample.adminservice.AdminService;
import com.sample.adminservice.SubService;
import com.sample.service.RankService;
import com.sample.service.TeamService;
import com.sample.vo.DataVO;
import com.sample.vo.GlistVO;
import com.sample.vo.MatchRegVO;
import com.sample.vo.SearchVO;
import com.sample.vo.TeamMemberVO;
import com.sample.vo.TlistVO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/sub")
public class SubController {
	
	private SubService service;
	
	public SubController(SubService service){
		super();
		this.service = service;
	}
	
	@GetMapping("tdel")
	public String tdelete(@RequestParam("rvCode") int[] rvCode,@RequestParam("teamCode") int[] teamCode,
						@RequestParam("gameCode") int[] gameCode,HttpSession session) {
		for(int i=0; i<teamCode.length; i++) {
			
			DataVO vo = new DataVO();
			
			vo.setTeamCode(teamCode[i]);
			vo.setGameCode(gameCode[i]);
			System.out.println("cnlthcnlthclthcltnclhtlch"+teamCode[i]+":"+gameCode[i]);
			service.delete(vo);
			service.tdelete(vo);
			service.delupdate(gameCode[i]);
		}
		
		return "redirect:/admin/select?select="+session.getAttribute("select");
	}
	
	@GetMapping("sdel")
	public String sdelete(@RequestParam("rvCode") int[] rvCode,@RequestParam("userCode") int[] userCode,
			@RequestParam("gameCode") int[] gameCode,HttpSession session) {
		
		for(int i=0; i<rvCode.length; i++) {
			service.rdelete(rvCode[i]);
		}
		for(int i=0; i<userCode.length; i++) {
			DataVO vo = new DataVO();
			
			vo.setUserCode(userCode[i]);
			vo.setGameCode(gameCode[i]);
			service.sdelete(vo);
			service.delupdate(gameCode[i]);
		}
		
		return "redirect:/admin/select?select="+session.getAttribute("select");
	}
	
	@GetMapping("/sadd")
	public String add(HttpSession session,@RequestParam("userCode") int userCode, @RequestParam("gameCode") int gameCode) {
	GlistVO vo = new GlistVO();
		vo = service.all(gameCode);
		vo.setUserCode(userCode);
		vo.setTeamCode(0);
		service.add(vo);
		service.slistadd(vo);
		service.supdate(gameCode);
		service.newresult(vo);
		return "redirect:/admin/select?select="+session.getAttribute("select");
	}
	
	
	@GetMapping("/tadd")
	public String tadd(HttpSession session,@RequestParam("teamCode") int teamCode, @RequestParam("gameCode") int gameCode) {
		List<Integer> ucList = new ArrayList<Integer>();
		ucList = service.usercode(teamCode);
		for(int i=0; i<ucList.size(); i++) {
			GlistVO vo = new GlistVO();
			vo = service.all(gameCode);
			vo.setTeamCode(teamCode);
			vo.setUserCode(ucList.get(i));
			service.tadd(vo);
			service.newresult(vo);
		}
		
		GlistVO vo = new GlistVO();
		vo.setGameCode(gameCode);
		vo.setTeamCode(teamCode);
		service.tlistadd(vo);
		service.tupdate(gameCode);
		return "redirect:/admin/select?select="+session.getAttribute("select");
	}

}
