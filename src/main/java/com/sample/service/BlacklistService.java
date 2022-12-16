package com.sample.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.BlacklistDAO;
import com.sample.dao.UserDAO;
import com.sample.vo.BlacklistCommentVO;
import com.sample.vo.BlacklistPageVO;
import com.sample.vo.BlacklistVO;
import com.sample.vo.Criteria;
import com.sample.vo.ReviewCommentVO;
import com.sample.vo.UserVO;



@Service
public class BlacklistService {
	
	private BlacklistDAO blackDAO;
	private UserDAO userDAO;

	public BlacklistService(BlacklistDAO blackDAO, UserDAO userDAO) {
		super();
		this.blackDAO = blackDAO;
		this.userDAO = userDAO;
	}

	 /* 게시판 목록(페이징 적용) */
    public List<BlacklistVO> getListPaging(Criteria cri) {
        
        return blackDAO.getListPaging(cri);
    }    
    
    public int getTotal() {
        return blackDAO.getTotal();
    }    
 
	
	public void getBlackList(Model model) {
		BlacklistPageVO vo = new BlacklistPageVO();
		vo.setStart(0);
		vo.setCntPerPage(15);
		model.addAttribute("list", blackDAO.selectBlackList(vo));
		
	}
	
	public void serachBlackList(Model model) {
		BlacklistPageVO vo = new BlacklistPageVO();
		vo.setStart(0);
		vo.setCntPerPage(15);
		model.addAttribute("list", blackDAO.searchBlackList(vo));
		
	}   
	
	public void getBlackListContent(Model model, String blacklistCode) {
		model.addAttribute("BlacklistVO", blackDAO.selectBlackListdetail(blacklistCode));
	}
	
	
	public boolean setBlackList(BlacklistVO vo) {

		int blackcount = blackDAO.blackCheck(vo);
		
		if(0 == blackcount){
			blackDAO.insertBlackList(vo);
			return true;
		}
		return false;
	}

	public void getcode(Model model, UserVO vo) {
		model.addAttribute("code", blackDAO.codelist(vo));
	}
	
	public boolean editBlackList(BlacklistVO vo) {
		
		int blackcount = blackDAO.blackCheck(vo);
		if(0 == blackcount){
		 blackDAO.updateBlackList(vo);
		 return true;
		}
		return false;
	}
	
	public boolean deleteBlackList(BlacklistVO vo) {
		return (blackDAO.deleteBlackList(vo)>0)?true:false;
	}
	
	public boolean adduserBlack(BlacklistVO vo) {
		return (blackDAO.adduserBlack(vo)>0)?true:false;
	}
	
	public boolean deleteuserBlack(BlacklistVO vo) {
		return (blackDAO.deleteuserBlack(vo)>0)?true:false;
	}
	
	
	public List<BlacklistCommentVO> getCommentList(int blackCode) {
		return blackDAO.selectBlackListComment(blackCode);
	}
	
	public Map<String, Object> setBlacklistComment(BlacklistCommentVO vo) {
		Map<String, Object> map = new HashMap<String,Object>();
		int a = blackDAO.insertBlackListComment(vo);
		if(a>0) {
			map.put("state", "ok");
			/* map.put("vo", blackDAO.selectComment(vo)); */
		}else {
			map.put("state", "error");
		}
		return map;
	}
	
	public Map<String, String> editBlackListComment(BlacklistCommentVO vo) {
		 Map<String, String> map = new HashMap<String,String>();
		 try {
			 blackDAO.updateBlackListComment(vo);
			 map.put("state", "ok");        
	      } catch (Exception e) {
	       e.printStackTrace();
	       map.put("state", "error");
	      }
	    return map;
		
	}
	
	public Map<String, String> deleteBlackListComment(BlacklistCommentVO vo) {
		Map<String, String> map = new HashMap<String,String>();
		try {
		   blackDAO.deleteBlackListComment(vo);
		   map.put("state", "ok");        
	      } catch (Exception e) {
	       e.printStackTrace();
	       map.put("state", "error");
	      }
		  return map;
		}
	
	
	
	
	
}
