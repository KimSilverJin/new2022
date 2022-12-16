<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String gameselect = null;
	if(request.getParameter("gameselect") != null) {
		gameselect = (String)request.getParameter("gameselect");
	}else {
		gameselect = "socialGame";
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
            height: 98vh;
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
        .menu{
            width: 50%;
            height: 100%;
            min-width: 100px;
            text-decoration: none;
            color: black;
            border: 1px solid black;
            display: flex;
    		align-items: center;
    		justify-content: center;
        }
        #maincontent{
            width: 100%;
            border: 1px solid black;
        }
       
    </style>
    <title>Document</title>
</head>
<body>
<div id="contain">
    <div>
        <ul id="submenu">
            <a class="menu menu1" href="${pageContext.request.contextPath}/admin/gameselect?gameselect=socialGame"><li>소셜매치</li></a>
            <a class="menu menu2" href="${pageContext.request.contextPath}/admin/gameselect?gameselect=teamGame"><li>팀매치</li></a>
            <a class="menu menu3" href="${pageContext.request.contextPath}/admin/gameselect?gameselect=resultGame"><li>게임결과</li></a>
        </ul>
    </div>
    <div id="maincontent">
        <%
        	if(gameselect.equals("socialGame")){
        		%>
	    		  <jsp:include page="./socialGamelist.jsp"></jsp:include>
	    		<%
        	}else if(gameselect.equals("teamGame")){
        		%>
	    		  <jsp:include page="./teamGamelist.jsp"></jsp:include>
	    		<%
        	}
        	else if(gameselect.equals("resultGame")){
        		%>
	    		  <jsp:include page="./resultGamelist.jsp"></jsp:include>
	    		<%
        	}
        %>
    </div>
</div>
</body>
</html>