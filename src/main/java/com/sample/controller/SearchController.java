package com.sample.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.service.SearchService;
import com.sample.vo.RecentVO;
import com.sample.vo.SearchVO;
import com.sample.vo.UserVO;

@Controller
public class SearchController {

	private SearchService searchService;

	public SearchController(SearchService searchService) {
		super();
		this.searchService = searchService;
	}

	@ResponseBody
	@GetMapping("/searchlist")
	public List<SearchVO> searchBar(SearchVO searchVO, Model model) {
		List<SearchVO> list = searchService.selectList();
		model.addAttribute("list", list);
//		System.out.println("list : " + list.get(0).getFieldName());
		return list;
	}

	@GetMapping("/stadium/{id}")
	public String stadium(@PathVariable("id") int id, Model model) {

		searchService.fieldNum(model, id);
		return "/search/result";
	}

	@GetMapping("/recentSearch")
	public String recentSearch(Model model) {

		return "Redirect:search";
	}

	@GetMapping("/recent")
	@ResponseBody
	public List<RecentVO> getRecentAll(RecentVO recentVO, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
		if (uvo != null) {
			recentVO.setUserCode(uvo.getUserCode());
//			System.out.println("받아오기: " + recentVO.getUserCode());
		} else {
			recentVO.setUserCode(0);
		}
		return searchService.getRecentAllList(recentVO);
	}

	@PostMapping("/recent")
	@ResponseBody
	public Map<String, String> setRecent(@RequestBody RecentVO recentVO, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
		if (uvo != null) {
			recentVO.setUserCode(uvo.getUserCode());
//			System.out.println("post :" + recentVO.getSearchData());
		} else {
			recentVO.setUserCode(0);
		}
		return searchService.setRecent(recentVO);
	}

	@PostMapping("/delete_recent")
	@ResponseBody
	public Map<String, String> deleteRecent(@RequestBody RecentVO recentVO, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
		if (uvo != null) {
			recentVO.setUserCode(uvo.getUserCode());
//			System.out.println("post :" + recentVO.getSearchData());
		} else {
			recentVO.setUserCode(0);
		}
		return searchService.deleteRecent(recentVO);
	}

	@PostMapping("/recent_list")
	@ResponseBody
	public List<SearchVO> setSearch(@RequestBody SearchVO searchVO) {

		/*
		 * System.out.println("post :" + searchDataVO.getSearchText());
		 * 
		 * System.out.println("return1 : " + searchService.SearchAll(searchDataVO));
		 * System.out.println("return2 : " +
		 * searchService.SearchAll(searchDataVO).get(0).getFieldName());
		 */

		return searchService.SearchAll(searchVO);
	}

	/*
	 * @GetMapping("/recent_list")
	 * 
	 * @ResponseBody public List<SearchDataVO> getSearchAll() {
	 * System.out.println("get :" +
	 * searchService.getSearchList().get(0).getFieldName()); return
	 * searchService.getSearchList(); }
	 */

}
