<%@page import="com.sample.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.sample.vo.UserVO"%>
<%
	request.setCharacterEncoding("utf-8");
	UserVO uvo = null;
	String authority = null;
	
	
	if(session.getAttribute("sessionVO") != null){
		uvo = (UserVO) session.getAttribute("sessionVO");
		authority = uvo.getUserAuthority();
	}
	else {
		authority = "일반회원";
		
	}
	
%>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>팀매치 게시글 등록</title>
	<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/js/jquery-ui.css"/>
    <script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery-ui.js"></script>
 	<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
 	 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=65331bb5f71196e87528297b0af9ceb4&libraries=services"></script>
 	<style>
 	.sub_con{
		grid-area: sub;
	    justify-content: center;
    	width: 65%;
	    border-radius: 20px;
    	box-shadow: 0px 0px 20px 10px #e3e3e366;
	    padding: 60px;
	    margin-top: 30px;
	}
	/* 매치작성 제목 */
	.title{
		align-items: center;
	    color: #525252;
	    font-size: 24px;
	    font-weight: bold;
	    padding-bottom: 30px;
	}

*{
    box-sizing : border-box;
}
.container {

    box-sizing: border-box;
    display: grid;
    grid-template-columns: 1fr 2.5fr 1fr;
    grid-template-areas: '. sub .';
    justify-items: center;
    padding-bottom: 20px;
   
    
}

/* 공통 틀 css */
.subt{
    width: 100%;
    display: flex;
    flex-direction: column;
	padding-bottom: 20px;
}

.ticon{
    display: flex;
    justify-content: center;
    align-items: center;
    
}


.gicon{
    display: flex;
    justify-content: center;
    align-items: center;
    padding-left: 2%;
}
#gameGender{
     width: 25%; /* 원하는 너비설정 */
	 padding : 0 10px;
     background: url(${pageContext.request.contextPath}/image/arrow.svg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
     background-size : 25%;
     background-color : white; 
     border: 1px solid #D7D7D7;
     height : 40px;
     border-radius : 10px;
     appearance: none;
     font-size: 12px;
}

/* 매치 날짜 */
.date {
    display: flex;
    font-size: 15px;
    font-weight: bold;
    color: #525252;
    padding-bottom: 20px;
}
.dinput{
	display:flex;
	align-items: center;
	justify-content: space-between;
    width: 100%;
}
.dicon{
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0px 10px 5px 0px;
}



#txtDate{
    width: 100%;
    height: 40px;
    border-radius: 10px;
    padding-left: 15px;
    font-size: 12px;
    border : 1px solid #C0C0C0;
}
/* 매치 지역 */
.matchp{
    display: flex;
    font-size: 14px;
    font-weight: bold;
    color: #525252;
    padding-bottom: 20px;
}

.matchp p{
    font-weight: 700;
    font-size: 15px;
}
.micon{
    display: flex;
    justify-content: center;
    align-items: center;
    padding : 1%;
}

#gameplace{
     width: 25%; /* 원하는 너비설정 */
	 padding : 0 10px;
     background: url(${pageContext.request.contextPath}/image/arrow.svg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
     background-size : 25%;
     background-color : white; 
     border: 1px solid #D7D7D7;
     height : 40px;
     border-radius : 10px;
     appearance: none;
     font-size: 12px;
}

.matchp .match_place_span{
    font-size: 12px;
    color : red;
}

.ficon {
    display: flex;
    justify-content: center;
    align-items: center;
    padding : 1%;
}

.matchf_in {
    display: flex;
    justify-content:space-between;
}

.matchf_in .finput{
    width: 60%;
}

#fieldName{
    width: 78%;
    height: 40px;
    font-size:12px;
    border-radius: 10px;
    padding-left: 10px;
    border : 1px solid #C0C0C0;
}

.fbutton{
    height: 40px;
    width: 20%;
    background-color: #26a653;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 10px;
    font-size: 12px;
    color: white;
    font-weight: bold;
}

.fbutton span {
    text-decoration: none;
}

   /* 지도검색 modal창 디자인 */
    .modal22 {
    position: absolute;
    top: 0px;
    left: 0;
    width: 100%;
    height: 200%;
    display: none;
    background-color: rgba(0, 0, 0, 0.4);
}

.modal22.show {
  display: block;
}

.modal22_body22 {
  position: fixed;
  top: 50%;
  left: 50%;

  width: 1300px;
  height: 850px;

  padding: 30px;

  text-align: center;

  background-color: rgb(255, 255, 255);
  border-radius: 10px;
  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

  transform: translateX(-50%) translateY(-50%);
  overflow : hidden;
  display: flex;
  flex-direction: column;
  align-items: center;
}


.modal22_body22 span{
	background-color : #26a563;
	color : white;
	font-weight : 700;
	
}
/* #mapcontent{ */
/* 	overflow : scroll; */
/* } */


#map{
		
		width : 75vw;
		height : 50vh;
	}
	.map_search{
		width : 80%;
		height : 60px;
		display : flex;
		justify-content : space-between;
	}
	.map_search .search_area{
		width : 90%;
		
		display : flex;
		justify-content : center;
		align-items : center;
		
	}
	.map_search .search_area #search1{
	    width: 100%;
	    height: 80%;
	    border-radius: 10px;
	    padding-left: 15px;
	    border: 1px solid #8d8d8d;
	}
	.map_search .search_button{
		width : 8%;
		
		display : flex;
		justify-content : center;
		align-items : center;
		background-color : #26a563;
		height : 50px;
		margin-top : 5px;
		margin-left : 5px;
		margin-right : 5px;
		border-radius : 10px;
	}
	
	.map_search .search_button span{
		color : white;
		font-size : 20px;
		text-decoration : none;
	}
	
	

