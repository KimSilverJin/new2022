package com.sample.controller;

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

import com.sample.service.LoginService;
import com.sample.service.TeamService;
import com.sample.vo.DataVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GlistVO;
import com.sample.vo.MatchRegVO;
import com.sample.vo.SearchVO;
import com.sample.vo.TeamMemberVO;
import com.sample.vo.TlistVO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/team")
public class TeamController {
	
	private TeamService service;
	private LoginService Lservice;
	
	public TeamController(TeamService service, LoginService lservice) {
		super();
		this.service = service;
		Lservice = lservice;
	}

	@GetMapping("/team")
	public String moveRental(HttpSession session, Model model) {
		UserVO uvo = (UserVO)session.getAttribute("sessionVO");
		model.addAttribute("userVO", uvo);
		return "team/teamMain";
	}
	
	
	@PostMapping("/tlist")
	@ResponseBody
	public List<TlistVO> tlist(@RequestBody DataVO dvo,TlistVO gvo,Model model){
			
		//날짜 설정
		gvo.setGameDay(dvo.getDay());
		
		//지역 설정
		if(dvo.getPlace()==null) {
			gvo.setGamePlace(null);
		}else if(dvo.getPlace().equals("null")) {
			gvo.setGamePlace("%%");
		}
		else {
			gvo.setGamePlace("%"+dvo.getPlace()+"%");
		}
		
		
		
		//마감 설정
		if(dvo.getClose().equals("false")) {
			gvo.setClose(null);
		}else {
			gvo.setClose(dvo.getClose());
		}
		
		
		//성별 설정
		 if(dvo.getYgender().equals("false")&&dvo.getXgender().equals("false")) {
	            gvo.setGameGender(null);
	        }else if (dvo.getYgender().equals("true")&&dvo.getXgender().equals("true")) {
	        	gvo.setGameGender("혼성");
	        }else if(dvo.getYgender().equals("false")&&dvo.getXgender().equals("true")) {
	        	gvo.setGameGender("여성");
	        }else if(dvo.getYgender().equals("true")&&dvo.getXgender().equals("false")) {
	        	gvo.setGameGender("남성");
	        }
		
	
		//레벨설정
		 if(dvo.getLevel().equals("null")) {
			 gvo.setLevel("%%");
		 }else if(dvo.getLevel() == null) {
			 gvo.setLevel(null);
		 }
		 else {
			 gvo.setLevel("%"+dvo.getLevel()+"%");
		 }
		 
		//매치설정
		 if(dvo.getMver().equals("null")) {
			 gvo.setGameMacth("%%");
		 }else if(dvo.getMver() == null) {
			 gvo.setGameMacth(null);
		 }
		 else {
			 gvo.setGameMacth("%"+dvo.getMver()+"%");
		 }
		 
		
		return service.list(model, gvo);
	}
	

	@PostMapping("/tlistall")
	@ResponseBody
	public List<TlistVO> listall(@RequestBody DataVO dvo,TlistVO gvo,Model model){
		 //최초 진입 시 실행
		
		gvo.setGameDay(dvo.getDay());
		
		
		return service.list(model, gvo);
	}
	
	@GetMapping("/tinfo")
	public String info(Model model,@RequestParam("num") String snum,HttpSession session) {
		session.removeAttribute("snum");
		session.removeAttribute("tnum");
		int num = Integer.parseInt(snum);
		session.setAttribute("tnum", snum);
		service.info(num, model);
		
		if((UserVO)session.getAttribute("sessionVO") != null) {
			UserVO lovi = (UserVO)session.getAttribute("sessionVO");
			UinVO abil = service.abil(lovi.getUserCode(),session);
		}
		
	    return "team/matchinfo";
	}
	
	@GetMapping("/tsubgame")
	public String subgame(HttpSession session) {
		return (Lservice.isUser((UserVO)session.getAttribute("sessionVO"), session)) ? "redirect:/msoical/socialpayment" : "loginPage/login";
	}
	
