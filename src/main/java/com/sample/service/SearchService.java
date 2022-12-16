package com.sample.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.SearchDAO;
import com.sample.vo.RecentVO;
import com.sample.vo.SearchVO;

@Service
public class SearchService {
	private SearchDAO searchDAO;

	public SearchService(SearchDAO searchDAO) {
		super();
		this.searchDAO = searchDAO;
	}

	public List<SearchVO> selectList() {
//		System.out.println("dao : " + searchDAO.selectAll().get(0).getFieldName());
		return searchDAO.selectAll();
	}

	public void fieldNum(Model model, int id) {
		model.addAttribute("searchVO", searchDAO.selectNum(id));
	}

	public List<RecentVO> getRecentAllList(RecentVO recentVO) {
		List<RecentVO> list = searchDAO.selectRecentList(recentVO);
		return list;
	}

	public Map<String, String> setRecent(RecentVO recentVO) {
		Map<String, String> map = new HashMap<>();

		if (searchDAO.insertRecent(recentVO) > 0) {
			map.put("state", "ok");
		} else {
			map.put("state", "error");
		}
		return map;
	}

	public Map<String, String> deleteRecent(RecentVO recentVO) {
		Map<String, String> map = new HashMap<>();

		if (searchDAO.deleteRecent(recentVO) > 0) {
			map.put("state", "ok");
		} else {
			map.put("state", "error");
		}
		return map;
	}

	public List<SearchVO> SearchAll(SearchVO searchVO) {
		List<SearchVO> list = searchDAO.selectScout(searchVO);
		return list;
	}

	/*
	 * public List<SearchDataVO> getSearchList() { return
	 * searchDAO.selectSearchList(); }
	 */
}
