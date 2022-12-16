package com.sample.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.TeamDAO;
import com.sample.vo.DataVO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GlistVO;
import com.sample.vo.MatchRegVO;
import com.sample.vo.SearchVO;
import com.sample.vo.TeamMemberVO;
import com.sample.vo.TlistVO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Service
public class TeamService {
	
	private TeamDAO dao;

	public TeamService(TeamDAO dao) {
		super();
		this.dao =dao;
	}
	
	public List<TlistVO> list(Model model,TlistVO vo) {
		return dao.list(vo);
		//model.addAttribute("list", vo);
	}
	
	public void info(int num,Model model) {
		model.addAttribute("matchinfo", dao.info(num));
	}
	
	public void subgame(int num) {
		dao.subgame(num);
	}
	public void maxgame(int num) {
		dao.maxgame(num);
	}
	public void setslist(DataVO vo) {
		dao.setslist(vo);
	}
	
	public UinVO abil(int usercode, HttpSession session) {
		session.setAttribute("urabil",dao.abile(usercode));
		return dao.abile(usercode);
	}
	
	public List<Integer> teamcode (int gameCode){
		return dao.teamcode(gameCode);
	}
	
	public List<UinVO> joininfo (int teamCode){
		return dao.joininfo(teamCode);
	}
	
	public GameFieldInfoVO fieldinfo (int fieldcode) {
		return dao.fieldinfo(fieldcode);
	}
	
	public int cntmebr (int teamCode) {
		return dao.cntmebr(teamCode);
	}
	
	public int selectgen (int teamCode) {
		return dao.selectgen(teamCode);
	}
	
	public void newreser(TlistVO vo) {
		dao.newreser(vo);
	}
	
	public void newresult(TlistVO vo) {
		dao.newresult(vo);
	}
	//-----------------정욱 10.24---------------------------------------
		//----------------------posting page--------------------------------------------------
			
			
			// insert 된 리스트를 가져오는 메서드
			public void getMatchList1(Model model) {
				model.addAttribute("matchList", dao.getMatchList());
		
			}
			
			public List<TeamMemberVO> getTeamNameListSer(TeamMemberVO vo){
				return dao.getTeamListWhere(vo);
			}
			
			//-------------------------------registration page-----------------------------------------	
			
			public boolean TeamMemberList(TeamMemberVO vo) {
					
				return (dao.insertTeamMember(vo)>0)?true:false;
			}
			
			// 매치 작성 후 완료버튼시 insert into gamelist
			
			public boolean putTeamMatchGlist(GlistVO vo) {
				
				return (dao.putTeamMatchGlist(vo)>0)?true:false;
			}
			
			// 지도에서 주소값 불러오기
			
			public List<SearchVO> getGameMap(SearchVO vo){
				
				return dao.getGameMapWhere(vo);
			}
			
			
			public int getTeamMatchGlist() {
				
				return dao.getTeamMatchGlist();
			}
			
			public void gameTJoinList(DataVO vo) {
				
				dao.gameTJoinList(vo);
			}
			
			public int getTeamNameT(GlistVO vo) {
				
				return dao.getTeamName(vo);
			}
			
			// 매치 등록시 시간 유효성 검사
			public List<GlistVO> timeList(GlistVO gvo) {
				return dao.selectTimeR(gvo);
			}
			
			public List<GlistVO> checkTime(GlistVO gvo) {
				return dao.checkTime(gvo);
			}
			
			// rental payment 이동시
			public void matchInfo(GlistVO vo) {
				
				System.out.println("여기!!!!!!!!!!!!!");
				System.out.println(vo.getUteamPay());
				System.out.println(vo.getGameType());
				System.out.println(vo.getFieldName());
				System.out.println(vo.getGameTime());
				System.out.println(vo.getGameDay());
				System.out.println(vo.getGameType().getClass().getName());
				System.out.println(vo.getGameTime().getClass().getName());
				System.out.println(vo.getGameDay().getClass().getName());
		
//				System.out.println(dao.matchInfo(vo).getGameDay());
//				System.out.println(dao.matchInfo(vo).getFieldName());
				
				
			}
			
			// Reservation table insert
			public void insertFieldRVT(FieldReservationVO rvo1) {
				
				dao.insertFieldRVT(rvo1);
			}
			// 팀 등록시 로그인 한 유저정보 가져오는 것
			public void getUserInfo(String str,Model model) {
				System.out.println("서비스 : "+ dao.getUserInfo(str));
				model.addAttribute("user", dao.getUserInfo(str));
			}
			
			//  팀등록시 정보 불러오기용 
			public List<UinVO> getUserList(UinVO vo) {

				return dao.getUserList(vo);
			}
			
			//팀 등록시 user_abil update
			public void updateUserAbil(TeamMemberVO vo) {
			
				dao.updateUserAbil(vo);
			}
			
			public void updateUserInfo(TeamMemberVO vo) {
				dao.updateUserInfo(vo);
			}
			
			// 팀 등록시 마지막 팀code 가져오기
			public int getLastTeamC() {
				return dao.getLastTeamC();
			}
			//user abil, team, userinfo 정보 가져오기
			public UinVO getAllAbil(int usercode) {
				return dao.getAllAbil(usercode);
			}
			public TeamMemberVO getAllTeamMem(int teamcode) {
				return dao.getAllTeamMem(teamcode);
			}
			public UserVO getAllUserInfo(String id) {
				System.out.println("Dao : "+dao.getAllUserInfo(id));
				
				return dao.getAllUserInfo(id);
			}
			
			public void updateTNoUserInfo(TeamMemberVO vo) {
				dao.updateTNoUserInfo(vo);
			}
			
			public void updateTNoUserAbil(TeamMemberVO vo) {
				dao.updateTNoUserAbil(vo);
			}
			
			public void deleteT(TeamMemberVO vo) {
				
				dao.deleteT(vo);	
			}
			
			public void updatePerson1(Map<String, Object> map) {
				dao.updatePerson1(map);
			}
			
			public void upUserAbil(UserVO vo) {
				dao.upUserAbil(vo);
			}
			
			public void upUserInfo(UserVO vo) {
				dao.upUserInfo(vo);
			}
			
			public void dtteamcode (int teamCode) {
				dao.dtteamcode(teamCode);
			}
			
			public void dateamcode (int teamCode) {
				dao.dateamcode(teamCode);
			}
			
			public void diteamcode (int teamCode) {
				dao.diteamcode(teamCode);
			}
			
			public void outmem (TeamMemberVO vo) {
				dao.outmem(vo);
			}
			
			public void outabil (int userCode) {
				dao.outabil(userCode);
			}
			
			public void outinfo (int userCode) {
				dao.outinfo(userCode);
			}
			
			public UserVO userVO (int userCode) {
				return dao.userVO(userCode);
			}
			
			//-----------------------------------------------------
}
