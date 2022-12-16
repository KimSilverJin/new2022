<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String subselect = null;
	if(request.getParameter("subselect") != null) {
		subselect = (String)request.getParameter("subselect");
	}else {
		subselect = "socialMatch";
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
            <a class="menu menu1" href="${pageContext.request.contextPath}/admin/subselect?subselect=socialMatch"><li>소셜매치 신청 현황</li></a>
            <a class="menu menu2" href="${pageContext.request.contextPath}/admin/subselect?subselect=teamMatch"><li>팀매치 신청 현황</li></a>
            <a class="menu menu3" href="${pageContext.request.contextPath}/admin/subselect?subselect=cancel"><li>취소 현황</li></a>
        </ul>
    </div>
    <div id="maincontent">
        <%
        	if(subselect.equals("socialMatch")){
        		%>
	    		  <jsp:include page="./sociallist.jsp"></jsp:include>
	    		<%
        	}else if(subselect.equals("teamMatch")){
        		%>
	    		  <jsp:include page="./teamlist.jsp"></jsp:include>
	    		<%
        	}
        	else if(subselect.equals("cancel")){
        		%>
	    		  <jsp:include page="./cancellist.jsp"></jsp:include>
	    		<%
        	}
        %>
    </div>
</div>
</body>
</html>