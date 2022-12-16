<%@page import="com.sample.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String authority = null;
	if(session.getAttribute("sessionVO") != null) {
		UserVO uvo = (UserVO)session.getAttribute("sessionVO");
		authority = uvo.getUserAuthority();
		
	}else {
		authority = "일반회원";
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이지풋볼 / 랭킹시스템 소개</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
<style>
    * {
        box-sizing: border-box;
        margin: 0px;
        font-family: 'Noto Sans KR', sans-serif;
    }
    
    
    .container {
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
        padding-top: 20px;
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
    .main_logo{
        background: url("${pageContext.request.contextPath}/image/ez_logo1.svg") no-repeat center;
        background-size: 95px 35px;
    	cursor: pointer;
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

.main_title{
	display: block;
	width: 100%;
	padding: 10px 0;
	margin-bottom: 15px;
	opacity: 0.8;
}

.main_title2{
	display: block;
	width: 100%;
	padding: 10px 0;
 	margin: 30px 0;
 	opacity: 0.8;
}

#main_container {
    display: flex;
    width: 100%;
    height: 100%;
    justify-content: center;
/*     background-color: #ccc; */
}

.main_area {
	display:flex;
    width: 1024px;
/*     background-color: #ffaaaa; */
/*     justify-content: space-evenly; */
/*     align-items: center; */
    flex-wrap: wrap;
/*     border: 1px solid black; */
}

.main_content1 {
	width: 100%;
	/* height: 98%; */
/* 	height:500px; */
/* 	background-color: #fff; */
}

.main_content2 {
/* 	display: flex; */
	width: 100%;
	/* height: 98%; */
/*  	background-color: #eee; */
	padding: 85px 0px 0px 165px;
/*  	flex-direction: column; */
/*     justify-content: space-between; */
}

.rank_box {
	width: 15%;
}

.rank_box2 {
    width: 80%;
    padding-left: 10px;
}

.rank_box2 p {
	width: 100%;
	font-size: 14px;
	font-weight:bold;
	opacity: 0.8;
}

.item_box > p {
	padding-left: 20px;
}

.item_box ul {
	list-style-type: none;
	width: 100%;
	padding: 0;
}

.item_box {
	display: flex;
    align-items: center;
/* 	border-bottom: 1px solid black; */
	padding: 20px;
	height: 150px;
	width: 100%;
}

.item_box h3 {
/* 	padding-left: 15px; */
	text-align: center;
}

.main_item1{
	width: 100%;
	font-weight: bold;
	font-size: 14px;
	opacity: 0.8;
}

.main_item1:last-child {
	margin: 0 20px;
}


.main_item2 .rank_box h3, .main_item2 .rank_box span{
	color: #008000;
}

.main_item3 .rank_box h3, .main_item3 .rank_box span {
	color: #4b89dc;
}

.main_item4 .rank_box h3, .main_item4 .rank_box span {
	color: #db4455;
}

.item_box li {
	padding: 5px 0;
}

.rank_box span{
/* 	padding-left: 15px; */
	width:100%;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	display: block;
}

.bottom_banner {
	width: 100%;
	height: 205px;
	background-color: #26A653;
	margin-top: 100px;
}

footer {
	width: 100%;
	height: 423px;
	display: flex;
	justify-content: space-evenly;
	padding: 30px;
	background-color: #2a2a2a;
	margin-top: 150px;
}

.icon_box span {
	display: block;
	margin: 3px 0;
	width: 30px;
	height: 30px;
}

.rookie {
	padding: 3px 3.9px;
	background-color: #008000;
	border-radius: 45px;
	color: #fff;
	font-weight: bold;
	font-size: 18px;
}

.amateur {
	padding: 3px 3.9px;
	background-color: #4b89dc;
	border-radius: 45px;
	color: #fff;
	font-weight: bold;
	font-size: 18px;
}

.semi_pro {
	padding: 3px 3.9px;
	background-color: #db4455;
	border-radius: 45px;
	color: #fff;
	font-weight: bold;
	font-size: 18px;
}

.footer_left {
	width: 40%;
}

.footer_right {
	width: 40%;
}

.login_icon {
	margin-left: 15px;
}

.etc_icon {
	margin-left: 10px;
}
    .header_icon {
	    text-decoration: none;
	    color: #4e4e4e;
	    font-size: 27px;
	    margin-left: 15px;
    }
</style>
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<body>
	<div class="container">
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

			</div>
		</div>
        <div id="main_container">
            <div class="main_area">
<!-- 				<div class="main_content1"> -->
					
<!-- 				</div> -->
				<div class="main_content2">
					<h1 class="main_title">랭킹시스템 소개</h1>
					
					<div class="main_item1 item_box">
						<ul>
							<li>- EZ풋볼은 소셜매치를 통해 경기한 기록을 기준으로 레이팅점수가 매겨져요.</li>
							<li>- 레이팅점수가 오르면 EZ풋볼의 랭킹도 올라가고, 플레이 수준에 따라 레벨시스템이 존재해요.</li>							
							<li>- 레벨은 루키, 아마추어, 세미프로로 나뉘며 각각 3개의 단계로 이루어져 있어요.</li>
							<li>- 나의 컨디션이나 참가자들의 성향, 경기 중 발생하는 불규칙성 등에 따라 언제든 레벨이 달라질 수 있어요.</li>
							<li>- EZ풋볼은 정확한 레벨을 위해 여러 경기를 지켜보고 레벨을 부여해요. 매치에 자주 참여할수록 레벨은 정확해질거에요.</li>
														
						</ul>
<!-- 						<ul><h4>ex)</h4> -->
<!-- 							<li>승리시 10점, 패배시 -5점</li> -->
<!-- 							<li>골 3점, 어시스트 1점</li> -->
<!-- 							<li>반칙 -1점</li> -->
<!-- 						</ul> -->
					</div>
					<h1 class="main_title2">레벨시스템</h1>
					<div class="main_item2 item_box">
<!-- 						<iconify-icon icon='emojione-monotone:letter-r' style='color: #008000;' width='30' height='30'></iconify-icon> -->
						<div class="icon_box">
							<span class="rookie">R1</span>
							<span class="rookie">R2</span>
							<span class="rookie">R3</span>
						</div>
						<div class="rank_box">
							<h3>루키</h3>
							<span>(Rookie)</span>
<!-- 							<span>(루키1, 루키2, 루키3)</span> -->
						</div>
						<div class="rank_box2">
							<p>루키는 풋살 경험이 적거나 볼 컨트롤, 패스, 드리블이 아직 투박하거나 체력이 부족해요! </p>
						</div>
					</div>
					<div class="main_item3 item_box">
<!-- 						<iconify-icon icon='emojione-monotone:letter-a' style='color: #4b89dc' width='30' height='30'></iconify-icon> -->
						<div class="icon_box">
							<span class="amateur">A1</span>
							<span class="amateur">A2</span>
							<span class="amateur">A3</span>
						</div>
						
						<div class="rank_box">
							<h3>아마추어</h3>
							<span>(Amateur)</span>
<!-- 							<span>(아마추어1, 아마추어2, 아마추어3)</span> -->
						</div>
						<div class="rank_box2">
							<p>아마추어는 기본기를 가졌어요! 압박이 없는 상황에서 볼 컨트롤, 패스, 드리블이 안정적이에요.</p>
						</div>
					</div>
					<div class="main_item4 item_box">
<!-- 						<iconify-icon icon='emojione-monotone:letter-s' style='color: #db4455' width='30' height='30'></iconify-icon> -->
						<div class="icon_box">
							<span class="semi_pro">S1</span>
							<span class="semi_pro">S2</span>
							<span class="semi_pro">S3</span>
						</div>
						<div class="rank_box">
							<h3>세미프로</h3>
							<span>(Semi_pro)</span>
<!-- 							<span>(세미프로1, 세미프로2, 세미프로3)</span> -->
						</div>
						<div class="rank_box2">
							<p>세미프로는 쉽게 볼을 빼앗기지 않고 압박이 있는 상황에서도 패스와 드리블이 유연하고,<br>공격과 수비가 모두 안정적이에요.</p>
						</div>
					</div>
				</div>
            </div>
        </div>

		
        
    <footer>
        <jsp:include page="../etc/footer.jsp"></jsp:include>
    </footer>
		<script type="text/javascript">
            let main_logo = document.querySelector(".main_logo");
            
            main_logo.addEventListener("click",function() {
                location.href="${pageContext.request.contextPath}";
            });
        </script>

	</div>
</body>
</html>