/* 경기장 시간 */
.matcht {
    display: flex;
}
.matcht p {
    font-size: 15px;
    font-weight: 700;
}


.timeicon{
    display: flex;
    justify-content: center;
    align-items: center;
    padding : 1%;
}

#gameTime{
     width: 100%; /* 원하는 너비설정 */
     padding: 0 15px;
     background: url(${pageContext.request.contextPath}/image/arrow.svg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
     background-size : 20%;
     background-color : white; 
     border: 1px solid #D7D7D7;
     height : 40px;
     border-radius : 10px;
     appearance: none;
     font-size: 12px;
     
}
.matcht .match_time_span{
    font-size: 12px;
    color : red;
}

/* 경기장 주소 */
.matchadd{
    display: flex;
    align-items:center;
    justify-content: center;
    background-color: #909090;
    color: white;
    font-size: 14px;
    font-weight: bold;
    height: 50px;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
}

.addicon{
    display: flex;
    justify-content: center;
    align-items: center;
    padding : 1%;
}

.addinput {
    width: 100%;
}

#fieldAddress{
    width: 100%;
    height: 50px;
    border: 1px solid #909090;
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
    text-align: center;
}


/* 경기장 선택시 자동완성 부분 매치방식, 매치코드, 참가비 */
.subt1{
    width: 100%;
    display: flex;
    justify-content: space-between;
    padding: 30px 0px;
}
.innersubt1{
    width: 32%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}
.matchtype{
    display: flex;
}

.matchtype p{
    font-size: 15px;
    font-weight: 700;
}

.matchicon{
    display: flex;
    justify-content: center;
    align-items: center;
    padding : 1%;
}
.typeinput{
    width: 100%;
}

#fieldAddress::placeholder{
	text-align: center;
}

.matchc{
    display: flex;
}

.matchc p{
    font-size: 15px;
    font-weight: 700;
}

.cicon{
    display: flex;
    justify-content: center;
    align-items: center;
    padding : 1%;
}
.cinput{
    width: 100%;
}

.matchpay{
    display: flex;
}

.matchpay p{
    font-size: 15px;
    font-weight: 700;
}

.payicon{
    display: flex;
    justify-content: center;
    align-items: center;
    padding : 1%;
}
.payinput{
    width: 100%;
}

/* 팀 선택 */
.team{
    display: flex;
}

.team p{
    font-size: 15px;
    font-weight: 700;
}
.team .sub_title3_span{
    font-size: 12px;
    color : red;
}
.teamicon{
    display: flex;
    justify-content: center;
    align-items: center;
    padding : 1%;
}
.innerteam{
    display: flex;
}
.teaminput {
    width: 60%;
    margin-right: 2%;
}

#mTeamName{
    width: 100%;
    height: 40px;
    background-color: #f9f9f9;
    border: 1px solid #EDEDED;
    border-bottom-right-radius: 10px;
    border-top-right-radius: 10px;
	padding-left: 15px;
}
.sbutton{
    width: 20%;
    background-color: #26a563;
    height: 40px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 12px;
    font-weight: bold;
    color: white;
    border-bottom-left-radius: 10px;
    border-top-left-radius: 10px;
    
}
.rbutton{
    width: 18%;
    background-color: #26a563;
    height: 40px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 10px;
    
}
.rbutton a{
	text-decoration:none;
	font-size: 12px;
    font-weight: bold;
    color: white;
}

.submit{
    width: 100%;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 15px;
    margin: 75px 0px 0px 0px;
}
.submit #subtn{	 
  	border: none;
    width: 100%;
    height: 100%;
    border-radius: 20px;
    font-weight: 700;
    font-size: 20px;
    background-color: #26a563;
    color: white;
    
}
.submit #subtn:hover{
  cursor : pointer;
  background-color : white;
  color : #26a563;
  border: 1px solid #26a563;
  border-radius: 20px;
}

