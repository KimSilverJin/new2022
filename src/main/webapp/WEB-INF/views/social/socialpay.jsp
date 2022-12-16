<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.sample.service.GlistService"%>
<%@page import="com.sample.service.LoginService"%>
<%@page import="com.sample.vo.UserVO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String authority = null;
	if(session.getAttribute("sessionVO") != null) {
		UserVO uvo = (UserVO)session.getAttribute("sessionVO");
		authority = uvo.getUserAuthority();
		
	}else {
		authority = "일반회원";
		
	}
%>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이지풋볼</title>
   <link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
   <script src="https://kit.fontawesome.com/4b992414b9.js" crossorigin="anonymous"></script>
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Zilla+Slab&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/frame/shop/header.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/frame/main/footer.css">
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
   <style>
      * {
         margin: 0;
         padding: 0 auto;
         box-sizing: border-box;
         font-family: 'Noto Sans KR', sans-serif;
      }

      body {
         background-color: white;
         height: 100vh;
      }
      
      .container {
         width: 100%;
         margin: 0 auto;
         display: grid;
         grid-template-columns: 23% 54% 23%;
         grid-template-rows: 65px 448px 1fr;
         gap: 5px 5px;
         grid-auto-flow: row;
         grid-template-areas: ". header ."
            ". rv_info ."
            ". pay_info  ."
      }

      .header_container {
         grid-area: header;
         width: 100%;
         height: 56px;
         display: flex;
         justify-content: center;
      }

      .header_area {
         width: 100%;
         height: 100%;
         padding-top: 15px;
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
         background: url("${pageContext.request.contextPath}/image/ez_logo1.svg") no-repeat center;
         background-size: 95px 35px;
         cursor: pointer;
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


      .rv_info_container {
         grid-area: rv_info;
         margin-top: 20px;
         width: 100%;
         display: grid;
         grid-template-columns: 1fr 1fr;
         grid-template-rows: 1fr 1fr;
         grid-template-areas: ". ."
            "re_info field_info";
         background: #343434;
         background-size: 100% 100%;
         color: #dbdbdb;
         background-image: url("${pageContext.request.contextPath}/image/football-488714_960_720_1.png");
      }

      .payment_container {
         grid-area: pay_select;

      }

      .rv_day {
         grid-area: re_info;
         width: 100%;
         display: flex;
         flex-direction: column;
         justify-content: flex-end;
         align-items: start;
         padding: 30px;
      }

      .rv_day h3 {
         margin: 0px;
         font-size: 23px;
      }

      .rv_day h4,
      .rv_time h4 {
         color: #A9A9A9;
         font-size: 16px;
         font-weight: 100;
      }

      .rv_time {
         grid-area: field_info;
         width: 100%;
         height: 100%;
         display: flex;
         flex-direction: column;
         justify-content: flex-end;
         align-items: end;
         padding: 30px;
      }

      .rv_time h3,
      h4 {
         margin: 0px;
      }

      .rv_time h3 {
         font-size: 19px;
         margin-bottom: 15px;
      }

      .rv_info_content h2 {
         margin-bottom: 15px;
      }

      .rv_info_content h3 {
         margin-bottom: 10px;

      }
      .rv_result_area {
         display: flex;
         justify-content: space-around;
		 width: 145px;

      }
      .rv_name {
         font-size: 15px;

      }
      .rv_result {
         font-size: 15px;
         font-weight: bold;

      }
      .result_match {
         font-size:13px;
         font-weight: 100;
         color:#8C8C8C;
      }

      .alarm_icon {
         font-size: 21px;
      }


      .reservation_container {
         grid-area: pay_info;
         width:100%;
         display: flex;
         margin-top: 10px;
         justify-content: space-between;
      }

      .rv_info_area {
         width:48%;
         padding-top: 30px;

      }

      .pay_info_area {
         width:48%;
         padding-top: 30px;
      }

      .rv_info_content {
         margin-top:25px;
         box-sizing: border-box;
         width: 100%;
         height: 50px;
         left: 220px;
         top: 429px;
         border:3px solid transparent;
         border-radius: 10px;
         background-image: linear-gradient(#fff, #fff), linear-gradient(to right, #26A653 0%, #5EDB8A 50%, #0071C3 100%);
         background-origin: border-box;
         background-clip: content-box,border-box;

         display: flex;
		 justify-content: space-evenly;
         align-items: center;
      }


      .rv_info_title {
         display: flex;
         margin-bottom: 20px;
         font-size: 20px;
         font-weight: bold;
         
         
      }
      .pay_content {
         position: sticky;
         top: 50px;
      }

      .pay_area {
         display: flex;
         justify-content: space-between;
         margin-bottom: 20px;
      }
      
      .pay_total_area {
         margin-top:10px;

      }
      .pay_info_content {
         display: flex;
         flex-direction: column;
         
      }
      
      .pay_title {
         color:#7C7C7C;
      }
      
      .pay {
         font-size: 16px;
         font-weight: bold;

      }
      
      .pay_money {
      	font-weight: 100;
      }

      .pay_total {
         font-size:18px;
         font-weight:bold;
         color:#343434;

      }

      .pay_won {
         font-size: 13px;
         margin-left: 3px;

      }

      .payment_container {
         margin-top: 20px;
      }

      #payment_btn {
         display: flex;
         width: 100%;
         color:white;
         font-size: 15px;
         border-radius: 10px;
         align-items: center;
         justify-content: center;
         height: 55px;
         background-color:#26A653;
         border: gray;
         cursor: pointer;
      }

      .rv_info_content_area {
         height:240px;

      }

      .notice_container {
         width: 100%;
         
         
      }

      .notice_area {
         display: flex;
         flex-direction: column;
         flex-wrap:nowrap;
         margin-bottom: 70px;
      }
      .title_point {
         color: rgb(26, 124, 255);
      }
      
    .login_icon {
        margin-left:15px;
    }
    .etc_icon {
        margin-left:10px;
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

      <div class="rv_info_container">
         <div class="rv_day">
            <h3>
               <iconify-icon class="alarm_icon" icon="grommet-icons:alarm"></iconify-icon> 예약 정보
            </h3>
            <h4>${matchinfo.gameDay}</h4>
            <h4>${matchinfo.gameTime} : 00 ~ ${matchinfo.gameTime+2} : 00</h4>
         </div>
         <div class="rv_time">
         	<h3 class="field_name">${matchinfo.fieldName}</h3>
	        <h4>${matchinfo.fieldAddress}</h4>
         </div>
      </div>

      <div class="reservation_container">
         <div class="rv_info_area">
            <div class="rv_info_content_area">
               <h3 class="rv_info_title">예약 정보</h3>
               <div class="rv_info_content">
                  <div class="rv_result_area">
                     <span class="rv_name">신청</span>
                     	<c:if test="${matchinfo.gameType eq 'T' }">
                     <span class="rv_result">팀매치 <span class="result_match">신청</span></span>
                     </c:if>
                        <c:if test="${matchinfo.gameType eq 'S' }">
                     <span class="rv_result">소셜매치 <span class="result_match">신청</span></span>
                     	</c:if>
                  </div>
                  <div class="rv_result_area">
                     <span class="rv_name">매치형태</span>
                     <span class="rv_result">${matchinfo.gameMacth} <span class="result_match">매치</span></span>                     
                  </div>
                  
                  
               </div>
               <c:if test="${matchinfo.level ne '0'}">
               <div class="rv_info_content">
                  	<div class="rv_result_area">
                     	<span class="rv_name">레벨 </span>
                     	<span class="rv_result">${matchinfo.level} <span class="result_match">권장</span></span>
                    </div>
               </div>
               </c:if>
            </div>

            <div class="notice_container">
               <div class="notice_area">
                  <div class="rv_info_title">환불 규정</div>
                  <span>
                     주의해주세요! 2일 전부터는 환불이 불가능합니다!<br>
                     매치 시간에 가까울수록 신청 취소 수수료가 커져요. <br>
                     7일 전까지는 100% 캐시 환불입니다.<br><br>

                     호우 경보, 대설 경보, 태풍 주의보, 태풍 경보 등 천재지변으로 구장 <br>이용이 어려울 경우에는 전액 캐시 환불해 드립니다.<br><br>
                     
                     시간 당 5mm 이상 비가 내리면, 예약 날짜를 변경할 수 있습니다.<br> 기상청 날씨누리 정보 기준으로 매치 2시간 전 지역 일기예보를 따릅니다.<br><br>

                     7일 이전 : 100% 환불<br>
                     5일 ~ 7일 : 80% 환불<br>
                     3일 ~ 5일 : 50% 환불<br>
                     당일 ~ 2일 : 0% 환불<br><br>
                  </span>
               </div>
               <div class="notice_area">
                  <div class="rv_info_title title_point">이것만은 꼭 지켜주세요!</div>
                  <span>
                     1. 다음 경기팀을 위해 제시간에 경기를 마쳐주세요.<br>
                        예약 시간을 초과하지 않도록 5분전에 마무리 하는게 좋아요.<br><br>

                     2. 축구화 안돼요. 풋살화(TF)를 신고 플레이 해주세요.<br>
                        풋살장에서 축구화(FG,HG,AG,MG) 착용은 나와 상대방의 부상을 <br>유발합니다!<br><br>

                     3. 다른 사용자나 인근 주민에게 피해를 끼치는 행동을 삼가주세요.<br>
                        민원으로 시설 사용이 중단될 수도 있습니다.<br><br>

                     4. 이용자 부주의로 시설을 파손하면, 손해배상을 청구할 수 있습니다. <br>            
                  </span>
               </div>
               <div class="notice_area">
                  <div class="rv_info_title">코로나19</div>
                  <span>
                     코로나19에 확진된 사람은 재택 치료 기간 동안 매치에 참여할 수 없어요. <br>
                     다른 사용자들을 위해 조금만 조심해주세요 :)
                  </span>
               </div>
               <div class="notice_area">
                  <div class="rv_info_title">부상과 보험</div>
                  <span>
                     EZ풋볼은 상대를 배려하고, 나를 지키는 안전한 플레이를 권장합니다. <br>
                     다른 사람에게 피해를 끼치는 경우 이용이 정지될 수 있습니다. <br> <br>

                     경기 규칙 안에서 발생한 부상 대부분은 책임을 묻기 어렵다는 판결 사례가 많습니다. <br> <br>
                     
                     과도한 힘을 사용해 일부러 상대를 다치게 할 경우 법원이 배상을 결정한 판례가 있습니다. <br> <br>
                     
                     플랩에서 직접 운용하는 보험 상품은 없습니다.  <br>소셜 매치 참여 전 실손의료보험 가입 여부를 확인해 주세요. <br> <br>
                     
                     실비 보험이 없다면, 스포츠 안전재단의 스포츠여행자공제(국내)와 다른 민간 보험사의 상품도 가입 가능함을 알립니다. <br> <br>
                  </span>
               </div>
            </div>
         </div>

         <div class="pay_info_area">
            <div class="pay_content">
               <h3 class="rv_info_title">결제</h3>
               <div class="pay_info_content">
                  <div class="pay_area">
                     <span class="pay_title">이용금액</span>
                     <span class="pay">
                     <c:if test="${matchinfo.gameType eq 'S'}">
                      	<span class="rental_fee amount_fee pay_money">10,000</span>
                     	<span class="pay_won">원</span>
                     </c:if>
                     <c:if test="${matchinfo.gameType eq 'T'}">
                      	<span class="rental_fee amount_fee pay_money">
                      	<fmt:formatNumber value="${matchinfo.gamePay}" pattern="#,###"/>
                      	</span>
                     	<span class="pay_won">원</span>
                     </c:if>
                     	
                     </span>   
                  </div>
                  <div class="pay_area">
                     <span class="pay_title">할인쿠폰</span>
                     	<span class="pay">
                     		<span class="rental_fee pay_money">0</span>
                     		<span class="pay_won">원</span>
                     </span>
                  </div>
                  <hr>
                  <div class="pay_area pay_total_area">
                     <span class="pay_title pay_total">총 금액</span>
                     <span class="pay pay_total">
                     <c:if test="${matchinfo.gameType eq 'S'}">
                      	<span class="rental_fee total_fee">10,000</span>
                     	<span class="pay_won">원</span>
                     </c:if>
                     <c:if test="${matchinfo.gameType eq 'T'}">
                      	<fmt:formatNumber value="${matchinfo.gamePay}" pattern="#,###"/>
                     	<span class="pay_won">원</span>
                     </c:if>
                     	
                     </span>
                  </div>
                  
                  <!-- 할인이나 그런 거 있을때 -->
                  <!-- <script type="text/javascript">
                  window.onload = function() {
                  let amount_fee = document.querySelector(".amount_fee");
                  let total_fee = document.querySelector(".total_fee");
               

					if('${matchinfo.gameType}' === 'T'){
	                  amount_fee.innerHTML = Number(${matchinfo.gamePay}).toLocaleString();
	                  total_fee.innerHTML = Number(${match.gamePay - 0}).toLocaleString();
					}else{
						amount_fee.innerHTML = Number(${field.fieldRentalfee}).toLocaleString();
			            total_fee.innerHTML = Number(${field.fieldRentalfee - 0}).toLocaleString();
					}   
				}
                  </script> -->
                  
                  <div class="payment_container">
                     <button id="payment_btn" onclick="requestPay()">결제하기</button>
                  </div>
               </div>
            </div>
         </div>

      </div>

   </div>


   <script>
      var IMP = window.IMP; // 생략가능
      IMP.init('imp44418126'); // <-- 본인 가맹점 식별코드 삽입
      function requestPay() {
         IMP.init('imp44418126'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
         IMP.request_pay({
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '${matchinfo.fieldName}',
            amount: '100',
            buyer_email: 'iamport@siot.do',
            buyer_name: '구매자',
            buyer_tel: '010-1234-5678',
            buyer_addr: '서울특별시 강남구 삼성동',
            buyer_postcode: '123-456'
         }, function (rsp) { // callback
            if (rsp.success) {
            	var msg = '결제에 성공하셨습니다!'; 
           	 	msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                if (rsp.apply_num == '' || rsp.apply_num == null){
                	rsp.apply_num = "0";
                }else{
                	rsp.apply_num = rsp.apply_num;
                }
                
                
            	alert("결제에 성공하셨습니다!");
            	 location.href = "${pageContext.request.contextPath}/msocial/paying?payCode="+rsp.imp_uid+"&storeCode="+rsp.merchant_uid+"&userPayment"+rsp.paid_amount+"&cardCode="+rsp.apply_num;
            	
            } else {
				alert("결제에 실패하셨습니다!");
	            
            }
         });
      }
   </script>
   
   <!--로고버튼  -->
      <script type="text/javascript">
         let main_logo = document.querySelector(".main_logo");

         main_logo.addEventListener("click", function () {
            location.href = "${pageContext.request.contextPath}";
         });
      </script>


</html>