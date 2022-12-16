<%@page import="com.sample.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>문의내역</title>
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
	width: 70%;
/* 	background: url("${pageContext.request.contextPath}/image/myPage1.png") no-repeat 5px; */
/* 	background-size: contain; */
 	padding: 5px 0;
/* 	text-indent: -9999px; */
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
/*     height: 900px; */
/* 	   min-height: 900px; */
/*     background-color: #ffaaaa; */
    justify-content: space-evenly;
    align-items: center;
    flex-direction: column;
/*     border: 1px solid black; */
}

.main_content1 {
	display: flex;
	flex-direction: column;
	width: 70%;
	height:90%;
	background-color: #fff;
	padding: 20px;
}

.main_item1, .main_item2 {
	display: flex;
	width: 100%;
	height: 40vh;
	flex-direction: column;
}

.main_item1 p, .main_item2 p{
	display: block;
	font-size: 15px;
	opacity: 0.9;
}

.main_item1 h5, .main_item2 h5 {
	display: block;
	font-size: 15px;
	opacity: 0.9;
	min-width: 100px;
}


.detail_header {
	display:flex;
	width: 100%;
	padding: 20px 10px;
	border-bottom: 1px solid #ccc;
}

.header_item1{
	display:flex;
	width: 49%;
}

.header_item2{
	display:flex;
	width: 49%;
	justify-content: space-evenly;
}


.detail_title{
    display: flex;
    width: 100%;
    padding: 20px 10px;
    border-bottom: 1px solid #ccc;
}

.title_item {
	display: flex;
	width: 100%;
}

.detail_content {
	display:flex;
	width: 100%;
	min-height:60%;
	padding: 30px 10px;
	border-bottom: 1px solid #ccc;
}

.content_item {
	display: flex;
}

.content_item h5{
	align-self: center;
}

/* .title_item p { */
/* 	width: 70%; */
/* 	padding-left: 15%; */
/* } */

.btn_box{
	display: flex;
	justify-content: space-evenly;
}
    
    .btn_box button {
	display: inline-block;
	width: 40%;
	padding: 15px 0;
	text-decoration: none;
	margin: 20px 0;
	color: #fff;
	font-weight:bold;
	font-size:18px;
	border: 1px solid #26a653;
	text-align: center;
	background-color: #26a653;
	border-radius: 20px;
}

.btn_box button:hover {
	opacity: 0.8;
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
			<h1 class="main_title">내 문의내역</h1>
				<div class="main_content1">
					<div class="main_item1">
						<div class="detail_header">
							<section class="header_item1">
								<h5>등록일</h5><p>${inquiryVO.createDate}</p>
							</section>
							<section class="header_item2">
								<h5>처리상태</h5><p>${inquiryVO.inquiryState}</p>
							</section>
						</div>
						<div class="detail_title">
							<section class="title_item">
								<h5>제목</h5><p>${inquiryVO.inquiryTitle}</p>
							</section>
						</div>
						<div class="detail_content">
							<section class="content_item">
								<h5>내용</h5><p>${inquiryVO.inquiryContent}</p>
							</section>
						</div>
					</div>
					<!-- 관리자 답변 들어갈곳 -->
					<c:if test="${inquiryVO.inquiryState eq '답변완료'}">
					<div class="main_item2">
						<div class="detail_header">
							<section class="header_item1">
								<h5>답변일</h5><p>${inquiryVO.answerDate}</p>
							</section>
						</div>
						<div class="detail_content">
							<section class="content_item">
								<h5>답변</h5><p>${inquiryVO.answerContent}</p>
							</section>
						</div>
					</div>
					</c:if>
					<div class="btn_box">
						<button id="btn">뒤로가기</button>
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
        <script type="text/javascript">
        	$('#btn').on("click", function(){
        		location.href = "${pageContext.request.contextPath}/myPage/inquiry";
        	});
        </script>
	</div>
</body>
</html>