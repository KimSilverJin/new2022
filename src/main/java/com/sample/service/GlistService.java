package com.sample.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.GlistDAO;
import com.sample.vo.DataVO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GlistVO;
import com.sample.vo.SjoinVO;
import com.sample.vo.UinVO;

@Service
public class GlistService {

	private GlistDAO dao;

	public GlistService(GlistDAO dao) {
		super();
		this.dao = dao;
	}

	public List<GlistVO> list(Model model, GlistVO vo) {
		return dao.list(vo);
	}

	public void info(int num, Model model) {
		model.addAttribute("matchinfo", dao.info(num));
	}

	public void subgame(int num) {
		dao.subgame(num);
	}

	public void maxgame(int num) {
		dao.maxgame(num);
	}

	public List<SjoinVO> joinlist(int num) {
		return dao.joinlist(num);
	}

	public List<UinVO> joininfo(int id) {
		return dao.joininfo(id);
	}

	public void setslist(DataVO vo) {
		dao.setslist(vo);
	}

	public UinVO abil(int usercode, HttpSession session) {
		session.setAttribute("urabil", dao.abile(usercode));
		return dao.abile(usercode);
	}

	public GameFieldInfoVO fieldinfo(int fieldcode) {
		return dao.fieldinfo(fieldcode);
	}

	public void newreser(GlistVO vo) {
		dao.newreser(vo);
	}

	public List<FieldReservationVO> getMatchList(FieldReservationVO fieldReservationVO) {
		List<FieldReservationVO> list = dao.getMatchList(fieldReservationVO);
		return list;
	}
	
	public void newresult (GlistVO vo) {
		System.out.println(vo.getGameCode());
		dao.newresult(vo);
	}
}
