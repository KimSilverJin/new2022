package com.sample.service;

import org.springframework.stereotype.Service;

import com.sample.dao.UserDAO;
import com.sample.vo.UinVO;

@Service
public class UinService {

	private UserDAO userDAO;

	public UinService(UserDAO userDAO) {
		super();
		this.userDAO = userDAO;
	}

	public UinVO getUserAbil(int userCode) {
		return userDAO.getUserAbil(userCode);
	}
}