	@PostMapping("/joinlist")
	@ResponseBody
	public List<Integer> joinlist (@RequestBody DataVO dvo,HttpSession session){

		int gameCode = dvo.getGameCode();
		return service.teamcode(gameCode);
	}
	
	@PostMapping("/joininfo")
	@ResponseBody
	public List<UinVO> joininfo (@RequestBody DataVO dvo,HttpSession session){
		int teamCode = dvo.getTeam_code();
		return service.joininfo(teamCode);
	}
	
	@PostMapping("/fieldinfo")
	@ResponseBody
	public GameFieldInfoVO fieldInfo (@RequestBody GlistVO vo) {
		int fieldcode = vo.getFieldCode();
		return service.fieldinfo(fieldcode);
	}
	
	@PostMapping("/cntmebr")
	@ResponseBody
	public int cntmebr (@RequestBody DataVO vo) {
		int teamCode = vo.getTeamCode();
		return service.cntmebr(teamCode);
	}
	
	@PostMapping("/selectgen")
	@ResponseBody
	public int selectgen (@RequestBody DataVO vo) {
		int teamCode = vo.getTeamCode();
		return service.selectgen(teamCode);
	}
	
///--------------------정욱 10.24 ----------------------------------	
	// 글쓰기 눌렀을 경우 매치 작성페이지로 이동
	@GetMapping("/posting")
	public String movePostingPage(Model model,HttpSession session) {
		UserVO uvo = (UserVO)session.getAttribute("sessionVO");
		model.addAttribute("userVO",uvo);
		return "team/posting";
	}
	


	// 모달창에서 팀이름 검색시 팀 리스트 출력
	@PostMapping("/getTeam")
	@ResponseBody
	public List<TeamMemberVO> getTeamNameList(@RequestBody TeamMemberVO vo){
		return service.getTeamNameListSer(vo);
	}
	
	
	// 팀 매치 작성 완료 버튼시 이동하는 로직
	@PostMapping("/postingFinish")
	public String putTeamMatchGlist(HttpSession session,@ModelAttribute("GlistVO") GlistVO vo, DataVO vo1, Model model) {
		
		//if(service.putTeamMatchGlist(vo)) {
			int Gnum =	service.getTeamMatchGlist();
			session.setAttribute("Gnum", Gnum);
			vo1.setGameCode(Gnum);
			int two = 2;
			int one = 1;
			String T= "T";
			String fact = "true";
			
			int Tnum = service.getTeamNameT(vo);
			session.setAttribute("Tnum", Tnum);
			vo1.setTeamCode(Tnum);
			
			vo.setClose(fact);
			vo.setGameType(T);
			vo.setGameMinp(two);
			vo.setGameMaxp(two);
			vo.setGamePnum(one);
			session.setAttribute("GlistVO", vo);
			
			return "rental/rentalPayment";
	
	}
	
	// 지도에서 주소 입력후 검색 눌렀을때
	@PostMapping("/getMap")
	@ResponseBody
	public List<SearchVO> getMapInfo(@RequestBody SearchVO vo){
		
		return service.getGameMap(vo); 
	}
	
	// 매치 작성 중 팀 틍록하기 버튼 클릭시
	// 유저정보도 같이 불러오는 것
	
	@GetMapping("/register")
	public String register(HttpSession Session,  Model model) {
		UserVO uvo = (UserVO)Session.getAttribute("sessionVO");
		
		service.getUserInfo(uvo.getUserId(), model);
		
		return "team/registeration";
	}
	
	
	// 팀 등록시 완료 버튼 눌렀을 경우
	
