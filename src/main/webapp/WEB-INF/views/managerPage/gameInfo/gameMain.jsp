<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String game_p = request.getParameter("gamePage");
	if(game_p == null ){
		game_p="game1";
	}
		
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        #contain * {
            /* border: 1px solid black; */
        }
        #contain{
            display: flex;
            flex-direction: column;
            width: 98%;
            margin: 0 auto;
    		height: 100%;
        }
        #submenu_area {
        	border-bottom: 2px solid #26a653;
        }
        #submenu{
            display: flex;
            align-items: center;
            width: 20%;
            min-width: 200px;
            height: 50px;
            list-style: none;
            margin: 0;
            padding:5px 0 0 0;
            text-align: center;
        }
        .sub_menu{
            width: 50%;
            height: 100%;
            min-width: 100px;
            text-decoration: none;
            color: black;
            display: flex;
    		align-items: center;
    		justify-content: center;
    		font-weight: bold;
        }
        #maincontent{
            width: 100%;
        }
        .menu3_a {
	        font-weight: bold;
	        padding-bottom:5px;
	        border-bottom: 3px solid #26A653;
    	}
       
    </style>
    <title>매니저페이지</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
</head>
<body>
<div id="contain">
    <div id="submenu_area">
        <ul id="submenu">
            <a class="sub_menu sub_menu1" href="${pageContext.request.contextPath}/manager/manager?page=gameMain&gamePage=game1"><li>소셜매치</li></a>
            <a class="sub_menu sub_menu2" href="${pageContext.request.contextPath}/manager/manager?page=gameMain&gamePage=game2"><li>팀매치</li></a>
            <a class="sub_menu sub_menu3" href="${pageContext.request.contextPath}/manager/manager?page=gameMain&gamePage=game3"><li>게임결과</li></a>
        </ul>
    </div>
    <div id="maincontent">
        <%
        	if(game_p.equals("game1")){
        		%>
	    		  <jsp:include page="./socialGamelist.jsp"></jsp:include>
	    		<%
        	}else if(game_p.equals("game2")){
        		%>
	    		  <jsp:include page="./teamGamelist.jsp"></jsp:include>
	    		<%
        	}
        	else if(game_p.equals("game3")){
        		%>
	    		  <jsp:include page="./resultGamelist.jsp"></jsp:include>
	    		<%
        	}
        %>
    </div>
</div>
</body>
</html>