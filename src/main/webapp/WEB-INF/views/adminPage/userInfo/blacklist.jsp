<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
<title>블랙리스트 현황</title>
<style type="text/css">
	.TCRcontainer{
		margin-top: 1%;
	}
	.TCRHcon{
		display: flex;
	    width: 100%;
	    height: 30px;
	    justify-content: space-between;
	    margin-bottom: 1%;
	    padding: 10px 0px;
    	box-sizing: content-box;
	}
	.TCRselectMenu{
		width: 10%;
	    display: flex;
	}
	.TCRoption {
		display: flex;
		width:70%;
	}
	#Uselect{
		width: 100%;
    	border: 1px solid #000;
	}
	.TCRsearch{
    	width: 100%;
	}
	.TCRsearchArea{
		display: flex;
	    width: 50%;
	}
	#Usearch{
		width: 100%;
    	height: 30px;
    	border: 1px solid black;
    	padding-left : 15px;
	}

	table {
		border-collapse : collapse;
		
	}
	table tr th {
		width : 120px;
		height : 50px;
		border-bottom : 2px solid #D2D79F;
		background-color : #F8EDE3;
	}
	table tr td {
		height : 40px;
		text-align : center;
		border-bottom : 2px dotted #D2D79F;
	}
	
	table tr th:nth-child(1){
		width:40px;
	}
	table tr th:nth-child(2){
		width:95px;
	}
	table tr th:nth-child(5){
		width:220px;
	}
	
		
	#allCheck{
		width: 20px;
   		height: 30px;
	}
	.chBox{
		width: 20px;
    	height: 30px;
	}
		
	.TCRbutton{
		height: 30px;
	    justify-content: center;
	    display: flex;
	    align-items: center;
	   	width: 125px;
	    margin-left: 1%;
	}
	#TCRbtn{
    	color: black;
    	height: 30px;
	    background-color: #BDD2B6;
	    border: none;
	    border-radius: 10px;
	    width: 100%;
	}
	#TCRbtn:hover{
		cursor : pointer;
		background-color : #42855B;
		font-weight : 700;
		color:white;
	}
	
	.Tdeletebtn{
	    background-color: #BDD2B6;
    	border: 0px;
    	border-radius: 10px;
    	margin-bottom: 1%;
    	width: 100%;
    	height: 100%;
	}
	.Tdeletebtn:hover {
		font-weight : 700;
		background-color : #42855B;
		cursor : pointer;
		color:white;
	}
	.menu2 {
		background-color: #f8ede3;
	}
</style>
</head>
<body>
	<div class="TCRcontainer">
		<form action="${pageContext.request.contextPath}/admin/idselect1" method="post">
			<div class="TCRHcon">
				<div class="TCRselectMenu">
					<select name="Uselect" id="Uselect">
						<option value="">카테고리</option>
						<option value="userCode">유저코드</option>
						<option value="userName">유저이름</option>
						<option value="userId">유저아이디</option>
						<option value="userBirth">유저생일</option>
						<option value="userGender">유저성별</option>
						<option value="userAuthority">회원등급</option>
						<option value="userReports">신고당한횟수</option>
						<option value="userStatus">활성화여부</option>
					</select>
				</div>
				<div class="TCRoption">
					<div class="TCRsearch">
						<input type="text" name="Usearch" id="Usearch" placeholder="카테고리에 맞게 단어를 검색하세요" />
					</div>
					<div class="TCRbutton">
						<button id="TCRbtn">검색</button>
					</div>
					<div class="TCRbutton">
						<button class="Udeletebtn">블랙리스트해제</button>
					</div>				
				</div>	
			</div>
		

		<div class="TcontentCon">
			<table>
				<thead>
					<tr>
						<th><input type="checkbox" name="allCheck" id="allCheck" /></th>
						<th>유저코드</th>
						<th>유저이름</th>
						<th>유저아이디</th>
						<th>유저생일</th>
						<th>유저성별</th>
						<th>유저지역</th>						
						<th>회원등급</th>
						<th>블랙여부</th>
						<th>신고당한횟수</th>
						<th>활성화여부</th>						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="UL" items="${userListB}">
						<tr>
							<td><input type="checkbox" name="chBox" class="chBox" data-userCode="${UL.userCode}" /></td>
							<td>${UL.userCode}</td>
							<td>${UL.userName }</td>							
							<td>${UL.userId}</td>
							<td>${UL.userBirth }</td>	
							<td>${UL.userGender }</td>	
							<td>${UL.userLocal}</td>																			
							<td>${UL.userAuthority }</td>
							<td>${UL.userBlack }</td>
							<td>${UL.userReports }</td>
							<td>${UL.userStatus }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		</form>
	</div>
							
	<script type="text/javascript">
	/* 전체 선택 버튼 */
	$("#allCheck").click(function(){
		 
		 var chk = $("#allCheck").prop("checked");
		 if(chk) {
		  $(".chBox").prop("checked", true);
		 } else {
		  $(".chBox").prop("checked", false);
		 }
		
		});
	</script>
	
	<script type="text/javascript">
	/* 개별 선택 버튼 */
	 $(".chBox").click(function(){
		  $("#allCheck").prop("checked", false);
		 });
	</script>
	
	<script type="text/javascript">
	 $(".Udeletebtn").click(function(){
		
		  var confirm_val = confirm("정말 삭제하시겠습니까?");
		 
		  if(confirm_val) {
		   var checkArr = new Array();
		  
		
		   
		   $("input[class='chBox']:checked").each(function(){
		    checkArr.push($(this).attr("data-userCode"));
		    console.log(checkArr);
		   });
		   console.log("123131231"); 
		   
		   var chbox = new Array();
		   $.ajax({
		    url : "${pageContext.request.contextPath}/admin/TdeleteList",
		    type : "POST",
		  
		    data : { chbox : checkArr },
		    success : function(result){
	    	 if(result == 1) {          
// 	    		   location.href = "${pageContext.request.contextPath}/admin/magselect";
    		  } else {
    		   alert("삭제 실패");
    		  }
    		 },
    		 error : function(e){
					alert(e);
					
    		 }
    		});
		   }
     });
	</script>
</body>
</html>