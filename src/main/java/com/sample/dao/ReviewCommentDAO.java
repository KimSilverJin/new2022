package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.sample.vo.BlacklistPageVO;
import com.sample.vo.Criteria;
import com.sample.vo.ReviewCommentVO;
import com.sample.vo.ReviewPageVO;

@Mapper
public interface ReviewCommentDAO {
	public List<ReviewCommentVO> selectCommentList();
	
	public List<ReviewCommentVO> CommentList();
	
	/* 댓글 페이징 */
	public List<ReviewCommentVO> getCommentList(Criteria cri);
	
	/* 댓글 총 갯수(페이징) */
	public int getCommentListTotal(int reviewCode);	
	
	/* 댓글 페이징 */
	public ReviewPageVO reviewList(Criteria cri);
	
	public int insertComment(ReviewCommentVO vo);
	
	public int updateComment(ReviewCommentVO vo);

	public int deleteComment(ReviewCommentVO vo);

	public ReviewCommentVO selectComment(ReviewCommentVO vo);
}
