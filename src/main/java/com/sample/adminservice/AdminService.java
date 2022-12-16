package com.sample.adminservice;


import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.AdminDAO;
import com.sample.vo.BlacklistPageVO;
import com.sample.vo.BlacklistVO;
import com.sample.vo.DataVO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GameResultVO;
import com.sample.vo.GlistVO;
import com.sample.vo.ReviewCommentVO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;
@Service
public class AdminService {

   private AdminDAO dao;

   public AdminService(AdminDAO dao) {
      super();
      this.dao = dao;
   }
   
   //취소신청
   public int refundsub() {
	   return dao.refundsub();
   }
   
   //신청관리
   public List<GlistVO> allgame(){
      return dao.allgame();
   }
   public List<UserVO> alluser(){
      return dao.alluser();
   }
   public List<FieldReservationVO> stgame(){
      return dao.stgame();
   }
   public List<FieldReservationVO> sgame(){
      return dao.sgame();
   }
   public List<FieldReservationVO> cgame(){
      return dao.cgame();
   }
   public List<Integer> teamcode(){
      return dao.teamcode();
   }
   
 //경기관리
 	public List<GameFieldInfoVO> allfield(){
 		return dao.allfield();
 	}
 	public List<GameResultVO> result(){
 		return dao.result();
 	}
 	
	// 랭킹관리
	public List<UinVO> rankall() {
		return dao.rankall();
	}
   
   
   public List<FieldReservationVO> Tgame(){
      return dao.Tgame();
   }
   
   public List<FieldReservationVO> joinList(){
      return dao.joinList();
   }
   
   // 팀 예약현황 조건부 리스트 출력
   public List<FieldReservationVO> joinList1(FieldReservationVO vo){
      
      List<FieldReservationVO> list = dao.joinList1(vo);

      return list;
   }
   
   // 팀 예약현황 삭제 로직
	public void TdeleteG(int gameCode) {
		dao.TdeleteG(gameCode);
	}
	
	public void TdeleteF(FieldReservationVO vo) {
		dao.TdeleteF(vo);
	}
	public void TupdateF(int gameCode) {
		dao.TupdateF(gameCode);
	}
	
	//팀 예약 취소 현황 출력
	  public List<FieldReservationVO> joinList2(){
	      return dao.joinList2();
	   }
	  public List<FieldReservationVO> joinList3(FieldReservationVO vo){
	      
	      List<FieldReservationVO> list = dao.joinList3(vo);

	      return list;
	   }
   
   
   //유저관리 - 유저리스트 출력
   public List<UserVO> UInfoList(){
	   return dao.UInfoList();
   }
   
   public List<UserVO> UInfoList1(UserVO vo){
	   return dao.UInfoList1(vo);
   }
   
   public List<UserVO> UInfoListB(){
	   return dao.UInfoListB();
   }
   public List<UserVO> UInfoListB1(UserVO vo){
	   return dao.UInfoListB1(vo);
   }
   public void UUInfoList(int userCode) {
	   dao.UUInfoList(userCode);
   }
   public void RUInfoList(int userCode) {
	   dao.RUInfoList(userCode);
   }
   // 블랙리스트 추가시 변경되야할 기능들
   public void UpdateFRstate(int userCode) {
	   dao.UpdateFRstate(userCode);
   }
   
   public void UpdateGLPnum(int userCode) {
	   dao.UpdateGLPnum(userCode);
   }
   public void UpdateGLClose(int userCode) {
	   dao.UpdateGLClose(userCode);
   }
   
   public void DeleteGSList(int userCode) {
	   dao.DeleteGSList(userCode);
   }
   public void DeleteGR(int userCode) {
	   dao.DeleteGR(userCode);
   }
   

   public List<ReviewCommentVO> reviewCommentList(){
      return dao.reviewCommentList();
   }
   
   public List<ReviewCommentVO> selectCommentList(ReviewCommentVO vo){
      
      List<ReviewCommentVO> list = dao.reviewselect(vo);

      return list;
   }
   
 //리뷰 삭제
   public void deletereview(int reviewCode) {
	   dao.deletereviewComment(reviewCode);
   }
   
   public void getBlackList(Model model) {
		BlacklistPageVO vo = new BlacklistPageVO();
		vo.setStart(0);
		vo.setCntPerPage(15);
		model.addAttribute("list", dao.selectBlackList(vo));
	}
   
   // 블랙리스트 예약현황 조건부 리스트 출력
   public List<BlacklistVO> joinblackList(BlacklistVO vo){
      
      List<BlacklistVO> list = dao.joinblackList(vo);

      return list;
   }
   
   
   //블랙리스트 삭제
   public void deleteblacklist(int blacklistCode) {
	   dao.delBlackList(blacklistCode);
   }
   
   
   //블랙유저 명단 가져오기
   public List<BlacklistVO> getBlackUser() {
	  return dao.selectBlackUser();
   }
   
   //블랙유저 추가
   public void addBlacklist(int userCode){
	   dao.blackuserCheck(userCode);
   }
   
   //블랙유저 해제
   public void clearBlacklist(int userCode){
	   dao.blackuserClear(userCode);
   }
   
}