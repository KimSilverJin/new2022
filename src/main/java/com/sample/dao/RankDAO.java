package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.sample.vo.DataVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GameResultVO;
import com.sample.vo.GlistVO;
import com.sample.vo.SjoinVO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Mapper
public interface RankDAO {
	
	public List<UserVO> rank();
	
	public UinVO selevel(int userCode);
	
	public int result(GameResultVO vo);
	
	public int lose(GameResultVO vo);
	
	public int plus(UinVO vo);
	
	public int minus(UinVO vo);
	
	public int level(UinVO vo);
	
}
