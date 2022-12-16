<%@page import="com.sample.vo.UserVO"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String select = null;
	int count = 0;
	if(session.getAttribute("select") != null) {
		select = (String)session.getAttribute("select");
		count = 0;
	}else {
		select = "userAdmin";
		count = (Integer)session.getAttribute("count");
	}
	UserVO uvo= (UserVO)session.getAttribute("sessionVO");
	
	
%> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
<style>
     *{
        box-sizing: border-box;
        margin: 0;
      
     }
     .Mcontainer{
        display: flex;
        justify-content: center;
        align-items: center;
        border: 1px solid black;
        width: 100vw;
        height: 100vh;
        background-color: beige;
     }
     .subcontainer{
        display: flex;
        width: 85%;
        height: 85%;
        background-color: white;
     }
     .main{
        flex : 1;
        border: 1px solid black;
     }
     .main .menubar{
        display: flex;
        flex-direction: column;
        width: 100%;
        height: 100%;
     }
     .main .menubar .profile{
        flex : 1;
        border: 1px solid black;
        display: flex;
        justify-content: center;
        align-items: center;
     }
     .proflie{
        display: flex;
     
     }
     .pleft {
        flex : 0.7;
        border: 1px solid black;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding : 5px 0;

     }
     .pleft_title{
        flex : 1;
     }
     .pleft_img{
        flex : 3;
        width: 90%;
        border: 1px solid black;
        background : url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtR1s7QOKUU_L-3QWFgPsz9xXRl2Q-4FtL1Q&usqp=CAU") no-repeat center;
     }
     .pright{
        flex: 1;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        line-height: 30px;
     }
     .main .menubar .navmenu {
        flex: 4;
     }
     .navmenu ul {
        width: 100%;
        list-style-type: none;
        line-height: 400%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: flex-start;
        padding: 0;
     }
     .navmenu ul li {
        border: 1px solid pink;
        width: 100%;
        padding: 0 20px;
     }
     .navmenu ul li:hover {
       background-color: #26a563;
       transition: all 0.4s linear;
       font-size: 25px;
       cursor: pointer;
     }
     .navmenu ul a{
        width: 100%;
        height: 100%;
        text-decoration: none;
        font-size: 20px;
        color : black;
     }
     #content{
        flex:4;
        border: 1px solid black;
    	overflow-y: scroll;
     }
</style>
<body>
    <div class="Mcontainer">
        <div class="subcontainer">
            <div class="main">
                <div class="menubar">
                    <div class="profile">
                        <div class="pleft">
                            <div class="pleft_title">
                               <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/image/ez_logo1.svg" /></a>
                            </div>
                            <div class="pleft_img">
                      
                            </div>
                        </div>
                        <div class="pright">
                        <p>'<%=uvo.getUserName() %>'관리자님</p>
                        <p>환영합니다</p>
                        </div>
                    </div>
                    <div class="navmenu">
                        <ul>
                            <a href="${pageContext.request.contextPath}/admin/select?select=userAdmin"><li>유저관리</li></a>
                            <a href="${pageContext.request.contextPath}/admin/select?select=magAdmin"><li>매니저관리</li></a>
                            <a href="${pageContext.request.contextPath}/admin/select?select=rankAdmin"><li>랭킹관리</li></a>
                            <a href="${pageContext.request.contextPath}/admin/select?select=rvAdmin"><li>예약관리</li></a>
                            <a href="${pageContext.request.contextPath}/admin/select?select=signUpAdmin"><li>신청관리</li></a>
                            <a href="${pageContext.request.contextPath}/admin/select?select=gameAdmin"><li>경기관리</li></a>
                            <a href="${pageContext.request.contextPath}/admin/select?select=fieldAdmin"><li>구장관리</li></a>
                            <a href="${pageContext.request.contextPath}/admin/select?select=comuAdmin"><li>커뮤니티관리</li></a>
                            <a href="${pageContext.request.contextPath}/admin/select?select=payAdmin"><li>결제관리</li></a>
                            <a href="${pageContext.request.contextPath}/admin/select?select=adminset"><li>문의관리</li></a>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="content">
        <%
        	if (select.equals("userAdmin")){
	    		%>
	    		  <jsp:include page="./userInfo/userMain.jsp"></jsp:include>
	    		<%
    		}else if (select.equals("magAdmin")){
    			%>
        		 <jsp:include page="./magInfo/magMain.jsp"></jsp:include>
        		<%
        	}else if (select.equals("rankAdmin")){
        		%>
        		<jsp:include page="./rankInfo/rankMain.jsp"></jsp:include>
        		<%
        	}else if (select.equals("rvAdmin")){
        		%>
        		<jsp:include page="./reserInfo/reserMain.jsp"></jsp:include>
        		<%
        	}else if (select.equals("signUpAdmin")){
        		%>
        		<jsp:include page="./subInfo/subMain.jsp"></jsp:include>
        		<%
        	}else if (select.equals("gameAdmin")){
        		%>
        		<jsp:include page="./gameInfo/gameMain.jsp"></jsp:include>
        		<%
        	}else if (select.equals("fieldAdmin")){
        		%>
        		<jsp:include page="./fieldInfo/fieldMain.jsp"></jsp:include>
        		<%
        	}else if (select.equals("comuAdmin")){
        		%>
        		<jsp:include page="./comuInfo/comuMain.jsp"></jsp:include>
        		<%
        	}else if (select.equals("payAdmin")){
        		%>
        		<jsp:include page="./payInfo/payMain.jsp"></jsp:include>
        		<%
        	}
        	else if (select.equals("adminset")){
        		%>
        		<jsp:include page="./adminSet/adminset.jsp"></jsp:include>
        		<%
        	}
        %>
           
        </div>
        </div>
    </div>
    <script type="text/javascript">
    window.onload = function(e) {
    	if(<%=count%> > 0){
    		alert("취소신청이" + <%=count%> + "건 있습니다");
    	}
    }
    	
    </script>
</body>
</html>