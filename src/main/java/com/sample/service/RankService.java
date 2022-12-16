package com.sample.service;



import java.util.List;

import org.springframework.stereotype.Service;
import com.sample.dao.RankDAO;
import com.sample.vo.GameResultVO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Service
public class RankService {
	
	private RankDAO dao;

	public RankService(RankDAO dao) {
		super();
		this.dao =dao;
	}
	
	public List<UserVO> rank(){
		return dao.rank();
	}
	
	public UinVO selevel(int userCode) {
		return dao.selevel(userCode);
	}
	
	public int result(GameResultVO vo){
		return dao.result(vo);
	}
	
	public int lose(GameResultVO vo){
		return dao.lose(vo);
	}
	
}
