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
<title>이지풋볼 / 공지사항</title>
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
	margin: 70px 0 40px 0;
	text-align: center;
}

#main_container {
    display: flex;
    width: 100%;
    height: 100%;
    justify-content: center;
/*     background-color: #ccc; */
	font-family: NotoSansM, sans-serif;
	
}

.main_area {
	display:flex;
    width: 1024px;
    min-height: 500px;
/*     background-color: #ffaaaa; */
/*     justify-content: space-evenly; */
/*     align-items: center; */
    flex-wrap: wrap;
/*     border: 1px solid black; */
}

.main_content1 {
	width: 100%;
	margin-top: 40px;
}

#notice_list {
	padding: 0;
	list-style-type: none;
	border-top: 1px solid black;
	width: 80%;
	margin: 0 auto;
}

.notice_box {
	border-bottom: 1px solid #ccc;
}

.notice_item{
	display: none;
	width: 100%;
	min-height: 400px;
/* 	border: 1px solid black; */
	padding: 30px 15px;
	font-size: 15px;
	opacity: 0.8;
}

.notice_title {
	padding: 15px;
	font-weight: bold;
	font-size: 15px;
	opacity: 0.8;
}

.up_down{
	position: relative;
	float: right;
    margin: 0 20px 0 0;
}

.up_down:after {
    position: absolute;
    left: 0;
    top: 0;
    content: '';
    width: 10px;
    height: 10px;
    border-top: 1px solid #000;
    border-right: 1px solid #000;
    transform: rotate(135deg);
}

.up_down2{
	display:none;
	position: relative;
	float: right;
    margin: 8px 20px 0 0;
}

