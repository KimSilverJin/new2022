<%@page import="com.sample.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
<title>이지풋볼</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/image/ez_icon.svg">
<script
	src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
<script src="https://kit.fontawesome.com/3a7191171a.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<style>
* {
	box-sizing: border-box;
	margin: 0px;
	font-family: 'Noto Sans KR', sans-serif;
}

body {
	margin: 0 auto;
}

.containersetbbs {
	margin: 0 auto;
    display: grid;
    grid-template-columns: 12vh 1fr 12vh;
    grid-template-rows: 3vh 11vh 1vh 1vh 1vh 60vh 5vh;
    gap: 10px 10px;
    grid-auto-flow: row;
    grid-template-areas:
        ". . ."
        ". header ."
        ". . ."
        ". popup ."
        ". . ."
        ". main ."
        ". footer .";
    height: 90vh;
}

.popup{
	grid-area: popup;
	display: grid;
	grid-template-columns: 130px 1fr;
	grid-template-rows: 30px 30px;
	align-items: center;
	gap: 10px;

}

#div1 {
	font-family: 'Gowun Dodum', sans-serif;
	background-color: white;
	margin: 0 auto;
	width: 50%;
	margin-top: 3%;
	border-radius: 15px;
	border: 3px solid rgb(38, 166, 83);
}

.header {
	grid-area: header;
	display: grid;
	grid-template-columns: 130px 1fr;
	grid-template-rows: 30px 30px;
	align-items: center;
	gap: 10px;
}

.header h4 {
	margin: 10px;
}

.main {
	grid-area: main;
	display: flex;
}

textarea {
	flex: 1;
	width: 100%;
	margin-top: 3vh;
	height: 54vh;
	background-color: #f9f9f9;
	border: 1px solid #e5e5e5;
	border-radius: 3px;
	-webkit-transition: 0.35s ease-in-out;
	-moz-transition: 0.35s ease-in-out;
	-o-transition: 0.35s ease-in-out;
	transition: 0.35s ease-in-out;
	transition: all 0.35s ease-in-out;
	resize: none;
	font-family: 'Gowun Dodum', sans-serif;
}

.footer {
	grid-area: footer;
	display: block;
	flex-direction: row-reverse;
}

input {
	width: 100%;
	padding: 1%;
	line-height: 1.4;
	background-color: #f9f9f9;
	border: 1px solid #e5e5e5;
	border-radius: 3px;
	-webkit-transition: 0.35s ease-in-out;
	-moz-transition: 0.35s ease-in-out;
	-o-transition: 0.35s ease-in-out;
	transition: 0.35s ease-in-out;
	transition: all 0.35s ease-in-out;
	margin-top: 5px;
}

select {
	width: 100%;
	padding: 1%;
	line-height: 1.4;
	background-color: #f9f9f9;
	border: 1px solid #e5e5e5;
	border-radius: 3px;
	-webkit-transition: 0.35s ease-in-out;
	-moz-transition: 0.35s ease-in-out;
	-o-transition: 0.35s ease-in-out;
	transition: 0.35s ease-in-out;
	transition: all 0.35s ease-in-out;
	margin-bottom: 5px;
	font-family: 'Gowun Dodum', sans-serif;
}

