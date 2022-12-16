<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String sub_p = request.getParameter("subPage");
		if(sub_p == null){
			sub_p="sub1";
		}
	System.out.println("서브메인 subPage값 :"+sub_p);

	session.removeAttribute("pagenum");
	session.removeAttribute("serch");
	session.removeAttribute("select");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>

        #contain{
            display: flex;
            flex-direction: column;
            width: 98%;
            margin: 0 auto;
            height: 98vh;
        }
        #submenu_area {
            border-bottom: 2px solid #26a653;
        }
        #submenu{
            display: flex;
            align-items: center;
    		width: 50%;
            min-width: 200px;
            height: 50px;
            list-style: none;
            margin: 0;
            padding:5px 0 0 0;
            text-align: center;
            font-weight: bold;
        }
        .sub_menu{
            height: 100%;
            min-width: 100px;
            text-decoration: none;
            color: black;
            display: flex;
    		align-items: center;
    		justify-content: center;
    		padding: 0px 20px;
        }

        #maincontent{
            width: 100%;
        }
        
        .menu2_a {
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
            <a class="sub_menu sub_menu1" href="${pageContext.request.contextPath}/manager/manager?page=subMain&subPage=sub1"><li>소셜매치 신청 현황</li></a>
            <a class="sub_menu sub_menu2" href="${pageContext.request.contextPath}/manager/manager?page=subMain&subPage=sub2"><li>팀매치 신청 현황</li></a>
            <a class="sub_menu sub_menu3" href="${pageContext.request.contextPath}/manager/manager?page=subMain&subPage=sub3"><li>취소 현황</li></a>
        </ul>
    </div>
    <div id="maincontent">
        <%
        	if(sub_p.equals("sub1")){
        		%>
	    		  <jsp:include page="./sociallist.jsp"></jsp:include>
	    		<%
        	}else if(sub_p.equals("sub2")){
        		%>
	    		  <jsp:include page="./teamlist.jsp"></jsp:include>
	    		<%
        	}
        	else if(sub_p.equals("sub3")){
        		%>
	    		  <jsp:include page="./cancellist.jsp"></jsp:include>
	    		<%
        	}
        %>
    </div>
</div>
</body>
</html>