/* 팀 검색 modal 창 */
  .modal {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 200%;
    display: none;
    background-color: rgba(0, 0, 0, 0.4);
  }

  .modal.show {
    display: block;
  }

  .modal_body {
    position: fixed;
    top: 50%;
    left: 50%;

    width: 400px;
    height: 600px;

    padding: 40px;
    
    background-color: rgb(255, 255, 255);
    border-radius: 10px;
    box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

    transform: translateX(-50%) translateY(-50%);

    display: flex;
    flex-direction: column;
    
  }
  
  .modal_body h2 {
  	color: black;
    margin-bottom: 15px;
  }
  
  .modal_inner_box{
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    margin-bottom: 15px;

  }
  .modal_inner_box input {
	height: 38px;
    margin-right: 10px;
    padding-left: 15px;
    border-radius: 10px;
    border: 1px solid #cdcdcd;
    width: 100%;
  }
  
  .modal_team_search {
  	width: 80%;
    margin-right: 10px;
  }
 
  .modal_search_button{
    background-color: #26a563;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 38px;
    border-radius: 10px;
    width: 20%;
    
  }
  
  .modal_search_button span{
  	color : white;
  	font-weight : 700;
  	text-decoration : none;
  }
  .modal_confirm{
  	background-color : black;
  	margin-left : 5px;
  	display: flex;
    justify-content : center;
    align-items : center;
  }
  
   .modal_confirm span{
   	color : white;
  	font-weight : 700;
  	text-decoration : none;
   }
   #modaldata{
   	height : 100%;
   	overflow : auto;
   	margin : 0 auto;
    width: 97%;
   	text-align: center;
   }


    
    /* 헤더 */
    .container1 {
        width: 100%;
        margin: 0 auto;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .header_container {
        width: 100%;
        height: 56px;
        display: flex;
        justify-content: center;
    }

    .header_area {
        width: 1024px;
        height: 100%;
        padding-top: 15px;
    }

    .header_content {
        display: flex;
        height: 100%;
        justify-content: space-between;
    }
    .header_left {
        width:95px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    .ez_icon {
        width: 65px;
        height:35px;
    }
    
      .search_input_area {
      	 position: relative;
      }

      .search_input {
         width: 375px;
         height: 35px;
         background-color: white;
         border: 1px solid #e5e5e5;
         border-radius: 10px;
      }
      
      .glass {
      	 font-size: 20px;
	     position: absolute;
	     right: 13px;
	     top: 8px;
	     color: #464a54;
      }
    .header_right {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .big_menu_container {
        width: 100%;
        height: 70px;
        display: flex;
        justify-content: center;
	    margin-bottom: 13px;
	    margin-top: 13px;
	    align-items: center;
        
    }
    .big_menu_area {
        max-width: 1024px;
        width: 1024px;
	    padding-top: 15px;
	    padding-bottom: 15px;
    }

    .big_menu_content {
        height: 100%;
        justify-content: flex-start;
        align-items: center;
    }

    .big_menu_content a {
        font-size: 18px;
        text-decoration: none;
        color: black;
        align-items: center;
        display: flex;
        width: 90px;
        justify-content: center;
    }
    
    .menu1,.menu2,.menu3,.menu4,.menu5,.menu6 {
        width: 100px;
        justify-content: center;
        display: inline-block;
    }
    .menu2_a {
        font-weight: bold;
        padding-bottom:5px;
        border-bottom: 3px solid #26A653;
    }
    



    .login_icon {
        margin-left:15px;
    }
    .etc_icon {
        margin-left:10px;
    }
    #uteamPay{
    width: 50%;
    height: 50px;
    border-radius: 10px;
    padding-left: 10px;
	margin-right: 10px;
    border: 1px solid #c0c0c0;
	}
	.calbox{
		display: flex;
		width: 60%;
	}
	#daybox{
		width: 32%;
	}
	.gameinfo{
    	font-size: 15px;
		font-weight: bold;
		color: #525252;
	}
	
	#adbox{
    	padding: 0px 0px 20px 0px;
	}
	
	.ntitlebox{
		display: flex;
	    align-items:center;
	    justify-content: center;
	    background-color: #909090;
	    color: white;
	    font-size: 14px;
	    font-weight: bold;
	    height: 40px;
	    border-top-left-radius: 10px;
	    border-top-right-radius: 10px;
		
	}
	.inputbbox{
		width: 100%;
	    height: 60px;
	    border: 1px solid #909090;
	    border-bottom-left-radius: 10px;
	    border-bottom-right-radius: 10px;
	    text-align: center;
	}
	.inputbbox::placeholder{
            text-align: center;
        }
    .paybox{
    	display: flex;
    	justify-content: flex-end;
    	padding-top: 20px;
    }
    .paybox span{
    	font-size: 14px;
    	font-weight: bold;
    }
    
    .bottom_banner {
        width:100%;
        height:235px;
    	margin-top: 100px;
    	display: flex;
    	justify-content: center;
    	align-items: center;
    }
    
    footer {
    	margin-top: 120px;
    }
     .header_icon {
	    text-decoration: none;
	    color: #4e4e4e;
	    font-size: 27px;
	    margin-left: 15px;
    }

 	</style>
	

</head>
<body>
<div class="container1">
    <div class="header_container">
        <div class="header_area">
            <div class="header_content">
               <div class="header_left main_logo">

               </div>
               <div class="header_right login_btn etc_btn">
                  <div class="search_input_area">
  		  			  <jsp:include page="../search/search.jsp"></jsp:include>
<!--                   <input type="text" class="search_input"> -->
	                  <iconify-icon class="glass" icon="fa6-solid:magnifying-glass"></iconify-icon>
                  </div>
                  <div class="adminMove">
                  	<% if(authority.equals("관리자")){ %>
                  		<a class="header_icon admin_btn" href="${pageContext.request.contextPath}/admin/admin"><iconify-icon icon="clarity:administrator-solid"></iconify-icon></a>
				  	<%}else if(authority.equals("매니저")){%>
				  		<a class="header_icon manager_btn" href="${pageContext.request.contextPath}/manager/manager"><iconify-icon icon="clarity:administrator-solid"></iconify-icon></a>
				  	<%} %>
                  </div>
                  
                  <div class="login_icon">
                     <a href="${pageContext.request.contextPath}/loginPage/login">
