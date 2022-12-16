package com.sample.adminservice;


import java.util.List;

import org.springframework.stereotype.Service;

import com.sample.dao.SubDAO;
import com.sample.vo.DataVO;
import com.sample.vo.GlistVO;
@Service
public class SubService {

	private SubDAO dao;

	public SubService(SubDAO dao) {
		super();
		this.dao = dao;
	}
	
	public void delete(DataVO vo) {
		dao.delete(vo);
	}
	public void rdelete(int rvCode) {
		dao.rdelete(rvCode);
	}
	
	public void sdelete(DataVO vo) {
		dao.sdelete(vo);
	}
	
	public void tdelete(DataVO vo) {
		dao.tdelete(vo);
	}
		
	public GlistVO all(int gameCode) {
		return dao.all(gameCode);
	}
	
	public void add(GlistVO vo) {
		System.out.println("더하기");
		dao.add(vo);
	}
	
	public void slistadd(GlistVO vo) {
		dao.slistadd(vo);
	}
	
	public void supdate(int gameCode) {
		dao.supdate(gameCode);
	}
	
	public List<Integer>usercode(int teamCode){
		return dao.usercode(teamCode);
	}
	
	public void tadd(GlistVO vo) {
		dao.tadd(vo);
	}
	
	public void tlistadd(GlistVO vo) {
		dao.tlistadd(vo);
	}
	
	public void tupdate(int gameCode) {
		dao.tupdate(gameCode);
	}

	public void newresult (GlistVO vo) {
		dao.newresult(vo);
	}
	
	public void delupdate (int gameCode) {
		dao.delupdate(gameCode);
	}
}
