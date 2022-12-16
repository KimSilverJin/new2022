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
<title>My Page</title>
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
    .header_icon {
	    text-decoration: none;
	    color: #4e4e4e;
	    font-size: 27px;
	    margin-left: 15px;
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
	background: url("${pageContext.request.contextPath}/image/myPageTitle.jpg") no-repeat;
	background-size: contain;
	padding: 10px 0;
	text-indent: -9999px;
}

#main_container {
    display: flex;
    width: 100%;
    height: 100%;
    justify-content: center;
/*     background-color: #ccc; */
}

.main_area {
    display: flex;
    width: 1024px;
    justify-content: space-evenly;
    align-items: flex-start;
    flex-wrap: wrap;
    margin-top: 75px;
}

.main_content1 {
	display: flex;
    flex-direction: column;
    width: 35%;
}

.main_content2 {
    width: 60%;
    background-color: #fff;
    padding: 0px 0px 0px 45px;
}

.main_content2 h3 {
	margin-bottom:15px;
	color: #2c2c2c;
}

.main_left1 {
	width: 100%;
    height: 35%;
    padding: 20px 0px 30px 20px;
    border-radius: 15px;
    box-shadow: 6px 6px 20px 0px #00000010;
}

#user_info > ul {
	list-style-type: none;
	padding: 0;
}

#user_info > ul > li{
    padding: 11px 0;
    display: flex;
    align-items: flex-start;
}
.info_margin {
	margin-bottom:7px;
}
.name_area {
    display: flex;
    flex-direction: column;
    margin: 5px 15px 0px 15px;
}

.email_area {
    padding-top: 5px;
    font-size: 19px;
    color: #26a653;
    padding-left: 35px;
    font-weight: bold;
}



.info_bold {
    font-weight: bold;
    margin: 0px 0px 0px 15px;
    width: 60px;
}
.info_small_size {
	font-size: 14px;
}

.email_font {
    color: #959595;
    margin-top: 5px;
    margin-left: 1px;
}



.main_left2 {
    width: 100%;
    height: 65%;
    border-top: none;
    border-radius: 0 0 15px 15px;
    font-size: 15px;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 340px;
}

.main_right1 {
	width: 100%;
	height: 62%;
	padding: 15px;
	border-radius: 15px 15px 0 0;
	font-size: 18px;
	padding-top: 0px;
}

.main_right2 {
	width: 100%;
	height: 38%;
	padding: 15px;
	border-top: none;
	border-radius: 0 0 15px 15px;
	font-size: 18px;	
}

.main_right3 {
	width: 100%;
    height: 38%;
    padding: 15px;
    border-top: none;
    border-radius: 0 0 15px 15px;
    font-size: 18px;
}

.name1 {
	display: inline-block;
}

.main_left2 > ul{
    list-style-type: none;
    padding: 0;
    margin: 15px 0;
    height: 100%;
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
    width: 90%;
}

.main_left2 > ul > li {
	color: #929292;
	font-size: 11px;
}

.main_left2 > ul > li > a {
	display: inline-block;
    text-decoration: none;
    border-radius: 20px;
    color: #929292;
    text-align: center;
    width: 100%;
    height: 100%;
    font-size: 13px;
}

.main_right1 > ul, .main_right2 > ul, .main_right3 > ul{
    list-style-type: none;
    padding: 0;
    margin: 10px 0;
    height: 90%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    border: 1px solid #d5d5d5;
    border-radius: 20px;
    overflow: hidden;
}

.main_right1 > ul > li, .main_right2 > ul > li, .main_right3 > ul > li {
	font-size: 16px;
    justify-content: center;
    display: flex;
    align-items: center;
    cursor: pointer;
    
}
.main_right1 > ul > li > div {
	cursor: pointer;
}

.main_right1 > ul > li:hover, .main_right2 > ul > li:hover, .main_right3 > ul > li:hover {
	background-color:#d6d6d6;
	font-weight: bold;
} 

.main_right1 > ul > li:hover div span, .main_right2 > ul > li:hover a, .main_right3 > ul > li:hover a{
	color:white;
}

.main_right1 > ul > li:hover .right_btn, .main_right2 > ul > li:hover .right_btn, .main_right3 > ul > li:hover .right_btn {
	padding-left:15px;
} 

.main_right1 > ul > li:hover div span, .main_right2 > ul > li:hover a, .main_right3 > ul > li:hover a{
	color:white;
}


.border_div {
	border-bottom: 1px solid #d6d6d6;
    width: 90%;
}
.no_border_div {
    width: 90%;
}

/* .main_right1 > ul > li > a, .main_right2 > ul > li > a { */
/* 	display:inline-block; */
/* 	text-decoration: none; */
/* 	border-radius: 20px; */
/* 	color: #000; */
/* 	width: 100%; */
/* 	height: 100%; */
/* 	padding: 20px 0; */
/* } */


