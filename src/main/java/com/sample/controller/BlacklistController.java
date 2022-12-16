package com.sample.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.sample.service.BlacklistService;
import com.sample.vo.BlacklistCommentVO;
import com.sample.vo.BlacklistVO;
import com.sample.vo.Criteria;
import com.sample.vo.PageMakerVO;
import com.sample.vo.ReviewCommentVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/blacklist")
public class BlacklistController {

	private BlacklistService service;

	public BlacklistController(BlacklistService service) {
		super();
		this.service = service;
	}

	@PostMapping("/blacklistselect")
	public String reviewselect(HttpSession session, @RequestParam("blacklistLocal") String blacklistLocal, Model model, BlacklistVO bvo, Criteria cri) {

		UserVO vo = (UserVO) session.getAttribute("sessionVO");
		model.addAttribute("userdata", vo);
		bvo.setBlacklistLocal(blacklistLocal);
		service.serachBlackList(model);
		
		
		model.addAttribute("list", service.getListPaging(cri));
		 int total = service.getTotal();
		 PageMakerVO pageMake = new PageMakerVO(cri, total);
		 model.addAttribute("pageMaker", pageMake);
		
		return "/blacklist/blacklistmain";
	}
	
	// 페이지 이동
		@GetMapping("/blacklistmain")
		public String move(HttpSession session, Model model, Criteria cri) {
			UserVO vo = (UserVO) session.getAttribute("sessionVO");
			model.addAttribute("userdata", vo);
			service.getBlackList(model);
			
			model.addAttribute("list", service.getListPaging(cri));
			
			 int total = service.getTotal();
			 
			 PageMakerVO pageMake = new PageMakerVO(cri, total);
			 
			 model.addAttribute("pageMaker", pageMake);
			
			return "/blacklist/blacklistmain";
		}

	// 상세 페이지 이동
	@GetMapping("/blacklistmain/{blacklistCode}")
	public String getBlacklistItem(HttpSession session, Model model,
			@PathVariable("blacklistCode") String blacklistCode, BlacklistVO bvo, Criteria cri) {
		System.out.println(blacklistCode);
		System.out.println(bvo.getBlacklistCode());
		UserVO vo = (UserVO) session.getAttribute("sessionVO");
		model.addAttribute("userdata", vo);
		model.addAttribute("cri", cri);
		service.getBlackListContent(model, blacklistCode);
		return "blacklist/detailpage";
	}

	// 페이지 입력
	@GetMapping("/blacklistmain/setbbs")
	public String setBBS(@SessionAttribute("sessionVO") UserVO uvo, @ModelAttribute("BlacklistVO") BlacklistVO bvo,
			Model model) {
			System.out.println(uvo.getUserCode());
			service.getcode(model, uvo);
		
		String[] cateList = { "서울", "인천", "경기도", "강원도", "경상도", "전라도", "충청도", "제주도" };
		model.addAttribute("blacklistLocal", cateList);
		return "blacklist/setbbs";

	}

	// 페이지 상세
	@PostMapping("/blacklistmain/setbbs")
	public String setBBSResult(@SessionAttribute("sessionVO") UserVO uvo, BlacklistVO bvo, Model model) {
		System.out.println(uvo);
		
		if (uvo != null) {
			System.out.println(uvo.getUserCode());
			bvo.setUserId(uvo.getUserId());
			bvo.setBuserName(uvo.getUserName());
			bvo.setUserCode(uvo.getUserCode());
			service.adduserBlack(bvo);
			if (service.setBlackList(bvo)) {
				
				return "redirect:/blacklist/blacklistmain";
			} else {
				model.addAttribute("alert", "alert");
				return "redirect:/blacklist/blacklistmain";	
			}
		} else {
			return "redirect:/loginPage/login";
		}
	}

	// 페이지 수정
	@GetMapping("/blacklistmain/editbbs/{blacklistCode}")
	public String editBBS(@SessionAttribute("sessionVO") UserVO uvo, Model model, @RequestParam("blackCode") String blackCode,
			@PathVariable("blacklistCode") String blacklistCode, @ModelAttribute("BlacklistVO") BlacklistVO bvo) {
		bvo.setBlackuserCode(Integer.parseInt(blackCode));
		System.out.println(bvo.getBlackuserCode());
		service.deleteuserBlack(bvo);
		service.getcode(model, uvo);
		if (uvo != null) {
			service.getBlackListContent(model, blacklistCode);	
			String[] cateList = { "서울", "인천", "경기도", "강원도", "경상도", "전라도", "충청도", "제주도" };
			model.addAttribute("blacklistLocal", cateList);
			return "blacklist/editbbs";
		} else {
			return "redirect:/loginPage/login";
		}
	}

