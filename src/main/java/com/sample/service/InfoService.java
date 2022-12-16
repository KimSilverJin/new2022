package com.sample.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sample.dao.UserDAO;
import com.sample.vo.UserVO;

@Service
public class InfoService {

	private UserDAO userDAO;

	public InfoService(UserDAO userDAO) {
		super();
		this.userDAO = userDAO;
	}

	public List<UserVO> userinfoList() {
		return userDAO.userinfoList();
	}

	public void changeUserinfo(UserVO userVO) {
		userDAO.changeUserinfo(userVO);
	}
}
