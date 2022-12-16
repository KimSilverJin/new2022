package com.sample.adminservice;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.AdminDAO;
import com.sample.dao.RentalDAO;
import com.sample.vo.DataVO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GlistVO;

@Service
public class FieldAdminService {
	
	private RentalDAO dao;

	public FieldAdminService(RentalDAO dao) {
		super();
		this.dao = dao;
	}
	
	// --------------------- 구장 목록 -------------------------
	
	// 구장 정보 모두 내보내기
	public List<GameFieldInfoVO> getFieldListAll() {
		return dao.getFieldListAll(); 
	}
	
	// 선택한 구장 정보 내보내기
	public GameFieldInfoVO selectFieldData(String fieldCode,Model model) {
		return dao.selectFieldData(fieldCode);
	}
	
	// 구장 삭제
	public void deleteSelectField(String fieldCode) {
		dao.deleteSelectField(fieldCode);
	}
	// 구장이 삭제될 때 게임 리스트테이블에서도 삭제
	public void deleteSelectFieldInGamelist(String fieldCode) {
		dao.deleteSelectFieldInGamelist(fieldCode);
	}
	
	// 이미지 내보내기
	public String selectFieldImage(String fieldCode,Model model) {
		return dao.selectFieldImage(fieldCode) ;
	}
	
	// 구장정보 수정
	public void modifyFieldUpdate(GameFieldInfoVO gfvo) {
		dao.modifyField(gfvo); 
	}
	// 구장정보가 수정될 때 게임신청테이블 같이 수정
	public void modifyGameListUpdate(GlistVO gvo) {
		dao.modifyGamelist(gvo); 
	}
	// 구장정보가 수정될 때 에약테이블 같이 수정
	public void modifyFieldReservationUpdate(FieldReservationVO fvo) {
		dao.modifyReservation(fvo); 
	}
	
	// --------------------- 구장 추가 -------------------------
	
	public void insertFieldInfo(GameFieldInfoVO vo) {
		dao.insertFieldInfo(vo);
	}
	
	// ----------------------- 구장 예약 관리 --------------------
	// 구장예약현황 type 이 G이고, state가 '예약완료'인 list출력)
	public List<FieldReservationVO> GFieldReservationList() {
		return dao.GFieldReservationList();
	}
	
	// 구장예약 취소 예약완료->예약취소로 바꾸기
	public void updateFieldReservation(String gameCode) {
		dao.updateFieldReservation(gameCode);
	}
	
	public void deleteFieldGamelist(String gameCode) {
		dao.deleteFieldGamelist(gameCode);
	}
	
	public List<FieldReservationVO> GCancelList() {
		return dao.GCancelList();
	}
	
	// ------------------------ 결제 내역 관리 ----------------------
	
	public List<FieldReservationVO> FieldReservationListAll() {
		return dao.FieldReservationListAll();
	}
	
	public List<FieldReservationVO> FieldRefundListAll() {
		return dao.FieldRefundListAll();
	}
	
	public String selectRvType(String rvCode) {
		return dao.selectRvType(rvCode);
	}
	
	public String selectGameCode(String rvCode) {
		return dao.selectGameCode(rvCode);
		
	}
	
	public String selectTeamCode(String rvCode) {
		return dao.selectTeamCode(rvCode);
	}
	
	public void TeamFieldReservationCancelUpdate(DataVO dvo) {
		 dao.TeamFieldReservationCancelUpdate(dvo);
	}
	
	public void payCancelUpdate(String rvCode) {
		dao.payCancelUpdate(rvCode);
	}
	
	public void GameSignUpCancelUpdate(String rvCode) {
		dao.GameSignUpCancelUpdate(rvCode);
	}

	public void TGRCancelUpdate(String gameCode) {
		dao.TGRCancelUpdate(gameCode);
		
	}




	
	
}
