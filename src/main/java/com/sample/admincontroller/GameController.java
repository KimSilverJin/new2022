package com.sample.admincontroller;



import java.lang.invoke.StringConcatFactory;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.adminservice.GameService;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GameResultVO;
import com.sample.vo.GlistVO;
import com.sample.vo.ManagerVO;


@Controller
@RequestMapping("/game")
public class GameController {
	
	private GameService service;
	
		
	public GameController(GameService service) {
		super();
		this.service = service;
	}

	@PostMapping("/sadd")
	public String sadd(HttpSession session, GlistVO vo) {
		GameFieldInfoVO gvo = service.fieldinfo(vo.getFieldCode());
		vo.setFieldAddress(gvo.getFieldAddress());
		vo.setFieldName(gvo.getFieldName());
		vo.setGameMacth(gvo.getFieldType());
		service.sadd(vo);
		return "adminPage/adminMain";
	}
	
	@PostMapping("/tadd")
	public String tadd(HttpSession session, GlistVO vo) {
		GameFieldInfoVO gvo = service.fieldinfo(vo.getFieldCode());
		vo.setFieldAddress(gvo.getFieldAddress());
		vo.setFieldName(gvo.getFieldName());
		vo.setGameMacth(gvo.getFieldType());
		service.tadd(vo);
		return "redirect:/admin/select?select="+session.getAttribute("select");
	}
	
	@GetMapping("/del")
	public String del(@RequestParam("gameCode") int[] gameCode,HttpSession session) {
		for(int i=0; i<gameCode.length;i++) {
			service.del(gameCode[i]);
		}
		return "redirect:/admin/select?select="+session.getAttribute("select");
	}
	
	
	@PostMapping("/update")
	public String update(GlistVO vo,HttpSession session) {
		service.update(vo);
		return "redirect:/admin/select?select="+session.getAttribute("select");
	}
	
	@GetMapping("rdel")
	public String rdel(@RequestParam("resultCode")int[] resultCode,HttpSession session) {
		System.out.println("삭제");
		for(int i=0; i< resultCode.length; i++) {
			service.rdel(resultCode[i]);
		}
		return "redirect:/admin/select?select="+session.getAttribute("select");
	}
	
	@PostMapping("radd")
	public String rup(GameResultVO vo,HttpSession session,String ty) {
		if(vo.getUserCode()==0) {
			vo.setGameType("T");
			if(ty.equals("add")) {
				List<Integer> mList = service.teamlist(vo.getTeamCode());
				for(int i =0; i<mList.size(); i++) {
					vo.setUserCode(mList.get(i));
					service.radd(vo);
				}
				
			}else {
				service.rup(vo);
			}
		}else {
			vo.setGameType("S");
			if(ty.equals("add")) {
				service.radd(vo);
			}else {
				service.rup(vo);
			}
		}
		
		return "redirect:/admin/select?select="+session.getAttribute("select");
	}
	
	
	@GetMapping("/newgame")
	public String newgame(HttpSession session) {
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int today = now.getDayOfMonth();
		int month = now.getMonthValue();
		
		String dateset ="";
		if(month == 12) {
			dateset = year + "-" + (01) + "-" +today;
		}else {
			dateset = year + "-" + (month+1) + "-" +today;
		}
		
		
		LocalDate day = LocalDate.parse(dateset);
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		List<GameFieldInfoVO> fielidlist = service.allfieldinfo();
		
		LocalDate first = day.withDayOfMonth(1);
		
		for(int j=1; j<=day.lengthOfMonth(); j++) {
			String setday = day.withDayOfMonth(j).format(formatter);
			for(int i =0; i<fielidlist.size(); i++) {
				GlistVO vo = new GlistVO();
				vo.setFieldName(fielidlist.get(i).getFieldName());
				vo.setFieldAddress(fielidlist.get(i).getFieldAddress());
				vo.setFieldCode(fielidlist.get(i).getFieldCode());
				vo.setGameDay(setday); // 받아온날
				vo.setGamePlace(fielidlist.get(i).getGamePlace());
				vo.setGameMacth(fielidlist.get(i).getFieldType());
				if(fielidlist.get(i).getFieldType().equals("5vs5")) {
					vo.setGameMinp(10);
					vo.setGameMaxp(15);
				}else {
					vo.setGameMinp(12);
					vo.setGameMaxp(18);
				}
				ManagerVO mvo = service.maginfo(fielidlist.get(i).getFieldCode());
				vo.setGameMag(mvo.getUserName());
				vo.setGameMagcode(mvo.getUserCode());
				service.newgame(vo);
			}
		}
		
		
		return "redirect:/admin/select?select="+session.getAttribute("select");
	}
}
