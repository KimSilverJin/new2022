package com.sample.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.service.FindService;
import com.sample.service.GlistService;
import com.sample.service.InfoService;
import com.sample.service.InquiryService;
import com.sample.service.LoginService;
import com.sample.service.MailSendService;
import com.sample.service.ManagerService;
import com.sample.service.RentalService;
import com.sample.service.UinService;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.InquiryVO;
import com.sample.vo.ManagerVO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

	private LoginService loginService;
	private UinService uinService;
	private FindService findService;
	private RentalService rentalService;
	private GlistService glistService;
	private InquiryService inquiryService;
	private ManagerService managerService;
	private InfoService infoService;
	private MailSendService mailService;

	public MyPageController(LoginService loginService, UinService uinService, FindService findService,
			RentalService rentalService, GlistService glistService, InquiryService inquiryService,
			ManagerService managerService, InfoService infoService, MailSendService mailService) {
		super();
		this.loginService = loginService;
		this.uinService = uinService;
		this.findService = findService;
		this.rentalService = rentalService;
		this.glistService = glistService;
		this.inquiryService = inquiryService;
		this.managerService = managerService;
		this.infoService = infoService;
		this.mailService = mailService;
	}

	@GetMapping("myPage")
	public String move(UserVO userVO, UinVO uinVO, HttpSession session, Model model) {
		userVO = (UserVO) session.getAttribute("sessionVO");
//		int userCode = userVO.getUserCode();
//		System.out.println("useCode ::: " + userCode);
		uinVO = uinService.getUserAbil(userVO.getUserCode());
//		System.out.println("level : " + uinVO.getUserLevel());
//		System.out.println("controller : " + uinService.getUserAbil(userCode).getUserGroup());
		model.addAttribute("uinVO", uinVO);
		model.addAttribute("userVO", userVO);

		return "/myPage/myPage";
	}

	@GetMapping("/changePw")
	public String changePw(UserVO userVO, HttpSession session, Model model) {
		userVO = (UserVO) session.getAttribute("sessionVO");
		model.addAttribute("userVO", userVO);
		return "/myPage/changePw";
	}

	@PostMapping("/changePw/result")
	public String changePwResult(UserVO userVO, HttpSession session, @RequestParam("pw1") String pw,
			@RequestParam("new_pw1") String pw1, Model model) {
		userVO = (UserVO) session.getAttribute("sessionVO");
		userVO.setUserPw(loginService.encryptSHA256(userVO.getUserPw()));
		System.out.println("pwpwpw : " + userVO.getUserPw());
		
		
//		System.out.println("pwpwpwpw : " + pw1);
//		if (userVO.getUserPw().equals(pw)) {
		userVO.setUserPw(loginService.encryptSHA256(pw1));
		findService.setPassword(userVO);
		return "redirect:/myPage/myPage";
//		} else {
//			return "redirect:/myPage/changePw";
//		}
	}

	// 현재비밀번호 비교
	@PostMapping("/changePw/isPassword")
	@ResponseBody
	public Map<String, String> isPassword(String pass1, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("sessionVO");

		System.out.println("upw : " + pass1);
		Map<String, String> map = new HashMap<>();

		if (uvo.getUserPw().equals(loginService.encryptSHA256(pass1))) {
			map.put("state", "ok");

		} else {
			map.put("state", "no");
		}
		return map;
	}

	// 경기내역
	@GetMapping("/matchList")
	public String matchList() {

		return "/myPage/matchList";
	}

	@GetMapping("/getMatchList")
	@ResponseBody
	public Map<String, Object> getMatchList(FieldReservationVO fieldReservationVO, UserVO userVO, HttpSession session) {
		userVO = (UserVO) session.getAttribute("sessionVO");
		fieldReservationVO.setUserCode(userVO.getUserCode());
		Map<String, Object> map = new HashMap<>();
		List<FieldReservationVO> list = glistService.getMatchList(fieldReservationVO);
		map.put("userName", userVO.getUserName());
		map.put("list", list);
		return map;
	}

	// 구장예약 내역
	@GetMapping("/rentalList")
	public String rentalList(UserVO userVO, HttpSession session, Model model) {
		userVO = (UserVO) session.getAttribute("sessionVO");
		model.addAttribute("userVO", userVO);
		return "/myPage/rentalList";
	}

	@GetMapping("/getRentalList")
	@ResponseBody
	public Map<String, Object> getRentalList(UserVO userVO, HttpSession session, Model model) {
		userVO = (UserVO) session.getAttribute("sessionVO");
		System.out.println("구장예약자 이름 : " + userVO.getUserName() + userVO.getUserCode());
		int userCode = userVO.getUserCode();
		Map<String, Object> map = new HashMap<>();
		List<FieldReservationVO> list = rentalService.getFieldReservationVO(userCode);
		map.put("userName", userVO.getUserName());
		map.put("list", list);
		return map;
	}

	@GetMapping("/guide1")
	public String guide1() {

		return "/myPage/guide1";
	}

	@GetMapping("/notice")
	public String notice() {

		return "/myPage/notice";
	}

	@GetMapping("/rankGuide")
	public String rankGuide() {

		return "/myPage/rankGuide";
	}

	@GetMapping("/inquiry")
	public String inquiry(HttpSession session, InquiryVO inquiryVO, Model model) {
		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
		inquiryVO.setUserCode(uvo.getUserCode());
		List<InquiryVO> list = inquiryService.inquiryAll(inquiryVO);
		model.addAttribute("list", list);
		return "/myPage/inquiry";
	}

	@GetMapping("/inquiry/{state}")
	public String inquiry(@PathVariable("state") String state, HttpSession session, InquiryVO inquiryVO, Model model) {
		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
		inquiryVO.setUserCode(uvo.getUserCode());
		if (state != null) {
			inquiryVO.setInquiryState(state);
		}
		List<InquiryVO> list = inquiryService.inquiryAll(inquiryVO);
		model.addAttribute("list", list);
		return "/myPage/inquiry";
	}

	@GetMapping("/inquiry_detail/{inquiryCode}")
	public String inquiryDetail(@PathVariable("inquiryCode") String inquiryCode, InquiryVO inquiryVO, Model model) {
		System.out.println("dkdkdkkd" + inquiryCode);
		inquiryVO.setInquiryCode(Integer.parseInt(inquiryCode));
		model.addAttribute("inquiryVO", inquiryService.inquiryDetail(inquiryVO));
		return "/myPage/inquiry_detail";
	}

	@GetMapping("/inquiry_writing")
	public String inquiryWriting() {

		return "/myPage/inquiry_writing";
	}

	@PostMapping("/inquiry_add")
	public String inquiryAdd(@RequestParam("inquiry_title") String inquiryTitle,
			@RequestParam("inquiry_content") String inquiryContent, InquiryVO inquiryVO, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
		inquiryVO.setInquiryTitle(inquiryTitle);
		inquiryVO.setInquiryContent(inquiryContent);
		inquiryVO.setUserCode(uvo.getUserCode());
		inquiryService.InquiryAdd(inquiryVO);
		return "redirect:/myPage/inquiry";
	}

