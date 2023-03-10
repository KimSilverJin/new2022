package com.sample.admincontroller;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sample.adminservice.AdminService;
import com.sample.adminservice.FieldAdminService;
import com.sample.adminservice.GameService;
import com.sample.service.InquiryService;
import com.sample.service.ManagerService;
import com.sample.service.RentalService;
import com.sample.vo.BlacklistVO;
import com.sample.vo.DataVO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GlistVO;
import com.sample.vo.InquiryVO;
import com.sample.vo.ManagerVO;
import com.sample.vo.ReviewCommentVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private AdminService service;
	private FieldAdminService fdService;
	private InquiryService inquiryService;
	private ManagerService managerService;
	private RentalService rtservice;
	
	
	

	public AdminController(AdminService service, FieldAdminService fdService, InquiryService inquiryService,
			ManagerService managerService, RentalService rtservice) {
		super();
		this.service = service;
		this.fdService = fdService;
		this.inquiryService = inquiryService;
		this.managerService = managerService;
		this.rtservice = rtservice;
	}

	@GetMapping("/admin")
	public String admin(HttpSession session, Model model) {
		session.setAttribute("count", service.refundsub());
		// ?????? ?????? ????????????
		model.addAttribute("userList", service.UInfoList());
		model.addAttribute("team", service.joinList());
		model.addAttribute("userListB", service.UInfoListB());
		return "adminPage/adminMain";
	}

	@GetMapping("/select")
	public String mainselect(@RequestParam("select") String select, HttpSession session, Model model) {
		session.setAttribute("select", select);
		// (????????????)
		session.setAttribute("gamelist", service.allgame());
		// ?????? ?????? ??????
		session.setAttribute("userlist", service.alluser());
		// st ????????????
		session.setAttribute("stgamelist", service.stgame());
		// s ????????????
		session.setAttribute("sgamelist", service.sgame());
		// ????????? ??????
		session.setAttribute("cgamelist", service.cgame());
		// ?????? ??? ??????
		session.setAttribute("tcodelist", service.teamcode());
		// ?????? ????????? ??????
		session.setAttribute("allfield", service.allfield());
		// ???????????? ??????
		session.setAttribute("result", service.result());
		// ????????????
		session.setAttribute("rankall", service.rankall());
		// ????????????
		session.setAttribute("fieldList", fdService.getFieldListAll());
		// ???????????? ??????
		session.setAttribute("rvListAll", fdService.FieldReservationListAll());
		// ????????????
		session.setAttribute("count", service.refundsub());
		
		model.addAttribute("fieldList", fdService.getFieldListAll());
		model.addAttribute("inquiryList", inquiryService.inquiryListAdmin());
		model.addAttribute("managerList", managerService.getManagerList());
		session.setAttribute("userList", service.UInfoList());
		session.setAttribute("team", service.joinList());
		session.setAttribute("userListB", service.UInfoListB());
		model.addAttribute("review", service.reviewCommentList());
		service.getBlackList(model);
		
		
		return "adminPage/adminMain";
	}

	// ???????????? ????????? ??????
	@PostMapping("/select1")
	public String mainselect(HttpSession session, Model model, UserVO vo, @RequestParam("Uselect") String Uselect,
			@RequestParam("Usearch") String Usearch) {

		if (Uselect.equals("userCode")) {
			vo.setUserCode(Integer.parseInt(Usearch));
		} else if (Uselect.equals("userName")) {
			vo.setUserName(Usearch);
		} else if (Uselect.equals("userId")) {
			vo.setUserId(Usearch);
		} else if (Uselect.equals("userBirth")) {
			vo.setUserBirth(Usearch);
		} else if (Uselect.equals("userGender")) {
			vo.setUserGender(Usearch);
		} else if (Uselect.equals("userAuthority")) {
			vo.setUserAuthority(Usearch);
		} else if (Uselect.equals("userReports")) {
			vo.setUserReports(Usearch);
		}
		model.addAttribute("userList", service.UInfoList1(vo));
		return "adminPage/adminMain";
	}

	@GetMapping("/subselect")
	public String subselect(@RequestParam("subselect") String subselect, Model model, HttpSession session) {
		model.addAttribute("subselect", subselect);
		return "adminPage/adminMain";
	}

	@GetMapping("/gameselect")
	public String gameselect(@RequestParam("gameselect") String gameselect, Model model) {
		model.addAttribute("gameselect", gameselect);
		return "adminPage/adminMain";
	}

	@GetMapping("/rankselect")
	public String rankselect(@RequestParam("rankselect") String rankselect, Model model) {
		model.addAttribute("rankselect", rankselect);
		return "adminPage/adminMain";
	}

	@GetMapping("/idselect")
	public String idselect(@RequestParam("idselect") String idselect, Model model) {
		model.addAttribute("idselect", idselect);

		model.addAttribute("userList", service.UInfoList());
		model.addAttribute("userListB", service.UInfoListB());
		return "adminPage/adminMain";
	}

	// ??????????????? ????????? ??????
	@PostMapping("/idselect1")
	public String idselect1(HttpSession session, Model model, UserVO vo, @RequestParam("Uselect") String Uselect,
			@RequestParam("Usearch") String Usearch) {

		if (Uselect.equals("userCode")) {
			vo.setUserCode(Integer.parseInt(Usearch));
		} else if (Uselect.equals("userName")) {
			vo.setUserName(Usearch);
		} else if (Uselect.equals("userId")) {
			vo.setUserId(Usearch);
		} else if (Uselect.equals("userBirth")) {
			vo.setUserBirth(Usearch);
		} else if (Uselect.equals("userGender")) {
			vo.setUserGender(Usearch);
		} else if (Uselect.equals("userAuthority")) {
			vo.setUserAuthority(Usearch);
		} else if (Uselect.equals("userReports")) {
			vo.setUserReports(Usearch);
		}
		model.addAttribute("userList", service.UInfoListB1(vo));
		return "adminPage/adminMain";
	}

	// ?????????????????? ??????????????????~
	@PostMapping("/UUInfoList")
	@ResponseBody
	public int UUInfoList(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, UserVO vo) {
		System.out.println("????????????1111111??");

		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
		String userId = uvo.getUserId();

		int result = 0;
		int userCode = 0;

		if (uvo != null) {
			System.out.println("??????~~~");

			for (String i : chArr) {
				userCode = Integer.parseInt(i);
				vo.setUserCode(userCode);
				System.out.println("????????????222222??");
				System.out.println(userCode);
				System.out.println("???????????????? : " + userCode);
				service.UUInfoList(userCode);

				System.out.println("???????????????1");
				service.UpdateFRstate(userCode);
				System.out.println("???????????????2");
				service.UpdateGLPnum(userCode);
				System.out.println("???????????????3");
				service.UpdateGLClose(userCode);
				System.out.println("???????????????4");
				service.DeleteGR(userCode);
				System.out.println("???????????????5");

				service.DeleteGSList(userCode);

			}
			result = 1;
		}

		return result;
	}

	// ????????????????????? ?????? ????????? ???????????????
	@PostMapping("/RUInfoList")
	@ResponseBody
	public int RUInfoList(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, UserVO vo) {
		System.out.println("????????????1111111??");

		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
		String userId = uvo.getUserId();

		int result = 0;
		int userCode = 0;

		if (uvo != null) {

			for (String i : chArr) {
				userCode = Integer.parseInt(i);
				vo.setUserCode(userCode);
				System.out.println("????????????222222??");
				System.out.println(userCode);
				System.out.println("???????????????? : " + userCode);
				service.RUInfoList(userCode);

			}
			result = 1;
		}

		return result;
	}

	// ????????? ????????? ??????
	@GetMapping("/magselect")
	public String magselect(@RequestParam("magselect") String magselect, Model model, ManagerVO managerVO) {
		if (magselect.equals("magList")) {
			List<UserVO> list = managerService.getManagerList();
			model.addAttribute("managerList", list);
			List<GameFieldInfoVO> list2 = managerService.getGameFieldInfo();
			model.addAttribute("fieldList", list2);
		}
		if (magselect.equals("magSignUpList")) {
			List<ManagerVO> list = managerService.managerHistoryList(managerVO);
			model.addAttribute("managerVO", list);
		}
		if (magselect.equals("magFailList")) {
			List<ManagerVO> list = managerService.managerHistoryList2(managerVO);
			model.addAttribute("managerVO", list);
		}

		model.addAttribute("magselect", magselect);
		return "adminPage/adminMain";
	}

	// ????????? ??????
	@PostMapping("/magPass")
	@ResponseBody
	public int magPass(@RequestParam("chbox[]") List<String> chArr, ManagerVO managerVO, HttpSession session) {

		System.out.println(chArr);
		int result = 0;
		for (String mgrCode : chArr) {
			managerService.managerAdd(Integer.parseInt(mgrCode));
			result = 1;
		}
		return result;
	}

	// ????????? ??????
	@PostMapping("/magFail")
	@ResponseBody
	public int magFail(@RequestParam("chbox[]") List<String> chArr, ManagerVO managerVO, HttpSession session) {

		System.out.println(chArr);
		int result = 0;
		for (String mgrCode : chArr) {
			managerService.managerFail(Integer.parseInt(mgrCode));
			result = 1;
		}
		return result;
	}

	@GetMapping("/manageradd")
	public String manageradd(@RequestParam("userCode") String userCode, @RequestParam("userId") String userId,
			Model model, UserVO userVO) {

		userVO.setUserCode(Integer.parseInt(userCode));
		userVO.setUserId(userId);
		managerService.managerAdd2(userVO);

		model.addAttribute("magselect", "magList");
		return "redirect:/admin/magselect";
	}

	// ????????? ??????
	@PostMapping("/magDelete")
	@ResponseBody
	public int magDelete(@RequestParam("chbox[]") List<String> chArr, ManagerVO managerVO, HttpSession session) {
		int result = 0;
		for (String userCode : chArr) {
			managerService.managerDelete(Integer.parseInt(userCode));
			managerService.isManagerHistory(Integer.parseInt(userCode));
			result = 1;
		}
		return result;
	}

	@GetMapping("/managerSearch")
	public String managerSearch(@RequestParam("mselect") String mselect, @RequestParam("msearch") String msearch,
			Model model) {
		List<GameFieldInfoVO> list2 = managerService.getGameFieldInfo();
		model.addAttribute("fieldList", list2);
		System.out.println(msearch);
		UserVO userVO = new UserVO();
		if (mselect.equals("????????????")) {
			userVO.setUserCode(Integer.parseInt(msearch));
		} else if (mselect.equals("??????ID")) {
			userVO.setUserId(msearch);
		} else if (mselect.equals("????????????")) {
			userVO.setUserName(msearch);
		} else if (mselect.equals("????????????")) {
			userVO.setUserBirth(msearch);
		} else if (mselect.equals("??????")) {
			userVO.setUserGender(msearch);
		} else if (mselect.equals("????????????")) {
			userVO.setPreferArea(msearch);
		}
		List<UserVO> list = managerService.searchManager(userVO);
		model.addAttribute("managerList", list);
		model.addAttribute("magselect", "magList");
		return "adminPage/adminMain";
	}

	// ????????? ????????? ??????
	// ?????? ?????? ?????? ????????? ?????? ??? ?????? ?????? ??????
	@GetMapping("/reserselect")
	public String reserselect(@RequestParam("reserselect") String reserselect, Model model,
			HttpServletRequest request) {

		String[] chBox = request.getParameterValues("chBox");

		if (reserselect.equals("teamMatch")) {
			model.addAttribute("team", service.joinList());
		} else if (reserselect.equals("rvField")) {
			// type ??? G??????, state??? '????????????'??? list??????
			model.addAttribute("fieldRV", fdService.GFieldReservationList());
		} else if (reserselect.equals("Gcancel")) {
			model.addAttribute("cancelRV", fdService.GCancelList());
		} else if (reserselect.equals("delete")) {
			for (int i = 0; i < chBox.length; i++) {
				fdService.updateFieldReservation(chBox[i]);
				fdService.deleteFieldGamelist(chBox[i]);
			}
			// ?????? ???????????? ?????? ?????? ????????????
			return "redirect:/admin/reserselect?reserselect=rvField";
		} else if (reserselect.equals("Tcancel")) {
			// ????????? ?????? ??????
			model.addAttribute("team1", service.joinList2());

		}
		model.addAttribute("reserselect", reserselect);

		return "adminPage/adminMain";
	}

	// ??? ???????????? - ????????? ?????? ????????? ??????
	@PostMapping("/reserselect1")
	public String reserselect1(Model model, FieldReservationVO vo, @RequestParam("Tselect") String Tselect,
			@RequestParam("Tsearch") String Tsearch) {

		if (Tselect.equals("rvCode")) {
			vo.setSrvCode(Tsearch);
		} else if (Tselect.equals("rvDay")) {
			vo.setRvDay(Tsearch);
		} else if (Tselect.equals("userName")) {
			vo.setUserName(Tsearch);
		} else if (Tselect.equals("fieldName")) {
			vo.setFieldName(Tsearch);
		} else if (Tselect.equals("gameDay")) {
			vo.setGameDay(Tsearch);
		} else if (Tselect.equals("fieldType")) {
			vo.setFieldType(Tsearch);
		} else if (Tselect.equals("userCode")) {
			vo.setSuserCode(Tsearch);
		} else if (Tselect.equals("gameCode")) {
			vo.setSgameCode(Tsearch);
		}

		model.addAttribute("team", service.joinList1(vo));

		return "adminPage/adminMain";
	}

	@PostMapping("/TdeleteList")
	@ResponseBody
	public int TdeleteList(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr,
			FieldReservationVO vo) {
		System.out.println("????????????1111111??");

		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
		String userId = uvo.getUserId();

		int result = 0;
		int gameCode = 0;

		if (uvo != null) {
			System.out.println("??????~~~");

			for (String i : chArr) {
				gameCode = Integer.parseInt(i);
				vo.setGameCode(gameCode);
				System.out.println("????????????222222??");
				System.out.println(gameCode);
				System.out.println("???????????????? : " + gameCode);
				service.TdeleteG(gameCode);
				service.TupdateF(gameCode);
			}
			result = 1;
		}

		return result;
	}

	@PostMapping("/reserselect2")
	public String reserselect2(Model model, FieldReservationVO vo, @RequestParam("Tselect") String Tselect,
			@RequestParam("Tsearch") String Tsearch) {

		if (Tselect.equals("rvCode")) {
			vo.setSrvCode(Tsearch);
		} else if (Tselect.equals("rvDay")) {
			vo.setRvDay(Tsearch);
		} else if (Tselect.equals("userName")) {
			vo.setUserName(Tsearch);
		} else if (Tselect.equals("fieldName")) {
			vo.setFieldName(Tsearch);
		} else if (Tselect.equals("gameDay")) {
			vo.setGameDay(Tsearch);
		} else if (Tselect.equals("fieldType")) {
			vo.setFieldType(Tsearch);
		} else if (Tselect.equals("userCode")) {
			vo.setSuserCode(Tsearch);
		} else if (Tselect.equals("gameCode")) {
			vo.setSgameCode(Tsearch);
		}

		model.addAttribute("team", service.joinList3(vo));

		return "adminPage/adminMain";
	}

	// ?????? ?????? ?????????
	@GetMapping("/fieldselect")
	public String fieldselect(Model model, HttpServletRequest request, HttpSession session) {
		// ?????? ?????? ????????? ???
		String fieldselect = request.getParameter("fieldselect");
		// ?????? or ???????????? ?????? ??????
		String fieldChange = request.getParameter("fieldChange");
		// ????????? check??????
		String check_btn[] = request.getParameterValues("check_btn");

		// ?????? ?????? ???????????? ???
		if (fieldChange != null) {
			if (fieldChange.equals("delete")) {
				for (int i = 0; i < check_btn.length; i++) {
					fdService.deleteSelectField(check_btn[i]);
					fdService.deleteSelectFieldInGamelist(check_btn[i]);
				}
				return "redirect:/admin/select?select=fieldAdmin";
				// ???????????? ???????????? ???
			} else {
				List<String> list = new ArrayList<String>();

				if (check_btn != null) {
					for (int i = 0; i < check_btn.length; i++) {
						model.addAttribute("gameFieldInfoVO" + i, fdService.selectFieldData(check_btn[i], model));
						list.add("gameFieldInfoVO" + i);
					}
				}
				model.addAttribute("list", list);
				return "adminPage/adminMain";
			}
		}
		model.addAttribute("fieldselect", fieldselect);
		return "adminPage/adminMain";
	}

	// ?????? ??????
	@PostMapping("/fieldModify")
	public String modifyField(Model model, GameFieldInfoVO gfvo, @RequestParam("select") String select,
			FieldReservationVO fvo, GlistVO gvo) {
		model.addAttribute("select", select);

		fdService.modifyFieldUpdate(gfvo);

		gvo.setGameMacth(gfvo.getFieldType());
		fdService.modifyGameListUpdate(gvo);

		fdService.modifyFieldReservationUpdate(fvo);
		model.addAttribute("gfVO", gfvo);
		return "redirect:/admin/select";
	}

	// ?????? ??????
	@PostMapping("/addField")
	public String addField(Model model, GameFieldInfoVO vo, @RequestParam("fieldImg") MultipartFile[] files,
			@RequestParam("select") String select, HttpSession session) throws IllegalStateException, IOException {
		int cnt = 0;
		List<String> imglist = new ArrayList<String>();

		for (MultipartFile file : files) {
			try {
				if (!file.getOriginalFilename().isEmpty() || file.getOriginalFilename() != null) {
					// ?????? ????????? ????????? ????????? ????????? ???????????????.
					Path path = Paths
							.get("C:/Users/GDJ 52/git/EZProject/EZFootBall/src/main/webapp/resources/image/ground/"
									+ file.getOriginalFilename());
					file.transferTo(path);
					System.out.println(file.getOriginalFilename() + "?????? ??????.");
					imglist.add(file.getOriginalFilename());
					cnt++;
				} else {
					System.out.println("????????? ??????????????????.");
				}
			} catch (Exception e) {
				System.out.println("????????? ??????");
				System.out.println(cnt);
			}

		}

		if (imglist.size() == 1) {
			vo.setFieldImg1(imglist.get(0));
		} else if (imglist.size() == 2) {
			vo.setFieldImg1(imglist.get(0));
			vo.setFieldImg2(imglist.get(1));
		} else if (imglist.size() == 3) {
			vo.setFieldImg1(imglist.get(0));
			vo.setFieldImg2(imglist.get(1));
			vo.setFieldImg3(imglist.get(2));
		} else if (imglist.size() == 4) {
			vo.setFieldImg1(imglist.get(0));
			vo.setFieldImg2(imglist.get(1));
			vo.setFieldImg3(imglist.get(2));
			vo.setFieldImg4(imglist.get(3));
		} else if (imglist.size() == 5) {
			vo.setFieldImg1(imglist.get(0));
			vo.setFieldImg2(imglist.get(1));
			vo.setFieldImg3(imglist.get(2));
			vo.setFieldImg4(imglist.get(3));
			vo.setFieldImg5(imglist.get(4));
		}

		fdService.insertFieldInfo(vo);
		
		GameFieldInfoVO gfvo = rtservice.getfieldinfo(vo.getFieldCode());
        
        LocalDate now = LocalDate.now();
        int year = now.getYear();
        int today = now.getDayOfMonth();
        int month = now.getMonthValue();
        
        String dateset ="";
        if(month == 12) {
            dateset = year + "-" + (01) + "-" +today;
        }else {
            dateset = year + "-" + (month) + "-" +today;
        }
        LocalDate day = LocalDate.parse(dateset);
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        
        LocalDate first = day.withDayOfMonth(1);
        
        for(int j=1; j<=day.lengthOfMonth(); j++) {
            String setday = day.withDayOfMonth(j).format(formatter);
            GlistVO gvo = new GlistVO();
            gvo.setFieldName(gfvo.getFieldName());
            gvo.setFieldAddress(gfvo.getFieldAddress());
            gvo.setFieldCode(gfvo.getFieldCode());
            gvo.setGameDay(setday); // ????????????
            gvo.setGamePlace(gfvo.getGamePlace());
            gvo.setGameMacth(gfvo.getFieldType());
            if(gfvo.getFieldType().equals("5vs5")) {
            	gvo.setGameMinp(10);
                gvo.setGameMaxp(15);
            }else {
            	gvo.setGameMinp(12);
            	gvo.setGameMaxp(18);
            }
//            vo.setGameMag(uvo.getUserName());
//            vo.setGameMagcode(uvo.getUserCode());
            rtservice.newgame(gvo);
           
        }
        

		return "redirect:/admin/select?select=" + session.getAttribute("select");
	}

	// ???????????? ?????????
	@GetMapping("/comuselect")
	public String comuselect(@RequestParam("comuselect") String comuselect, HttpSession session, Model model) {
		service.getBlackList(model);
		System.out.println(service.getBlackUser());
		model.addAttribute("black", service.getBlackUser());
		model.addAttribute("review", service.reviewCommentList());
		model.addAttribute("comuselect", comuselect);
		return "adminPage/adminMain";
	}

	// ?????? ??????
	@PostMapping("/reviewselect")
	public String reviewselect(@RequestParam("reviewcode") int reviewcode, Model model, ReviewCommentVO vo) {
		vo.setUserCode(reviewcode);
		List<ReviewCommentVO> list = service.selectCommentList(vo);
		model.addAttribute("review", list);
		System.out.println(list.get(0));
		return "adminPage/adminMain";
	}

	// ??????????????? ??????
	@PostMapping("/blackselect")
	public String blacklistselect(Model model, BlacklistVO vo, @RequestParam("blacklocal") String blacklocal,
			@RequestParam("search") String search) {

		if (blacklocal.equals("local")) {
			vo.setBlacklistLocal(search);
		} else if (blacklocal.equals("buserName")) {
			vo.setBuserName(search);
		} else if (blacklocal.equals("userCode")) {
			vo.setSuserCode(search);
		} else if (blacklocal.equals("blackuserCode")) {
			vo.setSblackuserCode(search);
		}
		model.addAttribute("list", service.joinblackList(vo));

		return "adminPage/adminMain";
	}

	// ?????? ??????
	@PostMapping("/reviewdelete")
	@ResponseBody
	public int reviewdelete(HttpSession session, @RequestParam(value = "reviewChkCode[]") List<String> chArr,
			ReviewCommentVO vo) {
		System.out.println(chArr);
		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
		String userId = uvo.getUserId();
		int result = 0;

		if (uvo != null) {
			for (String reviewCode : chArr) {
				service.deletereview(Integer.parseInt(reviewCode));
			}
			result = 1;
		}

		return result;
	}

	// ?????? ????????? ??????
	@PostMapping("/blacklistdelete")
	@ResponseBody
	public int blacklistdelete(HttpSession session, @RequestParam(value = "blackChkCode[]") List<String> chArr,
			BlacklistVO vo) {
		System.out.println(chArr);
		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
		String userId = uvo.getUserId();
		int result = 0;

		if (uvo != null) {
			for (String blacklistCode : chArr) {
				service.deleteblacklist(Integer.parseInt(blacklistCode));
			}
			result = 1;
		}

		return result;
	}

	// ??????????????? ??????
	@PostMapping("/blackcheck")
	@ResponseBody
	public int blackCheckList(HttpSession session, @RequestParam(value = "blakcChkCode[]") List<String> chArr,
			BlacklistVO vo) {
		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
		String userId = uvo.getUserId();
		int result = 0;

		if (uvo != null) {
			for (String userCode : chArr) {
				service.addBlacklist(Integer.parseInt(userCode));
			}
			result = 1;
		}

		return result;
	}

	// ??????????????? ??????
	@PostMapping("/blackclear")
	@ResponseBody
	public int blackClearList(HttpSession session, @RequestParam(value = "blakcChkCode[]") List<String> chArr,
			BlacklistVO vo) {
		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
		String userId = uvo.getUserId();
		int result = 0;

		if (uvo != null) {
			for (String userCode : chArr) {
				service.clearBlacklist(Integer.parseInt(userCode));
			}
			result = 1;
		}

		return result;
	}

	@GetMapping("/payselect")
	public String payselect(@RequestParam("payselect") String payselect, Model model, HttpSession session,
			HttpServletRequest request) {
		String chBox[] = request.getParameterValues("chBox");
		// ????????????
		session.setAttribute("count", service.refundsub());

		if (payselect.equals("pay")) {
			model.addAttribute("rvListAll", fdService.FieldReservationListAll());
		} else if (payselect.equals("cancel")) {
			model.addAttribute("rfListAll", fdService.FieldRefundListAll());
		} else if (payselect.equals("pay_cancel")) {
			for (int i = 0; i < chBox.length; i++) {
				DataVO dvo = new DataVO();

				if (fdService.selectRvType(chBox[i]).equals("S") || fdService.selectRvType(chBox[i]).equals("TS")) {
					if (fdService.selectRvType(chBox[i]).equals("TS")) {
						dvo.setGameCode(Integer.parseInt(fdService.selectGameCode(chBox[i])));
						dvo.setTeamCode(Integer.parseInt(fdService.selectTeamCode(chBox[i])));
						fdService.TeamFieldReservationCancelUpdate(dvo);
					} else {
						System.out.println("??????????");
						fdService.GameSignUpCancelUpdate(chBox[i]);
					}
				} else {
					System.out.println("?????? ??????????");
					fdService.payCancelUpdate(chBox[i]);
					fdService.TGRCancelUpdate(fdService.selectGameCode(chBox[i]));
				}
			}
			model.addAttribute("rfListAll", fdService.FieldRefundListAll());
			return "redirect:/admin/payselect?payselect=cancel";
		}

		model.addAttribute("payselect", payselect);
		return "adminPage/adminMain";
	}

	@GetMapping("/adminselect")
	public String adminselect(@RequestParam("adminselect") String adminselect, Model model) {
		model.addAttribute("inquiryList", inquiryService.inquiryListAdmin());
		model.addAttribute("adminselect", adminselect);
		return "adminPage/adminMain";
	}

	@GetMapping("/detail/{detail}")
	public String inquiryDetail(@PathVariable("detail") int detail, Model model, InquiryVO inquiryVO) {
		System.out.println("?????? ????????? :: " + detail);
		inquiryVO.setInquiryCode(detail);
		model.addAttribute("inquiryVO", inquiryService.inquiryDetail(inquiryVO));
		model.addAttribute("adminselect", "qna");
		return "adminPage/adminMain";
	}

	@GetMapping("/inquiry_add")
	public String inquiryAdd(String detail, String answer, Model model, InquiryVO inquiryVO) {
		inquiryVO.setInquiryCode(Integer.parseInt(detail));
		inquiryVO.setAnswerContent(answer);
		inquiryService.InquiryAdd2(inquiryVO);
		model.addAttribute("adminselect", "qna");
		return "redirect:/admin/adminselect";
	}

	@GetMapping("/inquirySearch")
	public String inquirySearch(@RequestParam("adminselect") String adminselect,
			@RequestParam("iselect") String iselect, @RequestParam("isearch") String isearch, Model model) {
		InquiryVO ivo = new InquiryVO();
		if (iselect.equals("????????????")) {
			ivo.setInquiryCode(Integer.parseInt(isearch));
		} else if (iselect.equals("????????????")) {
			ivo.setInquiryTitle(isearch);
		} else if (iselect.equals("????????????")) {
			ivo.setCreateDate(isearch);
		} else if (iselect.equals("????????????")) {
			ivo.setUserCode(Integer.parseInt(isearch));

		}
		List<InquiryVO> list = inquiryService.inquiryListAdmin(ivo);
		model.addAttribute("inquiryList", list);
		model.addAttribute("adminselect", adminselect);
		return "adminPage/adminMain";
	}

}
