package com.sample.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.UserDAO;
import com.sample.vo.UserVO;

@Service
public class FindService {

	private UserDAO dao;

	public FindService(UserDAO dao) {
		super();
		this.dao = dao;
	}

	public boolean searchUser1(UserVO userVO, Model model) {
		UserVO uvo = dao.searchUser1(userVO);
		if (uvo != null) {
			model.addAttribute("userVO", uvo);
			return true;
		} else {
			return false;
		}
	}

	public UserVO searchUser1(UserVO userVO) {
		return dao.searchUser1(userVO);
	}

	public boolean searchUser2(UserVO userVO, Model model) {
		UserVO uvo = dao.searchUser2(userVO);
		if (uvo != null) {
			model.addAttribute("userVO", uvo);
			return true;
		} else {
			return false;
		}
	}

	public UserVO searchUser2(UserVO userVO) {
		return dao.searchUser2(userVO);
	}

	public void setPassword(UserVO userVO) {
		System.out.println("service : " + userVO.getUserPw());
		System.out.println("service : " + userVO.getUserId());
		dao.newPassword(userVO);
	}
}
