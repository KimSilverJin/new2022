<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.sample.vo.UserVO"%>
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
<html>

<head>
   <meta charset="UTF-8">
   <title>이지풋볼</title>
   <link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
   <script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
   <style>
   
      * {
         box-sizing: border-box;
         margin: 0px;
      }


      .container {
         width: 100%;
         margin: 0 auto;
         display: grid;
    	 grid-template-columns: 23% 54% 23%;
         grid-template-rows: 65px 420px 85px 88px 1fr 1fr ;
         gap: 5px 5px;
         grid-auto-flow: row;
         grid-template-areas: ". header btn" 
                              ". banner ." 
                              ". title  ."
                              ". menu ."
                              ". content ."
                              ". notice .";
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

      .big_menu_container {
         width: 100%;
         height: 70px;
         display: flex;
         justify-content: center;
         margin-bottom: 13px;
         margin-top: 13px;

      }

      .big_menu_area {
         width: 100%;
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

      .menu1,
      .menu2,
      .menu3,
      .menu4,
      .menu5 {
         width: 100px;
         justify-content: center;
         display: inline-block;
      }

      .menu1_a {
         font-weight: bold;
         padding-bottom: 5px;
         border-bottom: 3px solid #26A653;
      }


      .banner_container {
         grid-area: banner;
         width: 100%;
         height: 100%;
         display: flex;
         justify-content: center;
         background-color: #fafafa;
         overflow: hidden;         
      }

      .banner_content_area {
         width: 100%;
         display: flex;
         justify-content: center;
         align-items: center;
         white-space: nowrap;
         width: 100%;
         height: 100%;
         transition: all 0.5s;
      }

      .banner_content {
         height: 448px;
         width: 100%;
         /* 추후에 사이즈 media로 변경 */
         white-space: nowrap;
         position: relative;
      }

      .banner_image {
         width: 100%;
         height: 100%;
      }

      .field_address {
         font-size: 13px;
      }

      .address_copy,
      .open_map {
         color: rgb(26, 124, 255);
         text-decoration: none;
         cursor: pointer;
         margin-right:5px;
      }

      .field_container {
         grid-area: title;
         display: flex;
         flex-direction: column;
         align-items: center;
      }

      .field_content_area {
         width: 100%;
         display: flex;
         flex-direction: column;
         padding: 20px;

      }

      .field_content {
         display: flex;
      }

      .field_address {
         margin-top: 10px;
      }

      .menu_container {
         grid-area: menu;
         display: flex;
         justify-content: center;
         margin-top: 10px;

      }
      .menu_content {
         display: flex;
         width: 100%;
		 border-bottom: 1px solid #ebebeb;
		 border-top: 1px solid #ebebeb;
		 padding:20px;
      }

      .menu_name {
         width: 125px;
         height: 100%;
         display: flex;
         justify-content: center;
         align-items: center;
      }
      
      .menu_title {
         color:white;
      	 text-decoration: none;
      }
      .menu_title2 {
      	 color:#C7C7C7;
      	 text-decoration: none;
      }
      
      .menu_title_area {
			background-color: #26A653;
		    width: 100px;
		    text-align: center;
		    border-radius: 20px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
/* 		    border: 1px solid #26A653; */
			padding: 8px 0px;
		    
      }
      .menu_title_area2 {
		    width: 100px;
		    text-align: center;
		    border-radius: 20px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
			padding: 8px 0px;	
/* 		    border: 1px solid #C7C7C7; */
		    cursor: pointer;
      }


      footer {
         width: 100%;
         height: 423px;
         display: flex;
         justify-content: space-evenly;
         padding: 30px;
         background-color: #2a2a2a;
      }

      .footer_left {
         width: 40%;

      }

      .footer_right {
         width: 40%;

      }

      .login_icon {
         margin-left: 15px;
         line-height: 0px;
      }

      .etc_icon {
         margin-left: 10px;
         line-height: 0px;
      }

      .rv_btn_area {
         grid-area: btn;
         margin: 30px;
         position: sticky;
         top: 88%;
      }

      .rv_btn {
		    width: 220px;
		    height: 70px;
		    background-color: #e8f2ff;
		    color: rgb(26, 124, 255);
		    border: 1px solid rgb(187 216 255);
		    border-radius: 45px;
		    font-weight: bold;
		    font-size: 22px;
		    cursor: pointer;
      }
      
      .map_picture {
      	width:100%;
      	height:100%;
      	visibility: hidden;
      }
       #map { 
       	width:100%; 
       	height:100%; 
       	position: relative; 
       } 
      
      .picture_area {
      	width:100%;
      	height:100%;
      	position: absolute;
    	top: 0px;
      }
      
      .map_toggle {
      	visibility: visible;
      }
      
      .change_text {
      	color:#C7C7C7;;
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
      <div class="banner_container">
         <div class="banner_content_area">
            <div class="banner_content">
			   <div class="map_picture">
			   		<div id="map"></div>
			   </div>
			   <div class="picture_area">
			   <c:if test="${field.fieldImg1 != null}">
	               <img class="banner_image img1" src="${pageContext.request.contextPath}/image/ground/${field.fieldImg1}" alt="">
	           </c:if>
	           <c:if test="${field.fieldImg2 != null}">
	               <img class="banner_image img2" src="${pageContext.request.contextPath}/image/ground/${field.fieldImg2}" alt="">
	           </c:if>
	           <c:if test="${field.fieldImg3 != null}">
	               <img class="banner_image img3" src="${pageContext.request.contextPath}/image/ground/${field.fieldImg3}" alt="">
	           </c:if>
	           <c:if test="${field.fieldImg4 != null}">
	               <img class="banner_image img4" src="${pageContext.request.contextPath}/image/ground/${field.fieldImg4}" alt="">
	           </c:if>
	           <c:if test="${field.fieldImg5 != null}">
	               <img class="banner_image img5" src="${pageContext.request.contextPath}/image/ground/${field.fieldImg5}" alt="">
	           </c:if>
	           </div>
            </div>
         </div>
      </div>
      <div class="field_container">
         <div class="field_content_area">
            <h3 class="field_name">${field.fieldName}</h3>
            <div class="field_address">${field.fieldAddress}
               <a class="address_copy" href="#" onclick="clip(); return false;">주소 복사</a></span>
               <span class="open_map" id="mapbtn">지도 보기</span>
            </div>
         </div>
      </div>
      
      <!-- 자동슬라이드 및 지도버튼 -->
		<script>
			let button_flag = true;
			var time_out;
			
			let page_num = document.querySelector(".current_index");
			            
			let pause_btn = document.querySelector(".fa-pause");
			let play_btn = document.querySelector(".fa-play");
			
			  // translate 먹일곳
			  let top_banner = document.querySelector('.banner_content_area');
			  let slide_photo_cnt = document.querySelectorAll(".banner_image").length;
			
			  // 최상단 디브
			  let slider_area = document.querySelector(".banner_container");
			
			  var slider_width = slider_area.clientWidth; // container의 width
			  var slide_index = 0;

              show_slides();


              function show_slides() {
                slide_index++;
                top_banner.style.transform = 'translate(' + (-(1028 * (slide_index - 1))-4*slide_index) + 'px';
                console.log(4*slide_index);


                if (slide_index === slide_photo_cnt) {  
                slide_index = 0;

                }

                if (button_flag == true) {
                  time_out = setTimeout(show_slides, 5000);
                  
                }

              }
   
              
              let mapbtn = document.getElementById("mapbtn");

              mapbtn.addEventListener("click", function () {
              	let banner_area = document.querySelector(".picture_area");
                  const map_picture = document.querySelector(".map_picture");
                  map_picture.classList.toggle("map_toggle");
              	
                  mapbtn.classList.toggle("change_text");
                  if(mapbtn.classList.contains("change_text")){
                  	mapbtn.innerText="지도 닫기";
                  	top_banner.style.transform = 'translate(0px)';
                  	clearTimeout(time_out);
                  }else {
                  	mapbtn.innerText="지도 보기";
                  	banner_area.style.display ="block";
                  	show_slides();
                  }
              });
		</script>

      <script type="text/javascript">

         function clip(){
         
            var url = '';
            var textarea = document.createElement("textarea");
            document.body.appendChild(textarea);
            url = '${field.fieldAddress}';
            textarea.value = url;
            textarea.select();
            document.execCommand("copy");
            document.body.removeChild(textarea);
            alert("경기장 주소가 복사되었습니다.")
         }
         
         </script>
      <div class="menu_container">
         <div class="menu_content">
            <div class="menu_name">
            	<div class="menu_title_area">
            		<a href="${pageContext.request.contextPath}/rental/rentalDetail?fieldCode=${field.fieldCode}" class="field_plant menu_title">시설</a>
            	</div>
            </div>
            <div class="menu_name">
                <div class="menu_title_area2">
            		<a href="${pageContext.request.contextPath}/rental/rentalDetail2?fieldCode=${field.fieldCode}&num=1" class="field_reservation menu_title2">구장 예약</a>
            	</div>
            </div>
         </div>
      </div>
	
				<c:choose>
					<c:when test="${num == 1}">
						<jsp:include page="./detailContent2.jsp"></jsp:include>
					</c:when>
					<c:otherwise>
						<jsp:include page="./detailContent1.jsp"></jsp:include>
					</c:otherwise>
				</c:choose>

	
	

      <script type="text/javascript">
         let main_logo = document.querySelector(".main_logo");

         main_logo.addEventListener("click", function () {
            location.href = "${pageContext.request.contextPath}";
         });
         
         // 예약하기 버튼 추후 삭제예정
//          let rv_btn = document.querySelector(".rv_btn");
         
//          rv_btn.addEventListener("click",function() {
//              location.href = "${pageContext.request.contextPath}/rental/rentalPayment?fieldCode="+${field.fieldCode};
//          })
      </script>
      
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=65331bb5f71196e87528297b0af9ceb4&libraries=services"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {

                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 2 // 지도의 확대 레벨
            };

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch('${field.fieldAddress}', function (result, status) {

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
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">${field.fieldName}</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            }
        });   
    </script>

   </div>
</body>

</html>