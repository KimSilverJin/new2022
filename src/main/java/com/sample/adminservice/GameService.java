package com.sample.adminservice;


import java.util.List;

import org.springframework.stereotype.Service;

import com.sample.dao.GameDAO;
import com.sample.dao.ManagerDAO;
import com.sample.dao.SubDAO;
import com.sample.vo.DataVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GameResultVO;
import com.sample.vo.GlistVO;
import com.sample.vo.ManagerVO;
@Service
public class GameService {

	private GameDAO dao;
	private ManagerDAO mdao;

	public GameService(GameDAO dao, ManagerDAO mdao) {
		super();
		this.dao = dao;
		this.mdao = mdao;
	}

	public List<GlistVO> all(String gameType) {
		return dao.all(gameType);
	}

	public int count(String gameType) {
		return dao.count(gameType);
	}
	
	public List<GlistVO> numlist(GlistVO vo){
		return dao.numlist(vo);
	}
	
	public List<GlistVO> searchlist(GlistVO vo){
		return dao.searchlist(vo);
	}
	
	public void sadd(GlistVO vo) {
		dao.sadd(vo);
	}
	
	public void tadd(GlistVO vo) {
		dao.tadd(vo);
	}
	
	public GameFieldInfoVO fieldinfo(int fieldCode){
		return dao.fieldinfo(fieldCode);
	}
	
	public void del(int gameCode) {
		dao.del(gameCode);
	}
	
	public void update(GlistVO vo) {
		dao.update(vo);
	}
	
	public void rdel(int resultCode) {
		dao.rdel(resultCode);
	}
	
	public void radd(GameResultVO vo) {
		dao.radd(vo);
	}
	
	public void rup(GameResultVO vo) {
		dao.rup(vo);
	}
	
	public List<Integer> teamlist (int teamCode) {
		return dao.teamlist(teamCode);
	}
	
	public void newgame(GlistVO vo) {
		dao.newgame(vo);
	}
	
	public List<GameFieldInfoVO> allfieldinfo(){
		return dao.allfieldinfo();
	}
	
	public ManagerVO maginfo(int field_code){
		return dao.maginfo(field_code);
	}
	
	public int getcode (int userCode) {
	    return dao.getcode(userCode);
	}
	
	public GameFieldInfoVO getfieldinfo (int fieldCode) {
	    return dao.getfieldinfo(fieldCode);
	}

	public List<GlistVO> sociallist (GlistVO vo){
		System.out.println("서비스");
		return mdao.sociallist(vo);
	}
	
	public int sociallistcnt (GlistVO vo) {
		System.out.println("갯수서비스");
		return mdao.sociallistcnt(vo);
	}
	
}
