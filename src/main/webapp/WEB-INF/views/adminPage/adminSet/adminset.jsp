<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
	String adminselect = null;
	if(request.getParameter("adminselect") != null) {
		adminselect = (String)request.getParameter("adminselect");
	}else {
		adminselect = "qna";
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
            <a class="menu menu1" href="${pageContext.request.contextPath}/admin/adminselect?adminselect=qna"><li>문의대기</li></a>
            <a class="menu menu2" href="${pageContext.request.contextPath}/admin/adminselect?adminselect=qnafinish"><li>문의완료</li></a>
        </ul>
    </div>
    <div id="maincontent">
        <%
        	if(adminselect.equals("qna")){
        		%>
	    		  <jsp:include page="./qna.jsp"></jsp:include>
	    		<%
        	}else if(adminselect.equals("qnafinish")){
        		%>
	    		  <jsp:include page="./qnafinish.jsp"></jsp:include>
	    		<%
        	}
        %>
    </div>
</div>
</body>
</html>