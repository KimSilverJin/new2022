<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	String reserselect = null;
	if(request.getParameter("reserselect") != null) {
		reserselect = (String)request.getParameter("reserselect");
	}else {
		reserselect = "teamMatch";
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
            width: 45%;
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
            display: flex;
    		justify-content: center;
        }
    </style>
    <title>Document</title>
</head>
<body>
<div id="contain">
    <div>
        <ul id="submenu">
            <a class="menu menu1" href="${pageContext.request.contextPath}/admin/reserselect?reserselect=teamMatch"><li>팀매치 예약현황</li></a>
            <a class="menu menu2" href="${pageContext.request.contextPath}/admin/reserselect?reserselect=Tcancel"><li>팀매치 예약취소</li></a>
            <a class="menu menu3" href="${pageContext.request.contextPath}/admin/reserselect?reserselect=rvField"><li>구장 예약현황</li></a>
            <a class="menu menu4" href="${pageContext.request.contextPath}/admin/reserselect?reserselect=Gcancel"><li>구장 예약취소</li></a>
        </ul>
    </div>
    <div id="maincontent">
        <%
        	if(reserselect.equals("teamMatch")){
        		%>
	    		  <jsp:include page="./teamreserlist.jsp"></jsp:include>
	    		<%
        	}else if(reserselect.equals("Tcancel")){
        		%>
	    		  <jsp:include page="./Tcancel.jsp"></jsp:include>
	    		<%
        	}else if(reserselect.equals("rvField")){
        		%>
	    		  <jsp:include page="./fieldreserlist.jsp"></jsp:include>
	    		<%
        	}else if(reserselect.equals("Gcancel")){
        		%>
	    		  <jsp:include page="./Gcancel.jsp"></jsp:include>
	    		<%
        	}
        %>
    </div>
</div>
</body>
</html>