//	@ResponseBody
//	@GetMapping("/inquiry_list")
//	public List<InquiryVO> inquiryList(HttpSession session, InquiryVO inquiryVO) {
//		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
//		inquiryVO.setUserCode(uvo.getUserCode());
//		List<InquiryVO> list = inquiryService.inquiryAll(inquiryVO);
//
//		return list;
//	}

	@GetMapping("/manager")
	public String manager(HttpSession session, Model model, ManagerVO managerVO) {
		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
		int UserCode = uvo.getUserCode();
		managerVO = managerService.isManager(UserCode);
		List<GameFieldInfoVO> list = managerService.getGameFieldInfo();
		System.out.println("manager :::" + managerVO);
		if (managerVO != null) {
			model.addAttribute("managerVO", managerVO);
		}
		model.addAttribute("fieldList", list);
		model.addAttribute("userVO", uvo);
		return "/myPage/manager";
	}

	@PostMapping("/manager_app")
	public String managerApp(@RequestParam("area") String fieldName, @RequestParam("manager_content") String content,
			HttpSession session, ManagerVO managerVO) {
		System.out.println("content : " + content);
		managerVO.setPreferArea(fieldName);
		managerVO.setFieldCode(managerService.getFieldCode(fieldName));
		System.out.println(managerVO.getFieldCode());
		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
		managerVO.setUserCode(uvo.getUserCode());
		managerVO.setMgrContent(content);
		managerService.insertManager(managerVO);
		return "redirect:/myPage/manager";
	}

	// 예약/신청 취소
	@PostMapping("/refund")
	@ResponseBody
	public int refund(@RequestBody FieldReservationVO fieldReservationVO, HttpSession session) {
		System.out.println("환불");
		System.out.println(fieldReservationVO.getRvCode());
		rentalService.refund(fieldReservationVO.getRvCode());
		return 1;
	}

	@GetMapping("/changeinfo")
	public String changeinfo(UserVO userVO, HttpSession session, Model model) {
		userVO = (UserVO) session.getAttribute("sessionVO");
		List<UserVO> list = infoService.userinfoList();
		model.addAttribute("userVO", userVO);
		model.addAttribute("userList", list);
		return "/myPage/changeinfo";
	}

	@PostMapping("/changeinfo/result")
	public String changeinfoResult(String userName, String userId, String userEmail1, String userEmail2,
			String userLocal, String userDistrict, String userAddress1, String userAddress2, String userBirthYear,
			String userBirthMonth, String userBirthDay, String userGender, UserVO userVO, HttpSession session) {
		userVO = (UserVO) session.getAttribute("sessionVO");
		System.out.println(userVO.getUserCode());
		userVO.setUserName(userName);
		userVO.setUserId(userId);
		userVO.setUserEmail1(userEmail1);
		userVO.setUserEmail2(userEmail2);
		userVO.setUserLocal(userLocal);
		userVO.setUserDistrict(userDistrict);
		userVO.setUserAddress(userAddress1 + "," + userAddress2);
		userVO.setUserBirth(userBirthYear + "-" + userBirthMonth + "-" + userBirthDay);
		userVO.setUserGender(userGender);
//		session.setAttribute("sessionVO", userVO);
		infoService.changeUserinfo(userVO);
		return "redirect:/myPage/myPage";
	}

	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(UserVO userVO, String userId, @RequestParam("email") String email, Model model) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println(email);
		return mailService.joinEmail(email);

	}
}
