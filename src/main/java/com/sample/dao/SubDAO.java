package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.DataVO;
import com.sample.vo.GlistVO;

@Mapper
public interface SubDAO {

	public int delete(DataVO vo);
	
	public int rdelete(int rvCode);
	
	public int sdelete(DataVO vo);

	public int tdelete(DataVO vo);
	
	public int add(GlistVO vo);
	
	public GlistVO all(int gameCode);
	
	public int slistadd(GlistVO vo);
	
	public int supdate(int gameCode);
	
	public List<Integer> usercode(int teamCode);
	
	public int tadd(GlistVO vo);
	
	public int tlistadd(GlistVO vo);
	
	public int tupdate(int gameCode);
	
	public int newresult(GlistVO vo);
	
	public int delupdate (int gameCode);

}
