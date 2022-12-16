package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sample.vo.DataVO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GlistVO;

@Mapper
public interface RentalDAO {

	public List<GlistVO> rvListAll(GlistVO vo);

	public List<GlistVO> selectTime(GlistVO vo);

	@MapKey("fieldCode")
	public GameFieldInfoVO fieldInfo(int fieldCode);

	public GlistVO matchInfo(int fieldCode);

	public void insertFieldReservation(FieldReservationVO vo);
	
	public void newgame(GlistVO vo);
	
	public GameFieldInfoVO getfieldinfo(int fieldCode);
	
	public List<GlistVO> rvListSelect(GlistVO vo);

	// 마이페이지 구장예약 리스트 불러오기
	public List<FieldReservationVO> getFieldReservation(int userCode);
	
	// 예약테이블 등록시 유효성검사
	public int rvCheck(FieldReservationVO vo);
	
	public void insertRvInGameList(FieldReservationVO vo);
	
	// ------------------------ 관리자 영역 -------------------------
	
	// -------------------- 관리자 구장관리 ---------------------
	public List<GameFieldInfoVO> getFieldListAll();
	public GameFieldInfoVO selectFieldData(String fieldCode);
	public void deleteSelectField(String fieldCode);
	public void deleteSelectFieldInGamelist(String fieldCode);
	public String selectFieldImage(String fieldCode);
	public void modifyField(GameFieldInfoVO gfvo);
	public void modifyGamelist(GlistVO gvo);
	public void modifyReservation(FieldReservationVO fvo);
	
	
	// --------------------- 관리자 구장추가 ----------------------
	public void insertFieldInfo(GameFieldInfoVO vo);
	
	// -------------------- 관리자 예약관리 --------------------
	// type 이 G이고, state가 '예약완료'인 list출력
	public List<FieldReservationVO> GFieldReservationList();
	public void updateFieldReservation(String gameCode);
	public void deleteFieldGamelist(String gameCode);
	public List<FieldReservationVO> GCancelList();
	
	// ------------------- 관리자 결제관리 ----------------------
	public List<FieldReservationVO> FieldReservationListAll();
	public List<FieldReservationVO> FieldRefundListAll();
	
	public String selectRvType(String rvCode);
	public String selectGameCode(String rvCode);
	public String selectTeamCode(String rvCode);
	
	public void TeamFieldReservationCancelUpdate(DataVO dvo);
	public void TGRCancelUpdate(String gameCode);
	
	public void payCancelUpdate(String rvCode);
	public void GameSignUpCancelUpdate(String rvCode);


	//환불
	public int refund(int rvCode);




	
}