	// 페이지 수정 로직
	@PostMapping("/blacklistmain/editbbs")
	public String editBBSResult(@SessionAttribute("sessionVO") UserVO uvo, @RequestParam("blackuserCode") String blackuserCode,
			@ModelAttribute("BlacklistVO") BlacklistVO bvo, Model model) {
		bvo.setUserId(uvo.getUserId());
		bvo.setBuserName(uvo.getUserName());
		bvo.setUserCode(uvo.getUserCode());
		/* System.out.println(bvo.getBlackuserCode()); */
		/* service.deleteuserBlack(bvo); */
		//먼저 기존값을 받아서 딜리트 로직을 진행하고
		/* bvo.setBlackuserCode(0); */
		// 초기화를 진행하고
		//아래 삭제로직에서 새로 받아서 진행한것처럼 새값을 넣어준다 
		/*
		 * bvo.setBlackuserCode(Integer.parseInt(blackuserCode));
		 * System.out.println(bvo.getBlackuserCode());
		 */
		service.adduserBlack(bvo);
		if (service.editBlackList(bvo)) {
			return "redirect:/blacklist/blacklistmain";
		} else {
			model.addAttribute("alert", "alert");
			return "redirect:/blacklist/blacklistmain";
		}
		
		
		
	}

	// 페이지 삭제
	@GetMapping("/blacklistmain/deletebbs/{blacklistCode}")
	public String deleteBBSResult(@SessionAttribute("sessionVO") UserVO uvo, Model model, @RequestParam("blackCode") String blackCode,
			@ModelAttribute("BlacklistVO") BlacklistVO bvo, @PathVariable("blacklistCode") String blacklistCode) {
		//get방식으로 보낸 blackCode를 @RequestParam으로 받아서 이걸 setblackusercode에 integet변환해서 넣음
		bvo.setUserCode(uvo.getUserCode());
		bvo.getBlackuserCode();
		bvo.setBlackuserCode(Integer.parseInt(blackCode));
		System.out.println(bvo.getBlackuserCode());
		
		service.deleteuserBlack(bvo);
		
		if (service.deleteBlackList(bvo)) {
		
			return "redirect:/blacklist/blacklistmain";
		} else {
			return "redirect:/blacklist/deletebbs/" + bvo.getBlacklistCode();
		}
	}

	// 댓글 view
	@PostMapping("/comment/{blackCode}")
	@ResponseBody
	public List<BlacklistCommentVO> getComments(@PathVariable("blackCode") int blackCode,HttpSession session, Model model) {
		UserVO vo = (UserVO)session.getAttribute("sessionVO");
		model.addAttribute("userdata", vo);
		return service.getCommentList(blackCode);
	}

	// 댓글 작성
	// 커멘트를 저장
		@PostMapping("/comment/save")
		@ResponseBody
		public Map<String, Object> setComments(HttpSession session,@SessionAttribute("sessionVO") UserVO uvo, @RequestBody BlacklistCommentVO bvo) {
			bvo.setUserCode(uvo.getUserCode());
			bvo.setUserName(uvo.getUserName());

			return service.setBlacklistComment(bvo);

		}
		
		
		// 댓글 수정
		@PutMapping("/comment/edit")
		@ResponseBody
		public Map<String,String> editblacklistComment(HttpSession session,@SessionAttribute("sessionVO") UserVO uvo, @RequestBody BlacklistCommentVO vo
				,@ModelAttribute("BlacklistVO") BlacklistVO bvo){
			
			vo.setUserCode(uvo.getUserCode());
			vo.setUserName(uvo.getUserName());
			
			return service.editBlackListComment(vo);
			
		}

			
		  //댓글 삭제
		  @DeleteMapping("/comment/delete")
		  @ResponseBody
		  public Map<String,String> deleteblacklistComment(HttpSession session, @RequestBody BlacklistCommentVO vo){
		    return service.deleteBlackListComment(vo);
		  }
		
		
}
