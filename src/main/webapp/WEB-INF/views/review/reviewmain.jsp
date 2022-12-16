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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<link rel="icon"
	href="${pageContext.request.contextPath}/image/ez_icon.svg">
<script
	src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
<script src="https://kit.fontawesome.com/3a7191171a.js"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
* {
	box-sizing: border-box;
	margin: 0px;
	font-family: 'Noto Sans KR', sans-serif;
}

textarea {
	width: 100%;
	height: 150px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 2px #26A653;
	font-size: 16px;
	resize: both;
}

div{
	font-family: 'Gowun Dodum', sans-serif;
}
textarea::placeholder {
  color: #26A653;
  font-weight: bold;
  
}

#div1 {
	margin: 0 auto;
	width: 1024px;
	padding-top: 50px;
	
}

#submit{
	background-color: #26A653;
	color : white;
	border : #26A653;
	
	
}
p{
font-family: 'Gowun Dodum', sans-serif;
}

#comment {
	display: flex;
	flex-direction: column;
	font-family: 'Gowun Dodum', sans-serif;
}

#comment2 {
	display: flex;
	flex-direction: column;
	font-family: 'Gowun Dodum', sans-serif;
}


.container {
	width: 100%;
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
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

.menu5_a {
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
    	width:70px !important;
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
        }
        .footer_subcon{
            max-width: 1024px;
        }
        .footer_left {
            width:100%;
            
        }
        .footer_left .footer_nav{
            display: flex;

        }
        .footer_nav ul {
            list-style-type: none;
            line-height: 200%;
        }
        .footer_nav ul h3 {
            color : rgba(255, 255, 255, 0.649);
        }
        .footer_nav ul li{
            color :rgba(255, 255, 255, 0.348)
        }
        .footer_right {
            width:30%;
            padding-top: 14px;

        }
        .footer_com{
            line-height: 150%;
        }
        .footer_com h2{
            color : rgba(255, 255, 255, 0.649);
            border-bottom: 3px solid #26A653;
            width: 32%;
        }
        .footer_com p{
            color :rgba(255, 255, 255, 0.348);
        }
        .managermove a{
            color : white;
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
    .comentbox{
    	border-bottom: 1px solid #26A653;
    	border-left: 20px solid #26A653;
    	margin-bottom: 20px;
    	padding: 22px;
    	/* display: flex; */
    	/* justify-content: space-between; */
    }
    
    .test{
    	border-bottom: 1px solid #26A653;
    	border-left: 20px solid #26A653;
    	margin-bottom: 20px;
    	padding: 22px;
    }
    
    .test2{
    font-size: 20px;
    font-weight: bold;
    letter-spacing: 1.5px;
    margin-top: 1%;
    }
    .rightbox{
    	display: flex;
    	justify-content: flex-end;
    }
    .namebox{
    	font-size: 12px;
    	font-weight: bold;
    }
    .coment{
    	font-size: 20px;
    	font-weight: bold;
    	letter-spacing: 1.5px;
    	margin-top: 1%;
    }
    .time{
    	font-size: 11px;
    	color : #ABABAB;
    	display: flex;
        align-items: flex-end;
    	justify-content: flex-end;
  	 	 padding-right: 20px;
   		 font-size: 14px;
    }
    .just{
    display: flex;
    align-items: center;
    justify-content: flex-end;
    margin-right: 2%;
    }
    .updatebtn{
    	font-size: 13px;
    	font-weight: bold;
    	background: none;
    	border: none;
        padding-right: 20px;
    }
    .deletebtn{
    	font-size: 13px;
    	font-weight: bold;
    	background: none;
    	border: none;
    }
    #input{
    	display: flex;
    	
    }
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

		<div class="banner_container">
			<div class="banner_content_area">
				<div class="banner_content">
					<img class="banner_image" src="../image/Reviewbanner.png"
						alt=""> <img class="banner_image"
						src="../image/banner-manner_pc.png" alt="">
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
		
			<div id="input">
				<!-- 작성자 :
			<textarea name="name" id="name" cols="10" rows="3"></textarea>
			<hr /> -->

				<textarea name="content" id="content" placeholder="댓글을 입력해 주세요"><c:if
						test="${empty requestScope.userdata}">로그인이 필요합니다.</c:if></textarea>
				<button id="submit">등록</button>
			</div>
		
			<div id= "comment2"></div>
			<div id="comment"></div>
			


<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
			
			
<script type="text/javascript">
		//비로그인시 댓글 창 클릭하면 로그인 페이지로 이동

	document.getElementById("content").addEventListener("click", function(){
		//로그인 여부
		//로그인 컨트롤러에서 logincheck를 ajax로 불러옴

		$.ajax({
 			url : "${pageContext.request.contextPath}/loginPage/logincheck",
 			type : "GET",
 			contentType:"application/json; charset=utf-8",
 			dataType : "json",
 			data : JSON.stringify(),
 			success : function(data){
 
 				if(data==false){
 					Swal.fire({
 					   title: '글쓰기를 위해 로그인 해주세요!',
 					   text: '로그인 페이지로 이동하시겠습니까?',
 					   icon: 'warning',
 					   
 					   
 					   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
 					   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
 					   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
 					   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
 					   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
 					   
	 					   
 					   reverseButtons: false, // 버튼 순서 거꾸로
 					   
 					}).then(result => {
 					   // 만약 Promise리턴을 받으면,
 					   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
 					   
 						  location.href="${pageContext.request.contextPath}/loginPage/login";
 					   	  	
 					   }
 					});
 				}
			}
 		});
	});
		
		
	document.getElementById("submit").addEventListener("click", function(){
		let content = document.getElementById("content").value;
		const simple_data = {content};
		console.log(simple_data);
		//댓글 작성
		$.ajax({
			url : "${pageContext.request.contextPath}/review/comment/save",
			type : "POST",
			contentType:"application/json; charset=utf-8",
			dataType : "json",
			data : JSON.stringify(simple_data),
			/* anync : false, */
			success : function(data){
				console.log(data);
				if(data.state == "ok"){
					
					const comdiv = document.getElementById("comment2");
					
					const leftdiv = document.createElement("div");
					leftdiv.className = "leftbox";						
					const rightdiv = document.createElement("div");
					rightdiv.className = "rightbox";
					
					
					const div = document.createElement("div");
					div.className = "test";
					div.append(leftdiv);
					div.append(rightdiv);
					
					/* const div = document.createElement("div");
					div.style.display = "flex";
					div.style.flexDirection = "column";
					div.classList.add('test');
					div.style.borderTop = "1px solid black"; */
					
					const div2 = document.createElement("div");
					div2.className = "test2";
					/* div2.classList.add('test2');
                	div2.style.display = "flex";
                    div2.style.justifyContent = "center";
                    div2.style.fontSize = "25px";
                     */
                    
                    const div3 = document.createElement("div");
                    div3.className = "just";
                  /*   div3.style.flex = "1"; */
                    
					const cname = document.createElement("p");
					cname.className = "namebox";
					cname.innerText = data.vo.userName;
					const ccontent = document.createElement("p");
					ccontent.innerText = content;
					const cdate = document.createElement("p");
					cdate.className = "time";
					cdate.innerText = data.vo.createDate;
					const btn1 = document.createElement("button");
					btn1.id = "btnedit";
					const btn2 = document.createElement("button");
					btn1.style.borderRadius = "5px";
					btn2.style.borderRadius = "5px";
					btn1.style.backgroundColor = "#26A653";
					btn2.style.backgroundColor = "#26A653";
					btn1.style.color = "white";
					btn2.style.color = "white";
					btn1.style.border = "1px solid white";
					btn2.style.border = "1px solid white";
					btn1.innerText = "수정"
					btn2.innerText = "삭제"	
					
					
					/* leftdiv.append(cname);
					leftdiv.append(div2);
					rightdiv.append(cdate);
					rightdiv.append(div3); */
					div.append(cdate);
					div.append(cname);
					div.append(div2);
					div.append(div3);
					
					div3.append(btn1);
					div3.append(btn2);
					
					div2.append(ccontent);
					comdiv.append(div);
					div.style.marginTop = "2%"; 
					
					//수정 버튼 클릭시 수정폼 생성
					btn1.addEventListener("click", function(){
						document.getElementById("input").style.display = "none";
					 	this.setAttribute("disabled", "disabled"); 
						const updateform = document.createElement("div");
						/* updateform.style.border = "1px solid black"; */
						const updateinput = document.createElement("textarea");
						updateinput.cols = "40";
						updateinput.rows = "10";
						updateinput.innerText = ccontent.innerText;
						const updatebtn = document.createElement("button");
						updatebtn.innerText = "수정완료";
						
						/* document.getElementsByClassName("test2")[0].style.display = "none"; */
						updateform.append(updateinput);
						updateform.append(updatebtn);
						div.append(updateform);
						
						//수정완료 버튼 클릭시 수정된 내용으로 수정
						 updatebtn.addEventListener("click", function(){						 
							 document.getElementById("input").style.display = "flex";
						 	const target = document.getElementById('btnedit');
						 	target.disabled = false;
						 	document.getElementsByClassName("test2")[0].style.display = "flex";
						 	const content = updateinput.value;
						 	const reviewCode = data.vo.reviewCode;
						 	const createDate = new Date();
						 	console.log(createDate);
						 	const simple_data = {reviewCode, content, createDate};
						 	
						 	$.ajax({
						 			url : "${pageContext.request.contextPath}/review/comment/edit",
						 			type : "PUT",
						 			contentType:"application/json; charset=utf-8",
						 			dataType : "json",
						 			data : JSON.stringify(simple_data),
						 			success : function(data){
						 				console.log(data);
						 				if(data.state == "ok"){
						 					ccontent.innerText = content;
						 					updateform.remove();
						 					var now = moment(createDate).format("YYYY-MM-DD HH:mm");
						 					cdate.innerText = now;
						 					console.log(now);
						 					
						 				}
										console.log(simple_data);
									}
						 		});
						 	});
						 });
					
					//삭제 버튼 이벤트 리스너
					btn2.addEventListener("click", function(){

						let isDelete = confirm("정말로 삭제하시겠습니까?");
						if(isDelete){ 
							
						
						const reviewCode = data.vo.reviewCode;
						const simple_data = {reviewCode};
						document.getElementById("input").style.display = "flex";
						$.ajax({
							url : "${pageContext.request.contextPath}/review/comment/delete",
							type : "delete",
							contentType:"application/json; charset=utf-8",
							dataType : "json",
							data : JSON.stringify(simple_data),
							success : function(data){
								if(data.state == "ok"){	
									div.remove();
									}
							},
							error : function(e){
								alert(e);
			
							}
						});
						
						
						}
						
						
					});	
					
				}
			},
				error : function(e){
					alert(e);
			}
			
		});
		
		document.getElementById("content").value='';
		
	});
	
	
	//db에서 댓글 가져오기
	window.addEventListener("DOMContentLoaded", function(){
		let username = "${userdata.userName}";
		console.log(username);
		$.ajax({
			url : "${pageContext.request.contextPath}/review/comment",
			type : "POST",
			contentType:"application/json; charset=utf-8",
			dataType : "json",
			success : function(data){
				const comdiv = document.getElementById("comment");
				
				for(let comment of data){
					console.log(comment);	
				
					const leftdiv = document.createElement("div");
					leftdiv.className = "leftbox";						
					const rightdiv = document.createElement("div");
					rightdiv.className = "rightbox";
					const div = document.createElement("div");
					div.className = "comentbox";
					
					div.append(leftdiv);
					div.append(rightdiv);
					/* div.style.display = "flex"; */
					
					/* const div = document.createElement("div");
					div.style.flexDirection = "column";
					div.style.borderTop = "1px solid black";
					div.style.fontFamily = "Gowun Dodum"; */
					
					
                    const div2 = document.createElement("div");
					div2.className = "coment";

                   /*  div2.style.display = "flex";
                    div2.style.justifyContent = "center";
                    div2.style.fontSize = "25px"; */
                    
                    const div3 = document.createElement("div");
                    div3.className = "just";
                    /* div3.style.flex = "1"; */

                    
					
					const cname = document.createElement("p");
					cname.className = "namebox";
					cname.innerText = comment.userName;
					
					const ccontent = document.createElement("P");
					ccontent.innerText = comment.content;
					
					const cdate = document.createElement("p");
					cdate.className = "time";
					cdate.innerText = comment.createDate;
					
					leftdiv.append(cname);
					leftdiv.append(div2);
					rightdiv.append(cdate);
					rightdiv.append(div3);
					
					/* const cid = document.createElement("h4");
					cid.innerText = comment.id; */
					if (username == comment.userName) {
						const btn1 = document.createElement("button");
						const btn2 = document.createElement("button");
						btn1.style.borderRadius = "5px";
						btn2.style.borderRadius = "5px";
						btn1.style.backgroundColor = "#26A653";
						btn2.style.backgroundColor = "#26A653";
						btn1.style.color = "white";
						btn2.style.color = "white";
						btn1.style.border = "1px solid white";
						btn2.style.border = "1px solid white";
						btn1.innerText = "수정"
						btn2.innerText = "삭제"	
							//수정 버튼 클릭시 수정폼 생성
							btn1.addEventListener("click", function(){
								document.getElementById("input").style.display = "none";
								div2.classList.add('test3');
								btn1.id = "btnedit2";
								
								this.setAttribute("disabled", "disabled");
								
								const updateform = document.createElement("div");
								const updateinput = document.createElement("textarea");
								updateinput.cols = "30";
								updateinput.rows = "10";
								console.log(ccontent.innerText);
								updateinput.innerText = ccontent.innerText;
								const updatebtn = document.createElement("button");
								updatebtn.innerText = "수정완료";
								updatebtn.style.borderRadius = "5px";
								updatebtn.style.backgroundColor = "#26A653";
								updatebtn.style.color = "white";
								updatebtn.style.border = "1px solid white";
								/* document.getElementsByClassName("test3")[0].style.display = "none"; */
								/* updateinput.append(updatebtn); */
								updateform.append(updateinput);
								 updateform.append(updatebtn);
								
								div.append(updateform);

								
								//수정완료 버튼 클릭시 수정된 내용으로 수정
								 updatebtn.addEventListener("click", function(){		
									 document.getElementById("input").style.display = "flex";
								 	const target = document.getElementById('btnedit2');
								 	target.disabled = false; 
								 	document.getElementsByClassName("test3")[0].style.display = "flex";
								 	const content = updateinput.value;
								 	const createDate = new Date();
								 	//아이디값 받아오는게 문제듯
								 	const reviewCode = comment.reviewCode;
								 	const simple_data = {reviewCode, content, createDate};
								 		$.ajax({
								 			url : "${pageContext.request.contextPath}/review/comment/edit",
								 			type : "PUT",
								 			contentType:"application/json; charset=utf-8",
								 			dataType : "json",
								 			data : JSON.stringify(simple_data),
								 			success : function(data){
								 				if(data.state == "ok"){
								 					ccontent.innerText = content;
								 					var now = moment(createDate).format("YYYY-MM-DD HH:mm");
								 					cdate.innerText = now;
								 					updateform.remove();
								 					
								 				}
											
											}
								 		});
								 	});
								 });
							
							//삭제 버튼 이벤트
							btn2.addEventListener("click", function(){

								let isDelete = confirm("정말로 삭제하시겠습니까?");
								if(isDelete){ 
								const reviewCode = comment.reviewCode;
								const simple_data = {reviewCode};
								document.getElementById("input").style.display = "flex";
								$.ajax({
									url : "${pageContext.request.contextPath}/review/comment/delete",
									type : "delete",
									contentType:"application/json; charset=utf-8",
									dataType : "json",
									data : JSON.stringify(simple_data),
									success : function(data){
										if(data.state == "ok"){	
											div.remove();
											
										}
									},
									 error : function(e){
										alert(e);
									 }
//	 								error : function(request, status, error) {
//	 							        alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
//	 								}
								});
								}
							});
							
							div3.append(btn1);
							div3.append(btn2);
					}
					
					

					div.append(cdate);
					div.append(cname);
					div2.append(ccontent);
					div.append(div2);
					div.append(div3);
					comdiv.append(div);
					div.style.marginTop = "2%";
					/* comdiv.style.marginTop = "3%"; */
					/* comdiv.style.marginBottom = "3%"; */
					

					
					
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
    <div class="bottom_banner">
    	<div class="banner_area">
			<img src="${pageContext.request.contextPath}/image/index_bottom_banner.png">
		</div>
    </div>
    <footer>
        <jsp:include page="../etc/footer.jsp"></jsp:include>
    </footer>
</div>
	<script type="text/javascript">
	let main_logo = document.querySelector(".main_logo");
	
	main_logo.addEventListener("click",function() {
		location.href="${pageContext.request.contextPath}";
	});
</script>
</body>
</html>