<!--                      <iconify-icon icon="akar-icons:person"></iconify-icon> -->
                        <svg width="25" height="28" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                           <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M12 2C9.23858 2 7 4.23858 7 7C7 9.76142 9.23858 12 12 12C14.7614 12 17 9.76142 17 7C17 4.23858 14.7614 2 12 2ZM9 7C9 5.34315 10.3431 4 12 4C13.6569 4 15 5.34315 15 7C15 8.65685 13.6569 10 12 10C10.3431 10 9 8.65685 9 7Z"
                              fill="#464A54" />
                           <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M12 13.5C7.5502 13.5 5.07689 15.0054 3.93312 16.0093C3.22723 16.6288 3 17.4996 3 18.2447C3 20.3187 4.68132 22 6.75534 22H17.2447C19.3187 22 21 20.3187 21 18.2447C21 17.4996 20.7728 16.6288 20.0669 16.0093C18.9231 15.0054 16.4498 13.5 12 13.5ZM5.25244 17.5124C6.03934 16.8217 8.04626 15.5 12 15.5C15.9537 15.5 17.9607 16.8217 18.7476 17.5124C18.8856 17.6335 19 17.8668 19 18.2447C19 19.2141 18.2141 20 17.2447 20H6.75534C5.78589 20 5 19.2141 5 18.2447C5 17.8668 5.11441 17.6335 5.25244 17.5124Z"
                              fill="#464A54" />
                        </svg>
                     </a>
                  </div>
                  
                  <% if(session.getAttribute("sessionVO") == null) { %>
                  <div class="etc_icon">
                     <a href="${pageContext.request.contextPath}/etc/etc">
                        <svg width="28" height="28" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                           <path
                              d="M5.5 10.5C6.32843 10.5 7 11.1716 7 12C7 12.8284 6.32843 13.5 5.5 13.5C4.67157 13.5 4 12.8284 4 12C4 11.1716 4.67157 10.5 5.5 10.5Z"
                              fill="#464A54" />
                           <path
                              d="M12 10.5C12.8284 10.5 13.5 11.1716 13.5 12C13.5 12.8284 12.8284 13.5 12 13.5C11.1716 13.5 10.5 12.8284 10.5 12C10.5 11.1716 11.1716 10.5 12 10.5Z"
                              fill="#464A54" />
                           <path
                              d="M18.5 10.5C19.3284 10.5 20 11.1716 20 12C20 12.8284 19.3284 13.5 18.5 13.5C17.6716 13.5 17 12.8284 17 12C17 11.1716 17.6716 10.5 18.5 10.5Z"
                              fill="#464A54" />
                        </svg>
                     </a>
                  </div>
                  <% } %>
                  
                  <% if(session.getAttribute("sessionVO") != null) { %>
                  <div class="logout_icon">
                     <a class="header_icon logout_btn" href="${pageContext.request.contextPath}/loginPage/logout">
						<iconify-icon icon="codicon:sign-out"></iconify-icon>
                     </a>
                  </div>
                  <%} %>
               </div>
            </div>
            <script type="text/javascript">
				if(document.querySelector(".admin_btn")){
					let admin_btn = document.querySelector(".admin_btn");
					admin_btn.addEventListener("click",function() {
	     				if(confirm("관리자 페이지로 이동 하시겠습니까?")){
	     					admin_btn.href="${pageContext.request.contextPath}/admin/admin";
	     				}else{
	     					admin_btn.href="#";
	     				}
	            	});
				}	
            
				if(document.querySelector(".manager_btn")){
					let manager_btn = document.querySelector(".manager_btn");
					manager_btn.addEventListener("click",function() {
	     				if(confirm("매니저 페이지로 이동 하시겠습니까?")){
	     					manager_btn.href="${pageContext.request.contextPath}/manager/manager";
	     				}else{
	     					manager_btn.href="#";
	     				}
	            	});
				}	
            
            
            	if(document.querySelector(".logout_btn")){
            	let logout_btn = document.querySelector(".logout_btn");

					logout_btn.addEventListener("click",function() {
	     				if(confirm("로그아웃 하시겠습니까?")){
	     					alert("로그아웃 되었습니다.");
	     					logout_btn.href="${pageContext.request.contextPath}/loginPage/logout";
	     				}else{
	     					alert("로그아웃을 취소하셨습니다.");
	     					logout_btn.href="#";
	     				}
	            	});
            	}
            </script>

         </div>
      </div>
    <div class="big_menu_container">
        <div class="big_menu_area">
            <div class="big_menu_content">
                <div class="menu menu1"><a class="menu1_a" href="${pageContext.request.contextPath}/home">소셜 매치</a></div>
                <div class="menu menu2"><a class="menu2_a" href="${pageContext.request.contextPath}/team/team">팀 매치</a></div>
                <div class="menu menu3"><a class="menu3_a" href="${pageContext.request.contextPath}/rental/rental">구장 예약</a></div>
                <div class="menu menu4"><a class="menu4_a" href="${pageContext.request.contextPath}/rank/rank">랭킹</a></div>
                <div class="menu menu5"><a class="menu5_a" href="${pageContext.request.contextPath}/review/reviewmain">커뮤니티</a></div>
                <div class="menu menu6"><a class="menu5_a" href="${pageContext.request.contextPath}/blacklist/blacklistmain">블랙리스트</a></div>
            </div>
        </div>
    </div>
     <div class="container">
    	
        <div class="sub_con">
        <form name="form1" action="${pageContext.request.contextPath }/team/postingFinish" method="post">
        	<div class="title">
	            <p>매치 작성하기</p>
        	</div>
        	<div class="subt">
		    		<div class="option">
		                <select name="gameGender" id="gameGender">
		                    <option style="color:gray" value="">매치 성별</option>
		                    <option value="남">남성</option>
		                    <option value="여">여성</option>
		                    <option value="혼성">혼성</option>
		                </select>
		            </div>
        	</div>
        	
        
      	<div class="subt">
       		<div class="matchp">
            	<p>경기장소</p>
       		</div>
            <div class="option">
                <select name="gamePlace" id="gameplace">
                    <option value="">매치지역</option>
                    <option value="서울">서울</option>
                    <option value="인천">인천</option>
                    <option value="경기도">경기도</option>
                    <option value="충청도">충청도</option>
                    <option value="강원도">강원도</option>
                    <option value="경상도">경상도</option>
                    <option value="전라도">전라도</option>
                    <option value="제주도">제주도</option>
                </select>
            </div>
         </div>
         
        <div class="subt">
                <div class="matchf_in">
                <input type="text" name="fieldName" id="fieldName" placeholder="경기장" autocomplete="off"  readonly>
                    <div class="modal22">
				      <div class="modal22_body22"><strong style="font-size : 30px">지도 검색하기</strong>
				      
				      	<div class="map_search">
				      	
				      		
							<div class="search_area">
								<input type="text" name="search" id="search1" placeholder="구장주소의 지역이름을 정확히 입력해주세요. ex) 전라도,경상도,서울" />
							</div>
							<div class="search_button">
								<span id="searcha">검색</span>
							</div>
							
							<div class="search_button">
								<span  id="mapclose">닫기</span>
							</div>
						</div>
						<div id="map" class="gamefield_picture mapview"></div>
						<div id="maparea"></div>
						<div id="mapcontent"></div>
				      </div>
				    </div>
				    <div class="fbutton">
				    <span class="btn-open-popup22">지도 검색</span>
					</div>
					
                   <script type="text/javascript">
	           		// 엔터키 활성화
	           		let search1 = document.getElementById("search1");
	           		let search_btn = document.getElementById("searcha");
	           		
	           		search1.addEventListener("keyup", function (e) {
	           	        if (e.keyCode === 13) {
	           	            e.preventDefault();
	           	            search_btn.click();
	           	        }
	           	    });
                   
                    document.getElementById("searcha").addEventListener("click", function(){
                        			const address = document.getElementById("search1").value;
                        			const fieldName = document.getElementById("fieldName");
                        			const fieldAddress = document.getElementById("fieldAddress");
                        			const fieldCode = document.getElementById("fieldCode");
                        			const gamePay = document.getElementById("gamePay");
                        			const gameMacth = document.getElementById("gameMacth");
                        			const comdiv = document.getElementById("mapcontent");
                        	
                        		
                        			const simple_data = {address};
                        			
                        			$.ajax({
                        				url : "${pageContext.request.contextPath}/team/getMap",
                        				type : "POST",
                        				contentType:"application/json; charset=utf-8",
                        				dataType : "json",
                        				data : JSON.stringify(simple_data),
                        				success : function(data){
                        					
                        					comdiv.innerHTML = "";
                        					for(const comment of data){

                        		
                        						const div = document.createElement("div");
     
                        						div.style.border = "1px solid black";
                        						div.style.width = "800px";
                        						div.style.margin = "0 auto";
                        						div.addEventListener("click",function(){
                        							
                        							fieldName.value = comment.fieldName; 
                        							fieldAddress.value = comment.fieldAddress;
                        							
                        							document.getElementById("txtDate").value ="";
                        							document.getElementById("gameTime").value ="";
                        							
                        							
                        							fieldCode.value = comment.fieldCode;
                        							gamePay.value = comment.fieldRentalfee;
                        							gameMacth.value = comment.fieldType;
                        							
                        							
                        							modal2.classList.remove('show');
                        							body.style.overflow="scroll";
                        						});
                        						const h4 = document.createElement("h4");
                        						h4.innerText = "구장이름 : "+comment.fieldName;
                        						const p = document.createElement("p");
                        						p.innerText = "구장주소 : "+comment.fieldAddress;
                        						const a = document.createElement("a");
                        						a.innerText = "선택";
                        						a.style.color = "#ff6262";
                        						
                        						
                        						div.append(h4);
                        						div.append(p);
                        						div.append(a);
                        						comdiv.append(div);
                        						 
                        						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                        					      mapOption = {
                        					         
                        					          center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                        					          level: 3 // 지도의 확대 레벨
                        					      };  

                        					     // 지도를 생성합니다    
                        					     var map = new kakao.maps.Map(mapContainer, mapOption);
                        					     
                        					     
                        					     // 주소-좌표 변환 객체를 생성합니다
                        					     var geocoder = new kakao.maps.services.Geocoder();
                        					     
                        					     // 주소로 좌표를 검색합니다
                        					     geocoder.addressSearch(comment.fieldAddress, function(result, status) {
                        					     
                        					         // 정상적으로 검색이 완료됐으면 
                        					          if (status === kakao.maps.services.Status.OK) {
                        					     
                        					             var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                        					     
                        					             // 결과값으로 받은 위치를 마커로 표시합니다
                        					             var marker = new kakao.maps.Marker({
                        					                 map: map,
                        					                 position: coords
                        					             });
                        					     
                        					             // 인포윈도우로 장소에 대한 설명을 표시합니다
                        					             var infowindow = new kakao.maps.InfoWindow({
                        					                 content: '<div style="width:150px;text-align:center;">'+comment.fieldName+'</div>'
                        					             });
                        					             infowindow.open(map, marker);
                        					     
                        					             // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                        					             map.setCenter(coords);
                        					         } 
                        					     });   
                        					}

                        				},
                        				error : function(e){
                        					alert(e);
                        				}
                        			});
                        			
                        		});
             
                    </script>
           			
           
                </div>
            
        </div>
        
        <div class="subt">
            <div class="date">
                <p>경기 날짜</p>
            </div>
            <div class="dinput">
            	<div class="calbox">
            	<span class="dicon"><iconify-icon icon="ic:round-date-range" style="color: #26a653;"  width="30" height="30"></iconify-icon></span>
            	<input type="text" name="gameDay" id="txtDate" class="gameDay" placeholder="더블클릭" autocomplete="off"  readonly>
            	</div>
            	<div class="option" id="daybox">
                <select name="gameTime" id="gameTime">
                    <option value="">경기 시작 시간</option>
                    <option id="reservation1" value="08:00:00">AM8</option>
                    <option id="reservation2" value="10:00:00">AM10</option>
                    <option id="reservation3" value="12:00:00">PM12</option>
                    <option id="reservation4" value="14:00:00">PM2</option>
                    <option id="reservation5" value="16:00:00">PM4</option>
                    <option id="reservation6" value="18:00:00">PM6</option>
                    <option id="reservation7" value="20:00:00">PM8</option>
                    <option id="reservation8" value="22:00:00">PM10</option>
                </select>
            	</div>
            
            <script type="text/javascript">
            	
            document.getElementById("gameTime").addEventListener("click",function(){
            	
            			let res1 = document.getElementById("reservation1").value;
            			let res2 = document.getElementById("reservation2").value;
            			let res3 = document.getElementById("reservation3").value;
            			let res4 = document.getElementById("reservation4").value;
            			let res5 = document.getElementById("reservation5").value;
            			let res6 = document.getElementById("reservation6").value;
            			let res7 = document.getElementById("reservation7").value;
            			let res8 = document.getElementById("reservation8").value;
            			
//                     	let gameTime = document.getElementById("gameTime");
                    	let fieldName = document.getElementById("fieldName").value;
                    	let gameDay = document.getElementById("txtDate").value;
                    	
                    	console.log(fieldName);
            			console.log(gameDay);
            			const simple_data = {gameDay, fieldName};
            			
            			
            			console.log("11111111111111");
            			$.ajax({
            				url : "${pageContext.request.contextPath}/team/timeListR",
            				type : "POST",
            				contentType:"application/json; charset=utf-8",
            				dataType : "json",
            	 			data : JSON.stringify(simple_data),
            				success : function(data){
            					console.log(data);
            					console.log("2222222222222")
            					
            				
            					for(let comment of data){
            						if(fieldName == comment.fieldName && 
            							res1 == comment.gameTime &&
            							gameDay == comment.gameDay &&
            							(comment.gameType == 'S' || comment.gameType =='T')){
            							
            							document.getElementById("reservation1").style.display = "none";
            							}
            						else if(fieldName == comment.fieldName && 
                							res2 == comment.gameTime &&
                							gameDay == comment.gameDay &&
                							(comment.gameType == 'S' || comment.gameType =='T')){
                							
            							document.getElementById("reservation2").style.display = "none";
                							}
            						else if(fieldName == comment.fieldName && 
                							res3 == comment.gameTime &&
                							gameDay == comment.gameDay &&
                							(comment.gameType == 'S' || comment.gameType =='T')){
                							
            							document.getElementById("reservation3").style.display = "none";
                							}
            						else if(fieldName == comment.fieldName && 
                							res4 == comment.gameTime &&
                							gameDay == comment.gameDay &&
                							(comment.gameType == 'S' || comment.gameType =='T')){
                							
            							document.getElementById("reservation4").style.display = "none";
                							}
            						else if(fieldName == comment.fieldName && 
                							res5 == comment.gameTime &&
                							gameDay == comment.gameDay &&
                							(comment.gameType == 'S' || comment.gameType =='T')){
                							
            							document.getElementById("reservation5").style.display = "none";
                							}
            						else if(fieldName == comment.fieldName && 
                							res6== comment.gameTime &&
                							gameDay == comment.gameDay &&
                							(comment.gameType == 'S' || comment.gameType =='T')){
                							
            							document.getElementById("reservation6").style.display = "none";
                							}
            						else if(fieldName == comment.fieldName && 
                							res7 == comment.gameTime &&
                							gameDay == comment.gameDay &&
                							(comment.gameType == 'S' || comment.gameType =='T')){
                							
            							document.getElementById("reservation7").style.display = "none";
                							}
            						else if(fieldName == comment.fieldName && 
                							res8 == comment.gameTime &&
                							gameDay == comment.gameDay &&
                							(comment.gameType == 'S' || comment.gameType =='T')){
                							
            							document.getElementById("reservation8").style.display = "none";
                							}	
            							
            				
            						}
            					},
            				
            				error : function(e){
            					alert(e);
            				}
            			});
            		});
            </script>
            </div>
      	</div>
      	
      	<div class="subt">
             <p class="gameinfo">경기 정보</p>
        </div>
      	
        <div id="adbox">
            <div class="matchadd">
                <p>경기장 주소</p>
            </div>
            <div class="addinput">
                <input type="text" name="fieldAddress" id="fieldAddress" placeholder="경기장 선택시 자동입력">
            </div>
        </div>
        
         <div class="subt1">
         	<div class="innersubt1">
	            <div class="ntitlebox">
	                <p>매치 방식</p>
	            </div>
	            <div class="typeinput">
	                <input type="text" name="gameMacth" id="gameMacth" class="inputbbox" placeholder="자동 입력"/>
	            </div>
	       </div>
	       <div class="innersubt1">
	            <div class="ntitlebox">
	                <p>경기장 코드</p>
	            </div>
	            <div class="cinput">
	                <input type="text" name="fieldCode" id="fieldCode" class="inputbbox" placeholder="자동 입력"/>
	            </div>
	       </div>
	       <div class="innersubt1">
	            <div class="ntitlebox">
	                <p>구장대여료</p>
	            </div>
	            <div class="payinput">
	                <input type="text" name="gamePay" id="gamePay" class="inputbbox" placeholder="자동 입력"/>
	            </div>
            </div> 
           
        </div>
     
        
        <div class="subt">
                <div class="innerteam">
	                  <div class="sbutton">
                        <div class="modal">
                            <div class="modal_body"><h2>팀 검색하기</h2>
                        
                                <div class="modal_inner_box">
                                	
                                    <div class="modal_team_search">
                                        <input type="text" name="modalText" id="modalText">
                                    </div>
                                    <div class="modal_search_button">
                                        <span id="modalsearchbutton"> 검색</span>
                                    </div>
                                
                                    
                                </div>
                                <div id="modaldata"></div>
                                
                                <script type="text/javascript">
                                
                                let modalText = document.getElementById("modalText");
                                let modalsearch_btn = document.getElementById("modalsearchbutton");
                                
                                modalText.addEventListener("keyup", function (e) {
            	           	        if (e.keyCode === 13) {
            	           	            e.preventDefault();
            	           	         modalsearch_btn.click();
            	           	        }
            	           	    });
                                
                                
                                document.getElementById("modalsearchbutton").addEventListener("click", function(){
                        			let teamName = document.getElementById("modalText").value;
                        			const mteamName = document.getElementById("mTeamName");
                        			let gameMacth1 = document.getElementById("gameMacth").value;
                        			let teamCode = document.getElementById("teamCode");
                        			const comdiv = document.getElementById("modaldata");
  
                        			const simple_data = {teamName};
                        		
                        			$.ajax({
                        				url : "${pageContext.request.contextPath}/team/getTeam",
                        				type : "POST",
                        				contentType:"application/json; charset=utf-8",
                        				dataType : "json",
                        				data : JSON.stringify(simple_data),
                        				success : function(data){
                        					
                        					comdiv.innerHTML="";
                        					for(let comment of data){
                        						const div = document.createElement("div");
                        						div.setAttribute("id","teamSelect");
                        						div.style.border = "1px solid #d7d7d7";
                        						div.style.width = "100%";
                        						div.style.backgroundColor = "rgb(249 249 249)";
                        						div.style.lineHeight = "28px";
                        						div.style.height= "20%";
                        						div.style.color= "#2c2c2c";
                        						div.style.marginBottom = "3px";

                        						if(gameMacth1 == "6vs6"){
														div.addEventListener("click",function(){
																if(comment.tmember6 != ''){
																	mteamName.value = comment.teamName;
																	teamCode.value = comment.teamCode;
																	body.style.overflow="scroll";
																}else {
																	alert("6vs6 경기이므로 5명팀은 참여할수없습니다.");
																	body.style.overflow="scroll";
																}
							
                        							const modal = document.querySelector('.modal');
                  							      
											        modal.classList.toggle('show');

                							        if (modal.classList.contains('show')) {
                							          body.style.overflow = 'hidden';
                        							}
														});
                        						}else if(gameMacth1 == "5vs5"){

													div.addEventListener("click",function(){
														console.log("팀선택");
															if(comment.tmember6 == ''){
															mteamName.value = comment.teamName;
															teamCode.value = comment.teamCode;
															body.style.overflow="scroll";

															}else {
															alert("5vs5 경기이므로 6명팀은 참여할수없습니다.");
															body.style.overflow="scroll";
															}
                    							const modal = document.querySelector('.modal');
              							      
										        modal.classList.toggle('show');

            							        if (modal.classList.contains('show')) {
            							          body.style.overflow = 'hidden';
                    							}
													});
                    						}else{
                    							alert("경기장을 선택해주세요");
                    							break;
                    						}						

                        						const h4 = document.createElement("h4");
                        						h4.innerText = "팀코드 :"+comment.teamCode;
                        						const p = document.createElement("p");
                        						p.innerText = "팀이름 :"+comment.teamName;
                        						const a = document.createElement("a");
                        						a.innerText = "선택";
                        						a.style.color = "#ff6262";
                        						
                        						
                        						div.append(h4);
                        						div.append(p);
                        						div.append(a);
                        						comdiv.append(div);
                        					}

                        				},
                        				error : function(e){
                        					alert(e);
                        				}
                        			});
                        			
                        		});
                                </script>
                            </div>
                        </div>
                        <span class="btn-open-popup">팀 검색</span>
                    </div>
                    <div class="teaminput">
	                	<input type="text" name="mTeamName" id="mTeamName" placeholder="팀 검색을 이용해주세요" readonly="readonly">
	                	<input type="hidden" name="teamCode" id="teamCode"/>
	                </div>
                    <div class="rbutton">
                        <a class="tbtn" id="tbt">팀 등록</a>
                    </div>
                </div>
         
        </div>
      
      	<div class="subt">
            <div class="dinput paybox">
            	 <input type="text" name="uteamPay" id="uteamPay" placeholder="우리팀이 지불할 금액"/> <span>원</span>
            </div>
      	</div>
      	
      	
        <div class="submit">
            <button type="button" id="subtn">매치 작성 완료</button>
        </div>
         
        </form>
        </div>
    </div>
   </div>
	<script type="text/javascript">
		document.getElementById("tbt").addEventListener("click",function(){
		if(${userVO.teamCode} == 0 ){
		location.href = "${pageContext.request.contextPath}/team/register"
		}else{
		alert("가입한 팀이 있습니다.");
		return;
		}
		});
	
	</script>
  
    <script type="text/javascript">
    /* 달력관련 script */
    $.datepicker.setDefaults({
    	  dateFormat: 'yy-mm-dd',
    	  prevText: '이전 달',
    	  nextText: '다음 달',
    	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    	  showMonthAfterYear: true,
    	  yearSuffix: '년'
    	});
    
    
        $(function() {
            console.log("dsjfdlsfhdslf");
            $('#txtDate').click(function(){
            	if(document.getElementById("fieldName").value == "")
            	  alert("경기장을 선택 해 주세요");
            	else{
            		$('#txtDate').datepicker({ minDate: 0});
            	}
            });
            
            
        });
   
	/* 팀 검색 modal창 script */
        const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');

      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });

      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'scroll';
          }
        }
      });
      </script>
      
      <script type="text/javascript">
      /* 지도 검색 modal창 script */
          
      const modal2 = document.querySelector('.modal22');
      const btnOpenPopup2 = document.querySelector('.btn-open-popup22');

      btnOpenPopup2.addEventListener('click', () => {
        modal2.classList.toggle('show');

        if (modal2.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });
		
      document.getElementById("mapclose").addEventListener("click",function(){
    	  modal2.classList.remove('show');
    	  body.style.overflow = "scroll";
      });
      
      
//       modal2.addEventListener('click', (event) => {
//         if (event.target === modal2) {
//           modal2.classList.toggle('show');

//           if (!modal2.classList.contains('show')) {
//             body.style.overflow = 'auto';
//           }
//         }
//       });
      
     
     
      </script>
		
      <script type="text/javascript">
		/* 지도표시 script */

      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         
          center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
          level: 3 // 지도의 확대 레벨
      };  

     // 지도를 생성합니다    
     var map = new kakao.maps.Map(mapContainer, mapOption);
     
     // 주소-좌표 변환 객체를 생성합니다
     var geocoder = new kakao.maps.services.Geocoder();
     
     // 주소로 좌표를 검색합니다
     geocoder.addressSearch('서울 금천구 가산디지털1로 151 이노플렉스 1차 3층 306호', function(result, status) {
     
         // 정상적으로 검색이 완료됐으면 
          if (status === kakao.maps.services.Status.OK) {
     
             var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
     
             // 결과값으로 받은 위치를 마커로 표시합니다
             var marker = new kakao.maps.Marker({
                 map: map,
                 position: coords
             });
     
             // 인포윈도우로 장소에 대한 설명을 표시합니다
             var infowindow = new kakao.maps.InfoWindow({
                 content: '<div style="width:150px;text-align:center;padding:6px 0;">구디아카데미</div>'
             });
             infowindow.open(map, marker);
     
             // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
             map.setCenter(coords);
         } 
     });   
     </script>
	<script type="text/javascript">
	let main_logo = document.querySelector(".main_logo");
	
	main_logo.addEventListener("click",function() {
		location.href="${pageContext.request.contextPath}";
	});
</script>


	<script type="text/javascript">
		form_post = document.form1;
		document.getElementById("subtn").addEventListener("click",function(){
			
		console.log(form_post.gameGender.value);
			
		if(form_post.gameGender.value == "" || form_post.gamePlace.value == "" || form_post.gameTime.value == "" ||
			form_post.fieldName.value == "" || form_post.fieldAddress.value == "" || form_post.gameMacth.value == "" ||
			form_post.gamePay.value == "" || form_post.fieldCode.value == "" || form_post.mTeamName.value == "" ||
			form_post.uteamPay.value == "" ){
			alert("작성하지 않은 값이 있습니다. 확인해주세요");
			return;
		}else{
			
			alert("작성완료 되었습니다.");
			form_post.submit();
		}
		});
	
	</script>
    <footer>
        <jsp:include page="../etc/footer.jsp"></jsp:include>
    </footer>


</body>
<style type="text/css">
		*{
			box-sizing : border-box;
		}
	
		.main_logo{
         background: url("${pageContext.request.contextPath}/image/ez_logo1.svg") no-repeat center;
         background-size: 95px 35px;
    	cursor: pointer;
    }	
	</style>

</html>
 

   