<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String rank_p = request.getParameter("rankPage");
	if(rank_p == null ){
		rank_p="rank1";
	}

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
        .score_menu{
            width: 50%;
            height: 100%;
            min-width: 100px;
            text-decoration: none;
            display: flex;
          	align-items: center;
          	justify-content: center;
        }
        #maincontent{
            width: 100%;
        }
        
        .menu1_a {
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
            <a class="score_menu sub_menu1" href="${pageContext.request.contextPath}/manager/manager?page=ranking&rankPage=rank1"><li>점수관리</li></a>
        </ul>
    </div>
    <div id="maincontent">
        <%
           if(rank_p.equals("rank1")){
              %>
               <jsp:include page="./score.jsp"></jsp:include>
             <%
           }
        %>
    </div>
</div>
</body>
</html>