button {
	width: 60px;
	border: 1px solid white;
	height: 30px;
	border-radius: 6px;
	font-family: 'Gowun Dodum', sans-serif;
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
	width: 95px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.main_logo {
	background: url("${pageContext.request.contextPath}/image/ez_logo1.svg")
		no-repeat center;
	background-size: 95px 35px;
	cursor: pointer;
}

.ez_icon {
	width: 65px;
	height: 35px;
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
	margin-bottom: 13px;
	margin-top: 20px;
}

.big_menu_content {
	height: 100%;
	justify-content: flex-start;
	align-items: center;
}

.big_menu_content a {
	font-size: 17px;
	text-decoration: none;
	color: black;
	align-items: center;
	display: flex;
	width: 85px;
	justify-content: center;
}

.menu1, .menu2, .menu3, .menu4, .menu5, .menu6 {
	width: 100px;
	justify-content: center;
	display: inline-block;
}

.menu6_a {
	font-weight: bold;
	padding-bottom: 5px;
	border-bottom: 3px solid #26A653;
}

.menu2_a {
	width: 80px !important;
}

.menu4 {
	width: 82px;
}

.menu4_a {
	width: 70px !important;
}

.menu6 {
	margin-left: 10px;
}

.banner_container {
	max-width: 1024px;
	width: 1024px;
	display: flex;
	justify-content: center;
	/*         background-color: #fafafa; */
	overflow: hidden;
}

.banner_content_area {
	display: flex;
	justify-content: center;
	align-items: center;
	white-space: nowrap;
	width: 100%;
	height: 100%;
	transition: all 0.5s;
}

.banner_content {
	width: 100%;
	height: 100%;
}

.banner_image {
	width: 100%;
	height: 90%;
	border-radius: 35px;
}

.match_list_container {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
}

.match_menu_area {
	width: 1024px;
	max-width: 1024px;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.match_menu_content {
	width: 100%;
	height: 100%;
	flex-direction: column;
	display: flex;
	align-items: center;
}

.bottom_banner {
	width: 100%;
	height: 235px;
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
}

.footer_subcon {
	max-width: 1024px;
}

.footer_left {
	width: 100%;
}

.footer_left .footer_nav {
	display: flex;
}

.footer_nav ul {
	list-style-type: none;
	line-height: 200%;
}

.footer_nav ul h3 {
	color: rgba(255, 255, 255, 0.649);
}

.footer_nav ul li {
	color: rgba(255, 255, 255, 0.348)
}

.footer_right {
	width: 30%;
	padding-top: 14px;
}

.footer_com {
	line-height: 150%;
}

.footer_com h2 {
	color: rgba(255, 255, 255, 0.649);
	border-bottom: 3px solid #26A653;
	width: 32%;
}

.footer_com p {
	color: rgba(255, 255, 255, 0.348);
}

.managermove a {
	color: white;
	text-decoration: none;
}

.login_icon {
	margin-left: 15px;
}

.etc_icon {
	margin-left: 10px;
}

.page_container {
	position: relative;
	display: grid;
	height: 100%;
	max-height: 100%;
	cursor: default;
	max-width: 1200px;
	margin-bottom: 50px;
}

.pagination_controller {
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: space-between;
	padding: 0 1rem;
	width: 135px;
	height: 36px;
	font-size: .875rem;
	color: #fff;
	border-radius: 20px;
	background-color: rgba(0, 0, 0, .5);
}

.index_num {
	margin-right: auto;
}

.control_wrapper {
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 50px;
}

.control_previous_button, .control_play_pause_button,
	.control_next_button {
	padding: 0;
	background: none;
	border: 0;
	color: #fff;
	cursor: pointer;
}

.control_play_pause_button {
	display: flex;
	align-items: center;
	max-height: 10px;
}

.fa-pause {
	display: block;
	font-size: 12px;
}

.fa-play {
	display: none;
}

.header_icon {
	text-decoration: none;
	color: #4e4e4e;
	font-size: 27px;
	margin-left: 15px;
}

.comentbox {
	border-bottom: 1px solid #26A653;
	border-left: 20px solid #26A653;
	margin-bottom: 20px;
	padding: 22px;
	display: flex;
	justify-content: space-between;
}

.rightbox {
	display: flex;
}

.namebox {
	font-size: 12px;
	font-weight: bold;
}

.coment {
	font-size: 20px;
	font-weight: bold;
	letter-spacing: 1.5px;
}

.time {
	font-size: 11px;
	color: #ABABAB;
	display: flex;
	align-items: center;
	padding-right: 20px;
}

.just {
	display: flex;
	align-items: center;
}

.updatebtn {
	font-size: 13px;
	font-weight: bold;
	background: none;
	border: none;
	padding-right: 20px;
}

.deletebtn {
	font-size: 13px;
	font-weight: bold;
	background: none;
	border: none;
}

#input {
	display: flex;
}


*{margin:0; padding:0;}
a{text-decoration:none;}
.wrap{padding:10px;}

.btn_open{font-weight:bold; margin:5px; padding:4px 6px; background:rgb(38, 166, 83); color:#fff; width:170px; height:30px; border-radius: 5px;}
.pop_wrap{position:fixed; top:0; left:0; right:0; bottom:0; font-size:0; text-align:center;}
.pop_wrap:after{display:inline-block; height:100%; vertical-align:middle; content:'';}
.pop_wrap .pop_inner{display:inline-block; padding:20px 30px; background:#fff; width:250px; vertical-align:middle; font-size:15px;}

</style>
</head>
<body>
	<div class="container">
		<div class="header_container">
			<div class="header_area">
				<div class="header_content">
					<div class="header_left main_logo"></div>
					<div class="header_right login_btn etc_btn">
						<div class="search_input_area">
							<jsp:include page="../search/search.jsp"></jsp:include>
							<!--                   <input type="text" class="search_input"> -->
							<iconify-icon class="glass" icon="fa6-solid:magnifying-glass"></iconify-icon>
						</div>
						<div class="adminMove">
							<% if(authority.equals("관리자")){ %>
							<a class="header_icon admin_btn"
								href="${pageContext.request.contextPath}/admin/admin"><iconify-icon
									icon="clarity:administrator-solid"></iconify-icon></a>
							<%}else if(authority.equals("매니저")){%>
							<a class="header_icon manager_btn"
								href="${pageContext.request.contextPath}/manager/manager"><iconify-icon
									icon="clarity:administrator-solid"></iconify-icon></a>
							<%} %>
						</div>

						<div class="login_icon">
							<a href="${pageContext.request.contextPath}/loginPage/login">
								<!--                      <iconify-icon icon="akar-icons:person"></iconify-icon> -->
								<svg width="25" height="28" viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg">
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
							<a href="${pageContext.request.contextPath}/etc/etc"> <svg
									width="28" height="28" viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg">
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
							<a class="header_icon logout_btn"
								href="${pageContext.request.contextPath}/loginPage/logout">
								<iconify-icon icon="codicon:sign-out"></iconify-icon>
							</a>
						</div>
						<%} %>
					</div>
				</div>
			</div>
		</div>
		<div class="big_menu_container">
			<div class="big_menu_area">
				<div class="big_menu_content">
					<div class="menu menu1">
						<a class="menu1_a" href="${pageContext.request.contextPath}/home">소셜
							매치</a>
					</div>
					<div class="menu menu2">
						<a class="menu2_a"
							href="${pageContext.request.contextPath}/team/team">팀 매치</a>
					</div>
					<div class="menu menu3">
						<a class="menu3_a"
							href="${pageContext.request.contextPath}/rental/rental">구장 예약</a>
					</div>
					<div class="menu menu4">
						<a class="menu4_a"
							href="${pageContext.request.contextPath}/rank/rank">랭킹</a>
					</div>
					<div class="menu menu5">
						<a class="menu5_a"
							href="${pageContext.request.contextPath}/review/reviewmain">커뮤니티</a>
					</div>
					<div class="menu menu6">
						<a class="menu6_a"
							href="${pageContext.request.contextPath}/blacklist/blacklistmain">블랙리스트</a>
					</div>
				</div>
			</div>
		</div>


		<!-- 		<div class="pagination-area"> -->
		<!-- 			<div class="page_container"> -->
		<!-- 				<div class="pagination_controller"> -->
		<!-- 					<div class="index_num"> -->
		<!-- 						<span class="current_index">1</span> <span class="total_count">/ -->
		<!-- 							2</span> -->
		<!-- 					</div> -->
		<!-- 					<div class="control_wrapper"> -->
		<!-- 						<button class="control_previous_button e_previous_banner"> -->
		<!-- 							<i class="fa-solid fa-angle-left"></i> -->
		<!-- 						</button> -->

		<!-- 						<button type="button" -->
		<!-- 							class="control_play_pause_button e_play_pause_swiper"> -->
		<!-- 							<svg class="fa-pause" width="14px" height="14px" -->
		<!-- 								enable-background="new 0 0 155.3 159.3" -->
		<!-- 								viewBox="0 0 155.3 159.3" xmlns="http://www.w3.org/2000/svg"> -->
		<!-- 								<path fill="#ffffff" -->
		<!-- 									d="m62 135.3h-13.3c-1.9 0-3.4-1.5-3.4-3.4v-104.6c0-1.9 1.5-3.4 3.4-3.4h13.3c1.9 0 3.4 1.5 3.4 3.4v104.7c-.1 1.8-1.6 3.3-3.4 3.3z"></path> -->
		<!-- 								<path fill="#ffffff" -->
		<!-- 									d="m106.6 135.3h-13.3c-1.9 0-3.4-1.5-3.4-3.4v-104.6c0-1.9 1.5-3.4 3.4-3.4h13.3c1.9 0 3.4 1.5 3.4 3.4v104.7c0 1.8-1.5 3.3-3.4 3.3z"></path></svg> -->
		<!-- 							<i class="fas fa-play"></i> -->
		<!-- 						</button> -->

		<!-- 						<button type="button" class="control_next_button e_next_banner"> -->
		<!-- 							<i class="fa-solid fa-angle-right"> </i> -->
		<!-- 						</button> -->
		<!-- 					</div> -->
		<!-- 				</div> -->
		<!-- 			</div> -->
		<!-- 		</div> -->

		<script>

let button_flag = true;
var time_out;

let page_num = document.querySelector(".current_index");
            
let pause_btn = document.querySelector(".fa-pause");
let play_btn = document.querySelector(".fa-play");

  // translate 먹일곳
  let top_banner = document.querySelector('.banner_content_area');
  let top_btn_right = document.querySelector(".e_next_banner");
  let top_btn_left = document.querySelector(".e_previous_banner");
  let slide_photo_cnt = document.querySelectorAll(".banner_image").length;

  // 최상단 디브
  let slider_area = document.querySelector(".banner_container");

  var slider_width = slider_area.clientWidth; // container의 width
  var slide_index = 0;

  let top_pagination_btn = document.getElementsByClassName("swiper_pagination_bullet");
  let more_pagination_btn = document.getElementsByClassName("pagination_bullet");


  top_btn_right.addEventListener("click", function () {
    clearTimeout(time_out);
    console.log("right:"+slide_index);
    if (slide_index > 0 && slide_index < slide_photo_cnt) {
      top_banner.style.transform = 'translate(' + (-(1024 * (slide_index - 1))) + 'px)';


      // slide_index++;
    } else {
      top_banner.style.transform = 'translateX(0vw)';
      slide_index = 0;
    }
    show_slides();
  })

  top_btn_left.addEventListener("click", function () {
    pause_btn.style.display = "none";
    play_btn.style.display = "block";

    button_flag = false;
    clearTimeout(time_out);
    console.log("left:"+slide_index);

    if (slide_index > 1 && slide_index <= slide_photo_cnt) {
      top_banner.style.transform = 'translateX(' + (-1024 * (slide_index - 2)) + 'px)';
      slide_index--;

      console.log("if");

    } else {
      top_banner.style.transform = 'translateX(' + (-1024 * (slide_photo_cnt - 1)) + 'px)';

      slide_index = slide_photo_cnt;
      console.log("else");
    }
    
    page_num.innerHTML = slide_index;
    console.log(slide_index);

   })


              // Top banner pagination bar

              pause_btn.addEventListener("click", function () {
                pause_btn.style.display = "none";
                play_btn.style.display = "block";

                button_flag = false;
                clearTimeout(time_out);
              });

              play_btn.addEventListener("click", function () {
                pause_btn.style.display = "block";
                play_btn.style.display = "none";

                button_flag = true;
                show_slides();
              });


              show_slides();


              function show_slides() {
                slide_index++;
            
                top_banner.style.transform = 'translate(' + (-(1024 * (slide_index - 1))) + 'px';
                console.log(slide_index);

                page_num.innerHTML = slide_index;

                if (slide_index === slide_photo_cnt) {  
                slide_index = 0;

                }

                if (button_flag == true) {
                  time_out = setTimeout(show_slides, 5000);
                  
                }

              }
   
</script>


		<div id="div1">
			<form:form modelAttribute="BlacklistVO"
				action="${pageContext.request.contextPath}/blacklist/blacklistmain/setbbs"
				method="post">
				<div class="containersetbbs">
					<div class="header">
						<h4>지역 :</h4>
						<form:select path="blacklistLocal">
							<form:options items="${blacklistLocal}" />
						</form:select>
						<h4>제목 :</h4>
						<form:input path="blacklistTitle" placeholder="제목을 입력해 주세요" />
						<h4>신고유저코드 :</h4>
						<form:input path="blackuserCode" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
							placeholder="신고할 유저코드를 입력해 주세요(숫자만 입력가능합니다)" class="code" />
						
						</div>
						<div class ="popup">
						<a href="#pop_info_1" class="btn_open">최근 매칭 유저 찾기</a>
						</div>	
					<div class="main">
						<form:textarea path="blacklistContent"
							placeholder="신고할 내용을 입력해 주세요" />
					</div>
					<div class="footer">
   						<button id="fotbtn">전송</button>	
					</div>
				

  <div id="pop_info_1" class="pop_wrap" style="display:none;">
    <div class="pop_inner">
    	<c:forEach var="vo" items="${code}">
				<p ><span class="ppp">${vo.userCode}</span> : ${vo.userName}</p>
		</c:forEach>
      <button type="button" class="btn_close">닫기</button>
    </div>
  </div>

				
				</div>

			</form:form>

		</div>
		<div class="bottom_banner">
			<div class="banner_area">
				<img
					src="${pageContext.request.contextPath}/image/index_bottom_banner.png">
			</div>
		</div>
		<footer>
			<jsp:include page="../etc/footer.jsp"></jsp:include>
		</footer>
	</div>
	<script type="text/javascript">
	var target = document.querySelectorAll('.btn_open');
	var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
	var targetID;

	// 팝업 열기
	for(var i = 0; i < target.length; i++){
	  target[i].addEventListener('click', function(){
	    targetID = this.getAttribute('href');
	    document.querySelector(targetID).style.display = 'block';
	  });
	}

	// 팝업 닫기
	for(var j = 0; j < target.length; j++){
	  btnPopClose[j].addEventListener('click', function(){
	    this.parentNode.parentNode.style.display = 'none';
	  });
	}
	
	
	
	$('.ppp').click(function(){
		$('.code').val($(this).text());
		$('#pop_info_1').hide();
	});
	
	
	

	
	let main_logo = document.querySelector(".main_logo");
	
	main_logo.addEventListener("click",function() {
		location.href="${pageContext.request.contextPath}";
	});
</script>

	<script type="text/javascript">
	$('#blackuserCode').val("");
</script>



</body>
</html>