.bottom_banner {
        width:100%;
        height:235px;
        background-color: #26A653;
    	margin-top: 100px;
    	display: flex;
    	justify-content: center;
    	align-items: center;
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
.right_btn {
    display: inline-block;
    text-decoration: none;
    border-radius: 20px;
    color: #4e4e4e;
    width: 100%;
    height: 100%;
    padding: 20px 10px;
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
		</div>
        <div id="main_container">
            <div class="main_area">
<!-- 			<h1 class="main_title">나의 EZ</h1> -->
			
				<div class="main_content1">
					<section class="main_left1">
						<div id="user_info">
							<ul>
								<li class="info_margin"><img src="${pageContext.request.contextPath}/image/profile_photo.png">
									<div class="name_area">
										<h3 class="name1">${userVO.userName }</h3>
										<span class="info_small_size email_font">${userVO.userEmail1}${userVO.userEmail2}</span>
									</div>
									<span class="email_area">#${userVO.userCode}</span>
								</li>
<%-- 								<li>주소 : ${userVO.userLocal }</li> --%>
								<li><span class="info_bold">Team</span> <span class="info_small_size">${uinVO.userGroup }</span></li>
								<li><span class="info_bold">랭크</span>  <span class="info_small_size">${uinVO.userLevel }</span></li>
								<li><span class="info_bold">승률</span> <span class="info_small_size"><fmt:formatNumber value="${(userVO.userWin/(userVO.userWin+userVO.userLose))*100}" pattern=".0"/>%&nbsp;<span>(${userVO.userWin}승 ${userVO.userLose}패)</span></span></li>
							</ul>
						</div>
					</section>
					<section class="main_left2">
						<div class="left2_image_area">
							<img src="${pageContext.request.contextPath}/image/EZ_image.png">
						</div>
						<ul>
							<li><a href="${pageContext.request.contextPath}/loginPage/logout">로그아웃</a></li>
							<li>|</li>
							<li><a href="${pageContext.request.contextPath}/myPage/notice">공지사항</a></li>
							<li>|</li>
							<li><a href="${pageContext.request.contextPath}/myPage/rankGuide">랭킹소개</a></li>
							<li>|</li>
							<li><a href="${pageContext.request.contextPath}/myPage/guide1">소셜가이드</a></li>
						</ul>
					</section>
				</div>
				<div class="main_content2">
					<section class="main_right1">
						<h3>팀 설정</h3>
						<ul>
							<li><div class="border_div"> <span id="MTbtn2" class="right_btn">소속 팀 정보</span></div></li>
							<li><div class="no_border_div"><span id="MTbtn" class="right_btn">팀 수정 및 삭제</span></div></li>
						</ul>
					</section>
					<section class="main_right2">
						<h3>예약 내역</h3>
						<ul>
							<li><div class="border_div"><a class="right_btn" href="${pageContext.request.contextPath}/myPage/matchList">경기내역</a></div></li>
							<li><div class="no_border_div"><a class="right_btn" href="${pageContext.request.contextPath}/myPage/rentalList">구장예약 내역</a></div></li>
						</ul>
					</section>
					<section class="main_right3">
						<h3>내 정보</h3>
						<ul>
							<li><div class="border_div"><a class="right_btn" href="${pageContext.request.contextPath}/myPage/changeinfo">내 정보 수정</a></div></li>
							<li><div class="border_div"><a class="right_btn" href="${pageContext.request.contextPath}/myPage/changePw">비밀번호 변경</a></div></li>
							<li><div class="border_div"><a class="right_btn" href="${pageContext.request.contextPath}/myPage/inquiry">내 문의</a></div></li>							
							<li><div class="no_border_div"><a class="right_btn" href="${pageContext.request.contextPath}/myPage/manager">매니저 지원</a></div></li>
<!-- 							<li><a href="#" class="qna">자주 묻는 질문 (Q&A)</a></li> -->
						</ul>
					</section>
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
         <script type="text/javascript">
         console.log(${userVO.teamCode});
        document.getElementById("MTbtn").addEventListener("click",function(){
        	if(${userVO.teamCode == 0} || ${userVO.teamCode} == null){
        		alert("팀이 존재하지 않습니다");
        	}else{
        		location.href = "${pageContext.request.contextPath}/team/teamDetailInfo";
        	}
        });
        
        document.getElementById("MTbtn2").addEventListener("click",function(){
        	if(${userVO.teamCode == 0} || ${userVO.teamCode} == null){
        		alert("팀이 존재하지 않습니다");
        	}else{
        		location.href = "${pageContext.request.contextPath}/team/teaminfo";
        	}
        });
        </script>
        
        <script type="text/javascript">
        $('.qna').click(function(e){
        	e.preventDefault();
        	alert("준비중입니다.");
        });
        </script>
	</div>
</body>
</html>