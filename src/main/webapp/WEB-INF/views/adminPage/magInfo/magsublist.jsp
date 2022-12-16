<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<style>
	*{
		box-sizing: border-box;
		margin: 0;
	}
    .menu2 {
		background-color: #f8ede3;
	}
	#main_container{
		display: flex;
		flex-direction: column;
		padding: 15px;
	}
	
	.btn_box{
		width:10%;
		align-self: flex-end;
	}
	
	.btn{
    	color: #fff;
    	height: 30px;
	    background-color: #26a563;
	    border: none;
	    border-radius: 10px;
/* 	    width: 45%; */
	    cursor: pointer;
	    min-width: 50px;
 	    font-size: 12px;
	}
	
	#manager_history{
		width: 100%;
		border-collapse: collapse;
		font-size: 14px;
		margin: 20px 0;
	}
	
	#manager_history th, td {
		height: 40px;
	    text-align: center;
	    border-bottom: 2px dotted #D2D79F;
	}
	
	#manager_history th {
		background-color: #F8EDE3;
		height: 50px;
    	border-bottom: 2px solid #D2D79F;
	}
	
	#check, #ck{
		width: 20px;
   		height: 30px;
	}
	
</style>
<body>
	<div id="main_container">
		<div class="btn_box">
			<button id="pass" class="btn">�հ�</button>
			<button id="fail" class="btn">���հ�</button>
		</div>
		<table id="manager_history">
			<tr>
				<th><input type="checkbox" name="check" id="check" /></th>
				<th>��û��ȣ</th>
				<th>���ñ���</th>
				<th>��û����</th>
				<th>��û��</th>
				<th>�����ڵ�</th>
				<th>�����̸�</th>
<!-- 				<th>���ǻ���</th> -->
			</tr>
			<c:forEach var="list" items="${managerVO}">
			<tr class="item_box">
				<td><input type="checkbox" name="ck" id="ck" class="ck" data-gameCode="${list.mgrCode}" /></td>
				<td>${list.mgrCode}</td>
				<td>${list.preferArea}</td>
				<td>${list.mgrContent}</td>
				<td>${list.mgrDate}</td>
				<td>${list.userCode}</td>
				<td>${list.userName}</td>
<%-- 				<td>${list.mgrState}</td> --%>
			</tr>				
			</c:forEach>
		</table>
	</div>
	
	<script type="text/javascript">
		$("#check").click(function(){	 
			 if($("#check").prop("checked")) {
			  $(".ck").prop("checked", true);
			 } else {
			  $(".ck").prop("checked", false);
			 }
		});
		
		$(".ck").click(function(){
			$("#check").prop("checked", false);
		});
		
		// �Ŵ��� ���
		$('#pass').click(function(){
			var confirm_val = confirm("�Ŵ����� ����Ͻðڽ��ϱ�?");
			 
			if(confirm_val) {
				var checkArr = new Array();
				  
				$("input[class='ck']:checked").each(function(){
				    checkArr.push($(this).attr("data-gameCode"));
				});
				   
				   var chbox = new Array();
				   $.ajax({
				    url : "${pageContext.request.contextPath}/admin/magPass",
				    type : "POST",
				  
				    data : { chbox : checkArr },
				    success : function(result){
			    	 if(result == 1) {      
			    		 location.href = "${pageContext.request.contextPath}/admin/magselect?magselect=magSignUpList";
		    		  } else {
		    		   alert("���� ����");
		    		  }
		    		 },
		    		 error : function(){
		    			 alert("�հ��� ������ �ο��� üũ���ּ���");
		    		 }
		    		});
				   }
		});
		
		// �Ŵ��� Ż��
		$('#fail').click(function(){
			var confirm_val = confirm("�Ŵ��� ���հ� ó���� �����Ͻðڽ��ϱ�?");
			 
			if(confirm_val) {
				var checkArr = new Array();
				  
				$("input[class='ck']:checked").each(function(){
				    checkArr.push($(this).attr("data-gameCode"));
				});
				   
				   var chbox = new Array();
				   $.ajax({
				    url : "${pageContext.request.contextPath}/admin/magFail",
				    type : "POST",
				  
				    data : { chbox : checkArr },
				    success : function(result){
			    	 if(result == 1) {      
			    		 location.href = "${pageContext.request.contextPath}/admin/magselect?magselect=magSignUpList";
		    		  } else {
		    		   alert("���� ����");
		    		  }
		    		 },
		    		 error : function(){
		    			 alert("���հ��� ������ �ο��� üũ���ּ���");
		    		 }
		    		});
				   }
		});
	</script>
</body>
</html>