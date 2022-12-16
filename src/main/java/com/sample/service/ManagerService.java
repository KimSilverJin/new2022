package com.sample.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sample.dao.ManagerDAO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.ManagerVO;
import com.sample.vo.UserVO;

@Service
public class ManagerService {

	private ManagerDAO managerDAO;

	public ManagerService(ManagerDAO managerDAO) {
		super();
		this.managerDAO = managerDAO;
	}

	public ManagerVO isManager(int UserCode) {
		return managerDAO.isManager(UserCode);
	}

	public void insertManager(ManagerVO managerVO) {
		managerDAO.insertManager(managerVO);
	}

	public List<ManagerVO> managerHistoryList(ManagerVO managerVO) {
		return managerDAO.managerHistoryList(managerVO);
	}

	public List<ManagerVO> managerHistoryList2(ManagerVO managerVO) {
		return managerDAO.managerHistoryList2(managerVO);
	}

	public void managerAdd(int mgrCode) {
		managerDAO.managerAdd(mgrCode);
	}

	public void managerFail(int mgrCode) {
		managerDAO.managerFail(mgrCode);
	}

	public List<UserVO> getManagerList() {
		return managerDAO.getManagerList();
	}

	public void managerAdd2(UserVO uservo) {
		managerDAO.managerAdd2(uservo);
	}

	public void managerDelete(int userCode) {
		managerDAO.managerDelete(userCode);
	}

	public void isManagerHistory(int userCode) {
		managerDAO.isManagerHistory(userCode);
	}

	public List<GameFieldInfoVO> getGameFieldInfo() {
		return managerDAO.getGameFieldInfo();
	}

	public List<UserVO> searchManager(UserVO userVO) {
		return managerDAO.searchManager(userVO);
	}

	public int getFieldCode(String fieldName) {
		return managerDAO.getFieldCode(fieldName);
	}
}
