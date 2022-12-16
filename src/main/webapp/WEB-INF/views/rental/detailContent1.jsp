<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>구장예약</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
<style>
     .content_container {
         grid-area:content;
         display: flex;
         flex-direction: column;
    	 padding: 0px 20px;
    	 padding-bottom: 35px;
    	 padding-top: 50px;
    	 
      }
      
      .content_content {
         display: flex;
         flex-direction: row;
         width:100%;
         margin-top:15px;
         justify-content: space-between;
      }
      
      .field_info_area {
         display: flex;
         width:70%;
         flex-direction: column;
      }

      .content_count {
         width: 100%;
         margin: 15px 0px;
         display: flex;
         justify-content: space-between;
      }

      .field_info {
         width:70%;
      }
      .plant_info {
         width:45%;
      }

      .field_image {
         width:165px;
         height:100px;
         margin-bottom: 20px;
      }
      
      .content_field_name {
         width:100%;
         margin-bottom: 10px;
         font-weight: bold;
      }
      
      .content_field_info {
         color:gray;
         font-size:13px;
      }

      .field_etc_area {
         display: flex;
         width: 45%;
         flex-direction: column;
         
      }
      
      .etc {
	    font-size: 16px;
	    margin-bottom: 20px;
	    display: flex;
	    line-height: 27px;
      }
      
      .etc_stroke {
         color:rgb(187, 187, 187);
      }

      .icon_size {
         font-size: 27px;

      }

      .notice_container {
         grid-area: notice;
         width: 100%;
         margin-top: 10px;
		 border-top: 1px solid #ebebeb;
		 padding: 0px 20px;
      }
      
      .notice_title {
         margin-bottom: 35px;
         margin-top: 50px;

      }

      .notice {
         margin: 20px 0px;
         font-size:14px;
      }
      
      .notice_content h4 {
         display: flex;
      }

      .icon_notice {
         font-size: 23px;

      }
      .menu_title_area2:hover {
      		background-color: #26A653;
            color:white;
      }
      
      .menu_title_area2:hover .menu_title2 {
            color:white;
      }
</style>
</head>
<body>
      <div class="content_container">
         <div class="content_count">
            <h3 class="field_info">구장 정보</h3>
            <h3 class="plant_info">시설 정보</h3>
         </div>
         <div class="content_content">
            <div class="field_info_area">
               <div class="field_img_area">
                 <c:if test="${field.fieldImg1 != null}">
                     <img class="field_image img1" src="${pageContext.request.contextPath}/image/ground/${field.fieldImg1}" alt="">
                 </c:if>
                 <c:if test="${field.fieldImg2 != null}">
                     <img class="field_image img2" src="${pageContext.request.contextPath}/image/ground/${field.fieldImg2}" alt="">
                 </c:if>
                 <c:if test="${field.fieldImg3 != null}">
                     <img class="field_image img3" src="${pageContext.request.contextPath}/image/ground/${field.fieldImg3}" alt="">
                 </c:if>
                 <c:if test="${field.fieldImg4 != null}">
                     <img class="field_image img4" src="${pageContext.request.contextPath}/image/ground/${field.fieldImg4}" alt="">
                 </c:if>
                 <c:if test="${field.fieldImg5 != null}">
                     <img class="field_image img5" src="${pageContext.request.contextPath}/image/ground/${field.fieldImg5}" alt="">
                 </c:if>
               </div>
                  <div class="content_field_name">A구장</div>
                  <div class="content_field_info">${field.fieldSize} / ${field.fieldInOut} / ${field.fieldGrass}</div>
            </div>

            <div class="field_etc_area">
               <div class="etc"><iconify-icon class="icon_size" icon="icon-park:spikedshoes"></iconify-icon>　풋살화 대여</div>
               <div class="etc"><iconify-icon class="icon_size" icon="icon-park:basketball-clothes"></iconify-icon>　운동복 대여</div>
               <div class="etc"><iconify-icon class="icon_size" icon="ant-design:car-outlined"></iconify-icon>　주차</div>
               <div class="etc etc_stroke"><iconify-icon class="icon_size" icon="akar-icons:water"></iconify-icon>　<s>정수기</s></div>
               <div class="etc"><iconify-icon class="icon_size" icon="cil:toilet"></iconify-icon>　화장실</div>
               <div class="etc"><iconify-icon class="icon_size" icon="material-symbols:smoking-rooms-rounded"></iconify-icon>　흡연실</div>
               <div class="etc etc_stroke"><iconify-icon class="icon_size" icon="majesticons:bath-shower-line"></iconify-icon>　<s>샤워실</s></div>
            </div>
         </div>

      </div>


      <div class="notice_container">
         <div class="notice_title">
            <h3>공지사항</h3>
         </div>
         
         <div class="notice_content">
            <h4>
               <iconify-icon class="icon_notice" icon="ion:information-circle-outline"></iconify-icon>
               　안내 사항
            </h4>
            <ul>
               <li class="notice">흡연 : 지정구역 외에 흡연시 과태료 부과 </li>
               <li class="notice">주차관련 : 사전 주차 등록시 20대 3시간 무료 (매니저에게 주차번호 전달 필요)</li>
               <li class="notice">물/음료 : 자판기에서 구매가능. 정수기 여부X</li>
               <li class="notice">풋살화 대여 : 비오는날 제외, 대여 가능</li>
               <li class="notice">공 대여 : 대여 가능</li>
               <li class="notice">조끼 대여 : 대여 가능</li>
            </ul>
            
         </div>
      </div>
      
<!--       <div class="rv_btn_area"> -->
<!--          <div class="rv_btn_content"> -->
<!--             <button class="rv_btn"> -->
<!--                예약하기 -->
<!--             </button> -->
<!--          </div> -->
<!--       </div> -->
</body>
</html>