	@PostMapping("/teamUpdate")
	public String Teamupdate(@ModelAttribute("TeamMemberVO") TeamMemberVO vo, HttpSession session, Model model) {
	
		if(service.TeamMemberList(vo)) {
			
			int LTC = service.getLastTeamC();
			vo.setTeamCode(LTC);
			UserVO uvo = (UserVO)session.getAttribute("sessionVO");
			
			UserVO user1 = new UserVO();
			user1.setTeamCode(LTC);
			user1.setUserCode(Integer.parseInt(vo.getUserCode1()));
			user1.setUserGroup(vo.getTeamName());
			service.upUserAbil(user1);
			service.upUserInfo(user1);
			UserVO user2 = new UserVO();
			user2.setTeamCode(LTC);
			user2.setUserCode(Integer.parseInt(vo.getUserCode2()));
			user2.setUserGroup(vo.getTeamName());
			service.upUserAbil(user2);
			service.upUserInfo(user2);
			UserVO user3 = new UserVO();
			user3.setTeamCode(LTC);
			user3.setUserCode(Integer.parseInt(vo.getUserCode3()));
			user3.setUserGroup(vo.getTeamName());
			service.upUserAbil(user3);
			service.upUserInfo(user3);
			UserVO user4 = new UserVO();
			user4.setTeamCode(LTC);
			user4.setUserCode(Integer.parseInt(vo.getUserCode4()));
			user4.setUserGroup(vo.getTeamName());
			service.upUserAbil(user4);
			service.upUserInfo(user4);
			UserVO user5 = new UserVO();
			user5.setTeamCode(LTC);
			user5.setUserCode(Integer.parseInt(vo.getUserCode5()));
			user5.setUserGroup(vo.getTeamName());
			service.upUserAbil(user5);
			service.upUserInfo(user5);
			
			if(Integer.parseInt(vo.getUserCode6()) > 1) {
				UserVO user6 = new UserVO();
				user6.setTeamCode(LTC);
				user6.setUserCode(Integer.parseInt(vo.getUserCode6()));
				user6.setUserGroup(vo.getTeamName());
				service.upUserAbil(user6);
				service.upUserInfo(user6);
			}
			
			//service.updateUserAbil(vo);
			//service.updateUserInfo(vo);
			uvo.setTeamCode(LTC);
			//session.setAttribute("sessionVO", uvo );
			session.setAttribute("sessionVO", service.userVO(uvo.getUserCode()));
			model.addAttribute("userVO", uvo);
			
			return "team/teamMain";
		}else {
			return "team/registeration";
		}
	}
	
	@PostMapping("/usercode")
	@ResponseBody
	public List<UinVO> Usercode(@RequestBody UinVO vo) {
		return service.getUserList(vo);
	}
	
	
	@PostMapping("/timeListR")
	@ResponseBody
	public List<GlistVO> checkTime(@RequestBody GlistVO gvo){
		
		return service.checkTime(gvo);
	}
	
	
	@GetMapping("/teamDetailInfo")
	public String teamDetailInfo(HttpSession session,Model model,  UinVO uinVO, TeamMemberVO tmVO) {
		UserVO uvo = (UserVO) session.getAttribute("sessionVO");

		uinVO = service.getAllAbil(uvo.getUserCode());
		tmVO = service.getAllTeamMem(uvo.getTeamCode());

		model.addAttribute("user", uvo);
		model.addAttribute("uinVO", uinVO);
		model.addAttribute("tmVO", tmVO);
		
		return "myPage/teamDetailInfo";
	}
	
	@GetMapping("/teaminfo")
	public String teaminfo(HttpSession session,Model model,  UinVO uinVO, TeamMemberVO tmVO) {
		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
		uinVO = service.getAllAbil(uvo.getUserCode());
		tmVO = service.getAllTeamMem(uvo.getTeamCode());
		model.addAttribute("user", uvo);
		model.addAttribute("uinVO", uinVO);
		model.addAttribute("tmVO", tmVO);
		
		return "myPage/teaminfo";
	}
	
	@GetMapping("/deleteT")
	public String deleteTeam(@ModelAttribute TeamMemberVO vo, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
		uvo.setTeamCode(0);
	
		service.updateTNoUserAbil(vo);
;
		service.updateTNoUserInfo(vo);
	
		service.deleteT(vo);
		
		session.setAttribute("sessionVO", uvo);
		
		return "redirect:/myPage/myPage";
	}
	
//	@GetMapping("/person1")
//	public String updatePerson1(HttpSession session) {
//		Map<String,Object> map = new HashMap<String,Object>();
//		
//		
//		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
//		
//		map.put("userName", uvo.getUserName());
//		map.put("teamCode", uvo.getTeamCode());
//		
//		service.updatePerson1(map);
//		
//		
//		return "team/ddd";
//	}
	
