package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sample.vo.BlacklistVO;
import com.sample.vo.Criteria;
import com.sample.vo.UserVO;
import com.sample.vo.BlacklistCommentVO;
import com.sample.vo.BlacklistPageVO;

@Mapper
public interface BlacklistDAO {
	
	//블랙
	public List<UserVO> codelist(UserVO vo);
	
	//페이지 VIEW
	public List<BlacklistVO> selectBlackList(BlacklistPageVO vo);
	
	//페이지 VIEW 검색
	public List<BlacklistVO> searchBlackList(BlacklistPageVO vo);
	
	//상세 페이지 view
	public BlacklistVO selectBlackListdetail(String blacklistCode);
	
	//게시판 view(페이징)
	public List<BlacklistVO> getListPaging(Criteria cri);
	
	//게시판 총 갯수
	public int getTotal();
	
	//블랙리스트 중복 등록 방지
	public int blackCheck(BlacklistVO vo);
	
	//게시판 insert
	public int insertBlackList(BlacklistVO vo);
	
	//게시판 update
	public int updateBlackList(BlacklistVO vo);
	
	//게시판 블랙유저 user_info에 추가
	public int adduserBlack(BlacklistVO vo);
	
	//게시판 블랙유저 user_info에서 삭제
	public int deleteuserBlack(BlacklistVO vo);
	
	//게시판 블랙유저 코드 가져오기
	public int selectBlackuserCode(BlacklistVO vo);
	
	//게시판 delete
	public int deleteBlackList(BlacklistVO vo);
	
	//게시판 댓글 view
	public List<BlacklistCommentVO>selectBlackListComment(@Param("blackCode") int blackCode);
	
	//게시판 댓글 삽입
	public int insertBlackListComment(BlacklistCommentVO vo);
	
	//게시판 댓글 보이기
	public List<BlacklistCommentVO> selectComment(BlacklistCommentVO vo);
	
	
	
	
	//게시판 댓글 update
	public int updateBlackListComment(BlacklistCommentVO vo);
		
	//게시판 댓글 delete
	public int deleteBlackListComment(BlacklistCommentVO vo);
}
