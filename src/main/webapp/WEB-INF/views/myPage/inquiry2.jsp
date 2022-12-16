<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객문의</title>
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
    min-height: 900px;
/*     background-color: #ffaaaa; */
    justify-content: space-evenly;
    align-items: center;
    flex-wrap: wrap;
/*     border: 1px solid black; */
}

.main_content1 {
	display: flex;
	flex-direction: column;
	width: 70%;
	/* height: 98%; */
	height:90%;
	background-color: #fff;
/* 	border: 1px solid black; */
	padding: 20px;
}

#inquiry_list{
	width: 100%;
	border-collapse: collapse;
	font-size: 14px;
	background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
	margin: 20px 0;
}

#inquiry_list th, td {
	border-bottom: 1px solid black;
	padding: 10px;
	text-align: center;
}

#inquiry_list th:first-child{
	border-radius: 15px 0 0 0;
}

#inquiry_list th:last-child{
	border-radius: 0 15px 0 0;
}

#inquiry_list th {
	background-color: #26a653;
	color: #fff;
	border-bottom: 1px solid black;
}

.item_box{
	cursor: pointer;
}

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

.select {
	cursor: pointer;
}

.up_down{
	position: relative;
/* 	float: right; */
/*     margin: 0 20px 0 0; */
}

.up_down:after {
    position: absolute;
    left: -70px;
    top: 3px;
    content: '';
    width: 7px;
    height: 7px;
    border-top: 2px solid #fff;
    border-right: 2px solid #fff;
    transform: rotate(135deg);
}

.up_down2{
	display:none;
	position: relative;
/* 	float: right; */
    margin: 8px 0 0 0;
}

.up_down2:after {
    position: absolute;
    left: -70px;
    top: 8px;
    content: '';
    width: 7px;
    height: 7px;
    border-top: 2px solid #fff;
    border-right: 2px solid #fff;
    transform: rotate(315deg);
}

.select_box {
	position: absolute;
	display:none;
/* 	right: 210px; */
	margin-left:-10px;
	top: 240px;
	color: #000;
}

#hidden {
	width: 100%;
	text-align: center;
	padding: 50px 0;
}

.select_box1, .select_box2, .select_box3 {
	padding: 10px;
	background-color: #fff;
	cursor: pointer;
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
						<div class="etc_icon">
							<a href="${pageContext.request.contextPath}/etc/etc"> <svg
									width="24" height="24" viewBox="0 0 24 24" fill="none"
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
					</div>
				</div>

			</div>
		</div>
        <div id="main_container">
            <div class="main_area">
			<h1 class="main_title">고객문의</h1>
				<div class="main_content1">
<%-- 					<c:if test="${list[0] ne null}"> --%>
					<h3>나의 문의내역</h3>
					<div class="main_item1">
						<table id="inquiry_list">
							<tr>
								<th>문의번호</th>
								<th>문의제목</th>
								<th>문의날짜</th>
								<th class="select">문의상태
									
									<div class="select_box">
										<div class="select_box1">전체보기</div>
										<div class="select_box2">답변대기</div>
										<div class="select_box3">답변완료</div>
									</div>
									<i class="up_down"></i>
									<i class="up_down2"></i>
								</th>
								
							</tr>
							
							<c:forEach var="list" items="${list}">
								<tr class="inquiry_item${list.inquiryCode} item_box">
									<td>${list.inquiryCode}</td>
									<td>${list.inquiryTitle}</td>
									<td>${list.createDate}</td>
									<td>${list.inquiryState}</td>
									
								</tr>	
								<script type="text/javascript">
									 $('.inquiry_item${list.inquiryCode}').on("click",function(){
										location.href = "${pageContext.request.contextPath}/myPage/inquiry_detail/${list.inquiryCode}";
									 });
								</script>
							</c:forEach>
								<c:if test="${list[0] eq null }">
									<tr>
										<td colspan="4">
											<h1 id="hidden">문의 내역이 없습니다.</h1>
										</td>
									</tr>
								</c:if>
							
<!-- 							<tr> -->
<!-- 								<td>2</td> -->
<!-- 								<td>고객 문의를 왜쓰는거야</td> -->
<!-- 								<td>2022-11-04</td> -->
<!-- 								<td>대기중</td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>3</td> -->
<!-- 								<td>살려주세요 사람있어요</td> -->
<!-- 								<td>2022-11-05</td> -->
<!-- 								<td>대기중</td> -->
<!-- 							</tr> -->
						</table>
					</div>
<%-- 					</c:if> --%>

					<div class="main_item2">
					</div>
					
					<div class="btn_box">
						<button id="inquiry">문의하기</button>
						<button id="btn">뒤로가기</button>
					</div>
				</div>
            </div>
        </div>
		
		
        
        <div class="bottom_banner"></div>
		<footer>
			<div class="footer_left"></div>
			<div class="footer_right"></div>

		</footer>	
	</div>
	
	<script type="text/javascript">
            let main_logo = document.querySelector(".main_logo");
            
            main_logo.addEventListener("click",function() {
                location.href="${pageContext.request.contextPath}";
            });
    </script>
    
    <script type="text/javascript">
    	$('#inquiry').click(function(){
    		location.href = "${pageContext.request.contextPath}/myPage/inquiry_writing";
    	});
    	
    	$('#btn').click(function(){
    		location.href = "${pageContext.request.contextPath}/myPage/myPage";
    	});
    	
    	$('.select').on("click", function(){
    		if($(this).children().css("display") == "block"){
    			$(this).children().hide();
    			$('.up_down').show();
    			$('.up_down2').hide();
    			return;
    		}
    			$(this).children().show();
    			$('.up_down').hide();
    			$('.up_down2').show();
    		
    	});
    	
    	$('.select_box1').on("click", function(){
    		location.href = "${pageContext.request.contextPath}/myPage/inquiry";
    	});
    	
    	$('.select_box2').on("click", function(){
    		let state = 'TO';
    		location.href = "${pageContext.request.contextPath}/myPage/inquiry/"+state;
    	});
    	
    	$('.select_box3').on("click", function(){
    		let state = 'RE';
    		location.href = "${pageContext.request.contextPath}/myPage/inquiry/"+state;
    	});
    </script>
</body>
</html>