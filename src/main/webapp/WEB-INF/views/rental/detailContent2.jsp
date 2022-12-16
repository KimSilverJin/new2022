<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>구장예약</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
<style type="text/css">
      .content_container {
		grid-area: content;
	    display: flex;
	    flex-direction: column;
	    padding: 0px;
	    padding-bottom: 35px;
	    justify-content: center;
	    align-items: center;
      }
      .menu_title {
         color:#C7C7C7;
      	 text-decoration: none;
      }
      .menu_title2 {
      	 color:white;
      	 text-decoration: none;
      }
      
      .menu_title_area {
			background-color: white;
		    width: 100px;
		    text-align: center;
		    border-radius: 20px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
/* 		    border: 1px solid #C7C7C7; */
			padding: 8px 0px;
			cursor: pointer;
		    
      }
      .menu_title_area2 {
      		background-color:#26A653;
		    width: 100px;
		    text-align: center;
		    border-radius: 20px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
			padding: 8px 0px;	
/* 		    border: 1px solid #26A653; */
		    cursor: pointer;
      }
      .menu_title_area:hover {
      		background-color: #26A653;
            color:white;

      }
      
      .menu_title_area:hover .menu_title {
            color:white;
      }
      

    .rental_list_container {
        width:100%;
        height:100%;
        display:flex;
        justify-content: center;
    }
    
    .rental_list_area {
        width: 1024px;
        max-width: 1024px;
        height:100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    .rental_list_content {
        width: 100%;
        height:100%;
        display:flex;
        justify-content: center;
        flex-direction: column;
    }

    .match_list_container {
        width: 100%;
        height: 3700px;
        display: flex;
        justify-content: center;
    }

    .match_menu_area {
        width: 1024px;
        max-width: 1024px;
        height:100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .match_menu_content {
        width: 100%;
        height:100%;
    }
</style>
</head>
<body>
<div class="content_container">
    <div class="match_menu_container">
        <div class="match_menu_area">
            <div class="match_menu_content">
				<jsp:include page="./rental2.jsp"></jsp:include>
            				
            </div>
        </div> 
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