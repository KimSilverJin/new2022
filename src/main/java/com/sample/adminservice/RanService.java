package com.sample.adminservice;


import org.springframework.stereotype.Service;

import com.sample.dao.RankDAO;
import com.sample.vo.UinVO;


@Service
public class RanService {

   private RankDAO dao;
   
   public RanService(RankDAO dao) {
      super();
      this.dao = dao;
   }
   
   
   public void plus(UinVO vo) {
      System.out.println(vo.getUserScore());
      dao.plus(vo);
   }
   
   public void minus(UinVO vo) {
      dao.minus(vo);
   }
   
   public void level(UinVO vo) {
      dao.level(vo);
   }
   
}