	//------------------------------------------------------	
	
	@GetMapping("/alltdal")
	public String alltdal(@RequestParam int teamCode) {
		service.dtteamcode(teamCode);
		service.diteamcode(teamCode);
		service.dateamcode(teamCode);
		return "redirect:/myPage/myPage";
	}
	
	@GetMapping("/outteam")
	public String outteam(@RequestParam int teamCode,@RequestParam String userCode,HttpSession session) {
		
	
		TeamMemberVO vo = service.getAllTeamMem(teamCode);
		service.deleteT(vo);
		TeamMemberVO nvo = new TeamMemberVO();
		nvo.setTeamCode(teamCode);
		nvo.setTeamName(vo.getTeamName());
		List<String> name = new ArrayList<String>();
		List<String> usercode = new ArrayList<String>();
		if(!vo.getUserCode1().equals(userCode) && vo.getUserCode1() != null) {
			name.add(vo.getTmember1());
			usercode.add(vo.getUserCode1());
		}
		if(!vo.getUserCode2().equals(userCode) && vo.getUserCode2() != null) {
			name.add(vo.getTmember2());
			usercode.add(vo.getUserCode2());
		}
		if(!vo.getUserCode3().equals(userCode) && vo.getUserCode3() != null) {
			name.add(vo.getTmember3());
			usercode.add(vo.getUserCode3());
		}
		if(!vo.getUserCode4().equals(userCode) && vo.getUserCode4() != null) {
			name.add(vo.getTmember4());
			usercode.add(vo.getUserCode4());
		}
		if(!vo.getUserCode5().equals(userCode) && vo.getUserCode5() != null) {
			name.add(vo.getTmember5());
			usercode.add(vo.getUserCode5());
		}
		if(vo.getUserCode6() != null && !vo.getUserCode6().equals(userCode)) {
			name.add(vo.getTmember6());
			usercode.add(vo.getUserCode6());
		}
		
		if(name.size()==2) {
			nvo.setTmember1(name.get(0));
			nvo.setUserCode1(usercode.get(0));
			nvo.setTmember2(name.get(1));
			nvo.setUserCode2(usercode.get(1));
		}else if(name.size()==3) {
			nvo.setTmember1(name.get(0));
			nvo.setUserCode1(usercode.get(0));
			nvo.setTmember2(name.get(1));
			nvo.setUserCode2(usercode.get(1));
			nvo.setTmember3(name.get(2));
			nvo.setUserCode3(usercode.get(2));
		}else if(name.size()==4) {
			nvo.setTmember1(name.get(0));
			nvo.setUserCode1(usercode.get(0));
			nvo.setTmember2(name.get(1));
			nvo.setUserCode2(usercode.get(1));
			nvo.setTmember3(name.get(2));
			nvo.setUserCode3(usercode.get(2));
			nvo.setTmember4(name.get(3));
			nvo.setUserCode4(usercode.get(3));
		}else if(name.size()==5) {
			nvo.setTmember1(name.get(0));
			nvo.setUserCode1(usercode.get(0));
			nvo.setTmember2(name.get(1));
			nvo.setUserCode2(usercode.get(1));
			nvo.setTmember3(name.get(2));
			nvo.setUserCode3(usercode.get(2));
			nvo.setTmember4(name.get(3));
			nvo.setUserCode4(usercode.get(3));
			nvo.setTmember5(name.get(4));
			nvo.setUserCode5(usercode.get(4));
		}
		
	
		service.outmem(nvo);
		service.outabil(Integer.parseInt(userCode));
		service.outinfo(Integer.parseInt(userCode));
		session.setAttribute("sessionVO", service.userVO(Integer.parseInt(userCode)));
		
		return "redirect:/myPage/myPage";
	}
	
}
