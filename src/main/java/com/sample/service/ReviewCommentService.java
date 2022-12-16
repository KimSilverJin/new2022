package com.sample.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.sample.dao.ReviewCommentDAO;
import com.sample.dao.UserDAO;
import com.sample.vo.Criteria;
import com.sample.vo.PageMakerVO;
import com.sample.vo.ReviewCommentVO;
import com.sample.vo.ReviewPageVO;
import com.sample.vo.UserVO;

@Service
public class ReviewCommentService {
	
	private UserDAO userDAO;
	private ReviewCommentDAO reviewCommentDAO;
	
	
	public ReviewCommentService(UserDAO userDAO, ReviewCommentDAO reviewCommentDAO) {
		super();
		this.userDAO = userDAO;
		this.reviewCommentDAO = reviewCommentDAO;
	}

	
	
	public boolean isUser(UserVO vo, HttpSession session) {
		UserVO rvo = userDAO.idPwCheck(vo);
		if(rvo != null) {
			session.setAttribute("userVO", rvo);
			return true;
		}else {
			return false;
		}
	}


	public List<ReviewCommentVO> getCommentAllList(){
		return reviewCommentDAO.selectCommentList();
	}
	
	//저장
	//스트링 스트링을 스트링 오브젝트로 변경하기
	public Map<String, Object> setComment(ReviewCommentVO vo){
		Map<String, Object> map = new HashMap<String,Object>();
		System.out.println();
		System.out.println("before : " + vo);
		int a = reviewCommentDAO.insertComment(vo);
		System.out.println("after : "+vo);
		
		if(a > 0) {
			map.put("state", "ok");
			map.put("vo", reviewCommentDAO.selectComment(vo));
			 
		}else {
			map.put("state", "error");
		}

		return map;
		//모델로 보냄
	}
	
	
	
	public Map<String, String> editComment(ReviewCommentVO vo) {
	  Map<String, String> map = new HashMap<String,String>();
	  System.out.println(vo);
	  
	  try {
		  
		  reviewCommentDAO.updateComment(vo);
        map.put("state", "ok");        
      } catch (Exception e) {
       e.printStackTrace();
       map.put("state", "error");
      }
    return map;
}
	
	

	public Map<String, String> deleteComment(ReviewCommentVO vo) {
	Map<String, String> map = new HashMap<String,String>();
	  System.out.println(vo);
	  try {
		  reviewCommentDAO.deleteComment(vo);
        map.put("state", "ok");        
      } catch (Exception e) {
       e.printStackTrace();
       map.put("state", "error");
      }
	  return map;
	}
	
	
	public ReviewPageVO recommentList(Criteria cri) {
		ReviewPageVO dto = new ReviewPageVO();
		
		dto.setList(reviewCommentDAO.getCommentList(cri));
		dto.setPageInfo(new PageMakerVO(cri, reviewCommentDAO.getCommentListTotal(cri.getReviewCode())));
		
		return dto;
	}
		
}
	


