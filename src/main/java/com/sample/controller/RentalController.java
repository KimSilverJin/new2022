package com.sample.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.sample.service.LoginService;
import com.sample.service.RentalService;
import com.sample.service.TeamService;
import com.sample.vo.DataVO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GlistVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/rental")
public class RentalController {
	
	private RentalService service;
	private LoginService Lservice;
	private TeamService Tservice;
	

	public RentalController(RentalService service, LoginService lservice, TeamService tservice) {
		super();
		this.service = service;
		Lservice = lservice;
		Tservice = tservice;
	}

	@GetMapping("/rental")
	public String moveRental() {
		return "rental/rentalMain";
	}
	
	@PostMapping("selectRental")
	@ResponseBody
	public List<GlistVO> selectRental(@RequestBody DataVO dvo, GlistVO gvo){
		// 날짜 설정
		gvo.setGameDay(dvo.getDay());
		// 지역 설정
		if(dvo.getPlace() == null) {
			gvo.setGamePlace(null);
		}else {
			gvo.setGamePlace(dvo.getPlace());
		}
		//크기 설정
		if(dvo.getMver() == null) {
			 gvo.setGameMacth(null);
		 }
		 else{
			 gvo.setGameMacth(dvo.getMver());
		 }
		return service.rvlistALL(gvo);
	}
	
	
	@PostMapping("/rvList")
	@ResponseBody
	public List<GlistVO> rvListAll(@RequestBody DataVO dvo,GlistVO gvo){
		// 구장예약 클릭 시 처음 실행되는 컨트롤러
		gvo.setGameDay(dvo.getDay());
		return service.rvlistALL(gvo);
	}

	
	@PostMapping("/timeList")
	@ResponseBody
	public List<GlistVO> timeList(@RequestBody GlistVO gvo){
		return service.timeList(gvo);
	}
	
	@PostMapping("/rvListSelect")
	@ResponseBody
	public List<GlistVO> rvListSelect(@RequestBody DataVO dvo,GlistVO gvo,Model model){
		gvo.setGameDay(dvo.getDay());
		gvo.setFieldCode(dvo.getCode());
		return service.rvListSelect(gvo);
	}

	
	@GetMapping("/rentalDetail")
	public String rentalDetailMove(@RequestParam("fieldCode") int fieldCode,Model model) {
		service.fieldInfo(fieldCode,model);
		return 	"rental/rentalDetail";
	}
	
	@GetMapping("/rentalDetail2")
	public String rentalDetail2Move(@RequestParam("fieldCode") int fieldCode,
									@RequestParam("num") int num,Model model) {
		service.fieldInfo(fieldCode,model);
		model.addAttribute("num",num);
		return "rental/rentalDetail";
	}
	
	@GetMapping("/paymentInter")
	public String paymentInter(FieldReservationVO fvo,HttpSession session,@RequestParam("pageurl") String pageurl) {
		if(session.getAttribute("fieldData") != null || session.getAttribute("pageurl") != null) {
			session.removeAttribute("fieldData");
			session.removeAttribute("pageurl");
			session.removeAttribute("GlistVO");
		}
			session.setAttribute("fieldData", fvo);
			session.setAttribute("pageurl",pageurl);

		return (Lservice.isUser((UserVO)session.getAttribute("sessionVO"), session))? "redirect:/rental/rentalPayment":"redirect:/loginPage/login";
	}
	
	@GetMapping("/rentalPayment")
	public String rentalPaymentMove(Model model,@SessionAttribute("fieldData") FieldReservationVO fvo,
									@SessionAttribute("sessionVO") UserVO uvo) {
		service.fieldInfo(fvo.getFieldCode(),model);
		fvo.setUserCode(uvo.getUserCode());
		fvo.setUserPayment(fvo.getFieldRentalfee());

		return "rental/rentalPayment";
	}
	
	
	@PostMapping("/resultField")
	@ResponseBody
	public Map<String,String> fieldResultMove(@RequestBody FieldReservationVO fvo,Model model,
								@SessionAttribute("sessionVO") UserVO uvo, HttpSession session) {
		System.out.println("-----------------------------------------");
		System.out.println(fvo.getPayCode());
		System.out.println(fvo.getStoreCode());
		System.out.println(fvo.getUserPayment());
		System.out.println(fvo.getCardCode());
		
		fvo.setUserCode(uvo.getUserCode());
		fvo.setUserPayment(fvo.getFieldRentalfee());

		Map<String,String> map = new HashMap<>();
		// 유효성검사 필요 없지만 확실하게 적용
		if(service.rvCheck(fvo)) {
			service.insertRvInGameList(fvo);
			service.insertFieldReservation(fvo);
			map.put("url","ok"); 
		}else {
			map.put("url","fail"); 
		}
		return map;
	}
	