.up_down2:after {
    position: absolute;
    left: 0;
    top: 0;
    content: '';
    width: 10px;
    height: 10px;
    border-top: 1px solid #000;
    border-right: 1px solid #000;
    transform: rotate(315deg);
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
#MTbtn{
	display: inline-block;
    text-decoration: none;
    border-radius: 20px;
    color: #000;
    text-align: center;
    width: 100%;
    height: 100%;
    padding: 20px 0;
    background-color: #fffaec;
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
				<div class="main_content1">
					<h1 class="main_title">공지사항</h1>
					<ul id="notice_list">
						<li class="notice_box">
							<p class="notice_title">[공지사항][수도권] EZ풋볼 공지사항
								<i class="up_down"></i>
								<i class="up_down2"></i>
							</p>
<!-- 							<i class="up_down"></i> -->
<!-- 							<i class="up_down2"></i> -->
							<div class="notice_item">
							<pre>
EZ풋볼에 오신걸 환영합니다! 

							</pre>
							</div>
						</li>
						<li class="notice_box">
							<p class="notice_title">[공지사항] 강수로 인한 경기취소 기준
								<i class="up_down"></i>
								<i class="up_down2"></i>	
							</p>
							<div class="notice_item">
								<pre>
안녕하세요. EZ풋볼입니다.


EZ풋볼 매치는 강수 예보에도 참여를 원하시는 참가자분들이 있다면 가능한 경기를 진행하고 있습니다.
또한, 1mm 이상의 강수 예보가 있다면 <strong>[강수 안내] 알림톡(카카오톡 혹은 문자)</strong>을 발송합니다.
알림톡을 받으신 경우, <strong>매치 시작 1시간 30분 전</strong>까지 취소하면 전액 환불합니다.
당일 예보 변동이 심한 점을 고려해 실시간으로 예보를 확인하고 매치 시작 4시간 전까지는 알림톡을 발송해드립니다. 


<strong>[유의사항]</strong>
*구장으로 이미 출발한 다른 참가자를 위해 꼭 매치에 참여해 주세요.
*매치 시작 1시간 30분 내에 취소하거나 무단 불참하면 이용이 제한될 수 있습니다.
*취소자가 다수 발생하거나, 구장 상태 악화로 진행이 어렵다면 매치 시작 1시간 30분 이내라도 즉시 취소 안내를 드립니다.
*경기 진행 중에도 폭우 또는 폭설로 안전 상의 문제가 있을 경우 현장에서 매치가 취소될 수 있습니다.
*강한 비(눈)로 매치를 취소 또는 중단할 경우, 남은 시간 만큼 환불이 가능합니다.


<strong>[취소방법]</strong>
고객문의 -> 환불신청 선택


<strong>[환불규정]</strong>
매치 시작 1시간 30분 전까지 취소했을 경우


<strong>[기준강수]</strong>
기상청 날씨 누리 기준 해당 지역 1mm 이상 예보가 있는 경우								
								</pre>
							</div>
						</li>
						<li class="notice_box">
							<p class="notice_title">[매니저모집] EZ풋볼에서 함께하실 매니저님을 모집합니다.
								<i class="up_down"></i>
								<i class="up_down2"></i>	
							</p>
							<div class="notice_item">
								<pre>
안녕하세요 EZ풋볼입니다.
저희 EZ풋볼와 함께 매일 진행되는 소셜 경기를 진행해주실 매니저님을 찾습니다!

 
<strong>EZ풋볼 매니저란?</strong>
EZ풋볼 소셜경기의 경기 매니저로서 참가자들이 즐겁게 운동할 수 있도록 해당 경기 진행을 담당합니다.
참가자들과 함께 운동을 즐기며, 수당도 받을 수 있습니다.

 
<strong>[모집요강]</strong>
* 부문 : EZ풋볼 소셜매치 매니저
* 업무 : EZ풋볼 소셜매치 운영 및 장비관리(팀 조끼, 공 2개 등)
* 자격 : 만 21세 이상의 축구/풋살을 사랑하는 남/녀, 최소 3개월 이상 매니저 활동 가능한 사람
* 6개월 이상 가능자 우대


<strong>[모집 지역]</strong>
- 서울 전 지역
- 인천
- 수원
- 부평
- 의정부
- 고양

<strong>[근무 방식]</strong>
* 최소 3개월 근무, 최소 월 4회 이상 매치 진행
 

<strong>[급여]</strong>
경기 1회당 35,000원(3.3% 사업공제 적용)
 

<strong>[우대사항]</strong>
* EZ풋볼 소셜매치 참가 경험이 많은 사람
* 책임, 성실, 예의, 친절의 이미지에 적합한 사람
* 경기 인원에 따라 언제든 해당 경기에 참가를 할 수 있는 사람


<strong>[혜택]</strong>
* 우수 매니저 인센티브 지급
* EZ풋볼 소셜매치 무료 참가 기회

 
<strong>[채용 과정]</strong>
온라인 지원서 작성 > 현장 교육(1~2회) > 단독 실습 > 최종 평가


<strong>[신청 방법]</strong>
마이페이지 -> 매니저지원 탭에서 신청가능
								</pre>
							</div>
						</li>
					</ul>
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
	     	// list 누르면 아래 박스추가
	    	$('.notice_title').on("click",function(){
				$(this).parent().nextAll().children('.notice_item').hide();
				$(this).parent().prevAll().children('.notice_item').hide();
				$(this).next().children('.up_down').show();
				$(this).prev().children('.up_down').show();
				$(this).next().children('.up_down2').hide();
				$(this).prev().children('.up_down2').hide();
					console.log($(this).parent().next().children('.notice_item'));
					console.log($(this).next('.notice_item').css('display'));
				if($(this).next('.notice_item').css('display') == 'block'){
					$(this).next('.notice_item').stop().slideUp(300);
					$(this).children('.up_down').show();
					$(this).children('.up_down2').hide();
					return;
				}
	    		$(this).next('.notice_item').stop().slideDown(300);
				$(this).children('.up_down').hide();
	    		$(this).children('.up_down2').show();
	    	});
        </script>

	</div>
</body>
</html>