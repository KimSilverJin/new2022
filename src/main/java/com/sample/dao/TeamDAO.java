package com.sample.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

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

@Mapper
public interface TeamDAO {
	
	public List<TlistVO> list(TlistVO vo);
	
	public TlistVO info(int num);
	
	public int subgame(int num);
	
	public int maxgame(int num);
	
	public int setslist(DataVO vo);
	
	public UinVO abile(int usercode);
	
	public List<Integer> teamcode (int gameCode);
	
	public List<UinVO> joininfo (int teamCode);
	
	public GameFieldInfoVO fieldinfo(int fieldcode);
	
	public int cntmebr (int teamCode);
	
	public int selectgen (int teamCode);
	
	public int newreser(TlistVO vo);
	
	public int newresult(TlistVO vo);
	
	//----------------------정욱 10.24-------------------------
		//----------------------registeration page--------------------------------------------------
			// 팀 멤버 등록 
			public int insertTeamMember(TeamMemberVO vo);
			
			// 팀 멤버 리스트 불러오기
			public List<TeamMemberVO> getTeamList();
			
		//----------------------posting page--------------------------------------------------	
			// 매치 작성완료 버튼 클릭시 DB에 저장
			public int matchReg(MatchRegVO vo);
			
			// 매치 작성완료 후 매치정보 불러오기
			public List<MatchRegVO> getMatchList();
			
			// 팀 등록 테이블에서 정보 불러오기
			public List<TeamMemberVO> getTeamListWhere(TeamMemberVO vo);
			
			// 매치 작성 후 완료버튼시 insert into gameList
			public int putTeamMatchGlist(GlistVO vo);
			
			// 구장정보 가져오기 - 지도
			public List<SearchVO> getGameMapWhere(SearchVO vo);
			
			public int getTeamMatchGlist();
			
			public int gameTJoinList(DataVO vo);
			
			public int getTeamName(GlistVO vo);
			
			// 시간 유효성 검사
			public List<GlistVO> selectTimeR(GlistVO vo);
			
			// 시간 유효성 검사2
			public List<GlistVO> checkTime(GlistVO vo);
			
			// rental payment 이동
			public GlistVO matchInfo(GlistVO vo);
			
			// 결제버튼 누를시
			public void insertFieldRVT(FieldReservationVO rvo1);
			
			// 팀 등록시 필요한 유저정보 가져오는 것
			public UserVO getUserInfo(String str);
			
			// 정욱 팀 등록시 사용
			public List<UinVO> getUserList(UinVO vo);
			

			// 팀등록시 user_abil에 업데이트
			public void updateUserAbil(TeamMemberVO vo);
			public void updateUserInfo(TeamMemberVO vo);
			
			
			// 팀등록 마지막 코드 가져오기
			public int getLastTeamC();
			
			// myPage 팀 detail 필요 정보
			public UinVO getAllAbil(int usercode);
			public TeamMemberVO getAllTeamMem(int teamcode);
			public UserVO getAllUserInfo(String id);
			
			//팀 전체 해제
			public void updateTNoUserInfo(TeamMemberVO vo);
			public void updateTNoUserAbil(TeamMemberVO vo);
			public void deleteT(TeamMemberVO vo);
			
			public void updatePerson1(Map<String, Object> map);
			
			public int upUserAbil(UserVO vo);
			
			public int upUserInfo(UserVO vo);
			
			public int dtteamcode (int teamCode);
			
			public int dateamcode (int teamCode);
			
			public int diteamcode (int teamCode);
			
			public int outmem (TeamMemberVO vo);
			
			public int outinfo (int userCode);
			
			public int outabil (int userCode);
			
			public UserVO userVO (int userCode);

		//-----------------------------------------------
}