	@GetMapping("/resultTeam")
	public String teamResultMove(FieldReservationVO rvo, HttpSession session, DataVO vo1) {
		
		session.setAttribute("FRVO", rvo);
		GlistVO gvo = (GlistVO)session.getAttribute("GlistVO");
		UserVO uvo = (UserVO)session.getAttribute("sessionVO"); 
		System.out.println("이거있는데.? :" + gvo.getGamePlace());
		
		if(Tservice.putTeamMatchGlist(gvo)) {
			int Gnum =	Tservice.getTeamMatchGlist();
			vo1.setGameCode(Gnum);
			
			System.out.println("컨트롤러--포스팅 : "+Gnum);
		
			int Tnum = Tservice.getTeamNameT(gvo);
			vo1.setTeamCode(Tnum);
		
			Tservice.gameTJoinList(vo1);
			
			Tservice.matchInfo(gvo);
		session.setAttribute("GlistVO", gvo);
		
			
		FieldReservationVO rvo1 = (FieldReservationVO)session.getAttribute("FRVO");
		
		rvo1.setUserCode(uvo.getUserCode());
		rvo1.setFieldCode(gvo.getFieldCode());
		rvo1.setFieldName(gvo.getFieldName());
		rvo1.setFieldAddress(gvo.getFieldAddress());
		rvo1.setFieldRentalfee(gvo.getGamePay());
		rvo1.setFieldType(gvo.getGameMacth());
		rvo1.setGameDay(gvo.getGameDay());
		rvo1.setGameTime(gvo.getGameTime());
		rvo1.setRvType(gvo.getGameType());
		rvo1.setGameCode(Gnum);
		rvo1.setUserPayment(gvo.getUteamPay());
		rvo1.setTeamCode(Tnum);
		rvo1.setPayCode(rvo.getPayCode());
		rvo1.setStoreCode(rvo.getStoreCode());
		rvo1.setCardCode(rvo.getCardCode());
		System.out.println("페이코드" + rvo.getPayCode());
		System.out.println("상점코드" + rvo.getStoreCode());
		System.out.println("카드코드" + rvo.getCardCode());
		System.out.println("제발제발 : "+Tnum);
		System.out.println(rvo1.getUserCode());
		System.out.println(rvo1.getFieldAddress());
		Tservice.insertFieldRVT(rvo1);
		
		session.removeAttribute("GlistVO");
		session.removeAttribute("Gnum");
		session.removeAttribute("Gnum");
		session.removeAttribute("FRVO");
		
		return "redirect:/myPage/rentalList";
		}
		return "rental/rentalPayment";
	}
	// 결제코드 확인중 .. 지우지말 것
//	@GetMapping("/resultTeam")
//	public String teamResultMove(FieldReservationVO rvo, HttpSession session, @RequestParam("merchant") String merchant) {
//		UserVO uvo = (UserVO)session.getAttribute("sessionVO"); 
//		System.out.println("컨트롤러 :"+merchant);
//		rvo.setPayCode(merchant);
//		rvo.setUserCode(uvo.getUserCode());
//		rvo.setUserPayment(rvo.getFieldRentalfee()/2);
//		Tservice.insertFieldRVT(rvo);
//		return "rental/resultTeam";
//	}
		
	@PostMapping("refundPay")
	@ResponseBody
	public String refundPay(@RequestParam("merchant_uid") String merchant_uid) {
		System.out.println(merchant_uid);
		
		FieldReservationVO fvo = new FieldReservationVO();
		

		
		return "myPage/success";
	}
	
}
