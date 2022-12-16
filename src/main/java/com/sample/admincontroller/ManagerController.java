package com.sample.admincontroller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.adminservice.AdminService;
import com.sample.adminservice.GameService;
import com.sample.adminservice.RanService;
import com.sample.adminservice.SubService;
import com.sample.vo.DataVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GameResultVO;
import com.sample.vo.GlistVO;
import com.sample.vo.ManagerVO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	private AdminService service;
	private SubService subservice;
	private RanService ranservice;
	private GameService gaservice;

    public ManagerController(AdminService service, SubService subservice, RanService ranservice,
            GameService gaservice) {
        super();
        this.service = service;
        this.subservice = subservice;
        this.ranservice = ranservice;
        this.gaservice = gaservice;
    }


    @GetMapping("/manager")
	public String manager(HttpServletRequest request,HttpSession session) {
		// (모든경기)
        session.setAttribute("gamelist", service.allgame());
        // 모든 유저 정보
        session.setAttribute("userlist", service.alluser());
        // st 신청정보
        session.setAttribute("stgamelist", service.stgame());
        // s 신청정보
        session.setAttribute("sgamelist", service.sgame());
        // 취소된 신청
        session.setAttribute("cgamelist", service.cgame());
        // 모든 팀 코드
        session.setAttribute("tcodelist", service.teamcode());
        // 모든 경기장 정보
        session.setAttribute("allfield", service.allfield());
        // 경기결과 정보
        session.setAttribute("result", service.result());
        // 랭킹정보
        session.setAttribute("rankall", service.rankall());

		String page = request.getParameter("page");
		if(page == null) {
			page = "ranking";
		}
		
		if(page.equals("ranking")) {
			request.setAttribute("page","ranking");
		}else if(page.equals("subMain")) {
			request.setAttribute("page", "subMain");
		}else if(page.equals("gameMain")) {
			request.setAttribute("page", "gameMain");
		}
		
		String subPage = request.getParameter("subPage");
		
		if(subPage == null) {
			subPage = "sub1";
		}
		
		if(subPage.equals("sub1")) {
			request.setAttribute("subPage","sub1");
		}else if(subPage.equals("sub2")) {
			request.setAttribute("subPage", "sub2");
		}else if(subPage.equals("sub3")) {
			request.setAttribute("subPage", "sub3");
		}
		
		String gamePage = request.getParameter("gamePage");
		
		if(gamePage == null) {
			gamePage = "game1";
		}
		
		if(gamePage.equals("game1")) {
			request.setAttribute("gamePage","game1");
		}else if(gamePage.equals("game2")) {
			request.setAttribute("gamePage", "game2");
		}else if(gamePage.equals("game3")) {
			request.setAttribute("gamePage", "game3");
		}
		
		String rankPage = request.getParameter("rankPage");
		
		if(rankPage == null) {
			rankPage = "rank1";
		}
		
		if(rankPage.equals("rank1")) {
			request.setAttribute("rankPage","rank1");
		}

		return "managerPage/managerMain";
	}
	

    @GetMapping("tdel")
    public String tdelete(@RequestParam("rvCode") int[] rvCode,@RequestParam("teamCode") int[] teamCode,
                        @RequestParam("gameCode") int[] gameCode,HttpSession session) {
        System.out.println("팀삭제");
        for(int i=0; i<teamCode.length; i++) {
            System.out.println("여긴");
            DataVO vo = new DataVO();
            
            vo.setTeamCode(teamCode[i]);
            vo.setGameCode(gameCode[i]);
            subservice.delete(vo);
            subservice.tdelete(vo);
            subservice.delupdate(gameCode[i]);
        }
        
        return "redirect:/manager/manager";
    }
    
    @GetMapping("sdel")
    public String sdelete(@RequestParam("rvCode") int[] rvCode,@RequestParam("userCode") int[] userCode,
            @RequestParam("gameCode") int[] gameCode,HttpSession session) {
        System.out.println("삭제");
        for(int i=0; i<rvCode.length; i++) {
            System.out.println(rvCode[i]);
            subservice.rdelete(rvCode[i]);
        }
        for(int i=0; i<userCode.length; i++) {
            System.out.println("여긴");
            DataVO vo = new DataVO();
            
            vo.setUserCode(userCode[i]);
            vo.setGameCode(gameCode[i]);
            subservice.sdelete(vo);
            subservice.delupdate(gameCode[i]);
        }
        
        return "redirect:/manager/manager";
    }
    
    @GetMapping("/sadd")
    public String add(HttpSession session,@RequestParam("userCode") int userCode, @RequestParam("gameCode") int gameCode) {
        System.out.println("추가컨트롤러");
        GlistVO vo = new GlistVO();
        vo = subservice.all(gameCode);
        vo.setUserCode(userCode);
        vo.setTeamCode(0);
        subservice.add(vo);
        subservice.slistadd(vo);
        subservice.supdate(gameCode);
        subservice.newresult(vo);
        return "redirect:/manager/manager";
    }
    
    @GetMapping("/tadd")
    public String tadd(HttpSession session,@RequestParam("teamCode") int teamCode, @RequestParam("gameCode") int gameCode) {
        System.out.println("추가컨트롤러");
        List<Integer> ucList = new ArrayList<Integer>();
        ucList = subservice.usercode(teamCode);
        for(int i=0; i<ucList.size(); i++) {
            GlistVO vo = new GlistVO();
            vo = subservice.all(gameCode);
            vo.setTeamCode(teamCode);
            vo.setUserCode(ucList.get(i));
            subservice.tadd(vo);
            subservice.newresult(vo);
        }
        
        GlistVO vo = new GlistVO();
        vo.setGameCode(gameCode);
        vo.setTeamCode(teamCode);
        subservice.tlistadd(vo);
        subservice.tupdate(gameCode);
        return "redirect:/manager/manager";
    }

    @PostMapping("/update")
    public String update (@RequestParam("plus")String plus,@RequestParam("minus")String minus,
                      @RequestParam("userLevel")String userLevel,@RequestParam("ty")String usercode,
                      HttpSession session) {
       UinVO vo = new UinVO();
       int code = Integer.parseInt(usercode);
       vo.setUserCode(code);
       if(plus.equals("0")) {
          int num = Integer.parseInt(minus);
          vo.setUserScore(num);
          ranservice.minus(vo);
       }else if (minus.equals("0")) {
          int num = Integer.parseInt(plus);
          vo.setUserScore(num);
          ranservice.plus(vo);
       }
       vo.setUserLevel(userLevel);
       ranservice.level(vo);
       return "redirect:/manager/manager";
    }
	
    @PostMapping("/sadd")
    public String sadd(HttpSession session, GlistVO vo) {
        GameFieldInfoVO gvo = gaservice.fieldinfo(vo.getFieldCode());
        vo.setFieldAddress(gvo.getFieldAddress());
        vo.setFieldName(gvo.getFieldName());
        vo.setGameMacth(gvo.getFieldType());
        gaservice.sadd(vo);
        return "redirect:/manager/manager";
    }
    
    @PostMapping("/tadd")
    public String tadd(HttpSession session, GlistVO vo) {
        GameFieldInfoVO gvo = gaservice.fieldinfo(vo.getFieldCode());
        vo.setFieldAddress(gvo.getFieldAddress());
        vo.setFieldName(gvo.getFieldName());
        vo.setGameMacth(gvo.getFieldType());
        gaservice.tadd(vo);
        return "redirect:/manager/manager";
    }
    
    @GetMapping("/del")
    public String del(@RequestParam("gameCode") int[] gameCode,HttpSession session) {
        for(int i=0; i<gameCode.length;i++) {
            gaservice.del(gameCode[i]);
        }
        return "redirect:/manager/manager?page=gameMain";
    }
    
    @PostMapping("/gupdate")
    public String update(GlistVO vo,HttpSession session) {
        gaservice.update(vo);
        return "redirect:/manager/manager";
    }
    
    @GetMapping("rdel")
    public String rdel(@RequestParam("resultCode")int[] resultCode,HttpSession session) {
        System.out.println("삭제");
        for(int i=0; i< resultCode.length; i++) {
            gaservice.rdel(resultCode[i]);
        }
        return "redirect:/manager/manager";
    }
    
    @PostMapping("radd")
    public String rup(GameResultVO vo,HttpSession session,String ty) {
        if(vo.getUserCode()==0) {
            vo.setGameType("T");
            if(ty.equals("add")) {
                List<Integer> mList = gaservice.teamlist(vo.getTeamCode());
                for(int i =0; i<mList.size(); i++) {
                    vo.setUserCode(mList.get(i));
                    gaservice.radd(vo);
                }
                
            }else {
                gaservice.rup(vo);
            }
        }else {
            vo.setGameType("S");
            if(ty.equals("add")) {
                gaservice.radd(vo);
            }else {
                gaservice.rup(vo);
            }
        }
        
        return "redirect:/manager/manager";
    }
    
    @GetMapping("/newgame")
    public String newgame(HttpSession session) {
        UserVO uvo = new UserVO();
        uvo = (UserVO)session.getAttribute("sessionVO");
        int fieldcode = gaservice.getcode(uvo.getUserCode());
        GameFieldInfoVO fvo = gaservice.getfieldinfo(fieldcode);
        
        LocalDate now = LocalDate.now();
        int year = now.getYear();
        int today = now.getDayOfMonth();
        int month = now.getMonthValue();
        
        String dateset ="";
        if(month == 12) {
            dateset = year + "-" + (01) + "-" +today;
        }else {
            dateset = year + "-" + (month+1) + "-" +today;
        }
        LocalDate day = LocalDate.parse(dateset);
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        
        LocalDate first = day.withDayOfMonth(1);
        
        for(int j=1; j<=day.lengthOfMonth(); j++) {
            String setday = day.withDayOfMonth(j).format(formatter);
            GlistVO vo = new GlistVO();
            vo.setFieldName(fvo.getFieldName());
            vo.setFieldAddress(fvo.getFieldAddress());
            vo.setFieldCode(fvo.getFieldCode());
            vo.setGameDay(setday); // 받아온날
            vo.setGamePlace(fvo.getGamePlace());
            vo.setGameMacth(fvo.getFieldType());
            if(fvo.getFieldType().equals("5vs5")) {
                vo.setGameMinp(10);
                vo.setGameMaxp(15);
            }else {
                vo.setGameMinp(12);
                vo.setGameMaxp(18);
            }
            vo.setGameMag(uvo.getUserName());
            vo.setGameMagcode(uvo.getUserCode());
            gaservice.newgame(vo);
           
        }
   
        return "redirect:/manager/manager";
    }

    @PostMapping("/sociallist")
	@ResponseBody
    public List<GlistVO> sociallist (@RequestBody GlistVO vo){
    	System.out.println("컨트롤러aaaa");
    	System.out.println(vo.getGameCode());
    	return gaservice.sociallist(vo);
    }
    
    @PostMapping("/sociallistcnt")
	@ResponseBody
    public int sociallistcnt (@RequestBody GlistVO vo){
    	System.out.println("컨트롤러ssss");
    	System.out.println(vo.getGameCode());
    	return gaservice.sociallistcnt(vo);
    }
    
    @GetMapping("/returnpage")
    public String returmpage(HttpSession session,@RequestParam int num,@RequestParam String serch,@RequestParam String select) {
    	System.out.println("flsjx");
    	System.err.println(num);
    	System.out.println(serch);
    	System.out.println(select);
    	session.setAttribute("pagenum", num);
    	session.setAttribute("serch", serch);
    	session.setAttribute("select", select);
    	return "redirect:/manager/manager?page=gameMain";
    }
    
}