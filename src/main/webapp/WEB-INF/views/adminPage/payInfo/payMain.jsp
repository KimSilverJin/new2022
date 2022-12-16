<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
	String payselect = null;
	int count = (Integer)session.getAttribute("count");
	if(request.getParameter("payselect") != null) {
		payselect = (String)request.getParameter("payselect");
	}else {
		payselect = "pay";
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
            <a class="menu menu1" href="${pageContext.request.contextPath}/admin/payselect?payselect=pay"><li>결제내역</li></a>
            <a class="menu menu2" href="${pageContext.request.contextPath}/admin/payselect?payselect=cancel"><li>환불내역</li></a>            
        </ul>
    </div>
    <div id="maincontent">
        <%
        	if(payselect.equals("pay")){
        		%>
	    		  <jsp:include page="./paylist.jsp"></jsp:include>
	    		<%
        	}else if(payselect.equals("cancel")){
        		%>
	    		  <jsp:include page="./refundlist.jsp"></jsp:include>
	    		<%
        	}
        %>
    </div>
</div>
<script type="text/javascript">
if(<%=count%> > 0){
	alert("취소신청이" + <%=count%> + "건 있습니다");
}
    	
</script>
</body>
</html>