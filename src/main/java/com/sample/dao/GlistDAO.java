package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.DataVO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GlistVO;
import com.sample.vo.SjoinVO;
import com.sample.vo.UinVO;

@Mapper
public interface GlistDAO {

	public List<GlistVO> list(GlistVO vo);

	public GlistVO info(int num);

	public int subgame(int num);

	public int maxgame(int num);

	public List<SjoinVO> joinlist(int num);

	public List<UinVO> joininfo(int userid);

	public UinVO abile(int userid);

	public int setslist(DataVO vo);

	public GameFieldInfoVO fieldinfo(int fieldcode);

	public int newreser(GlistVO vo);

	public List<FieldReservationVO> getMatchList(FieldReservationVO vo);

	public int newresult(GlistVO vo);
}
