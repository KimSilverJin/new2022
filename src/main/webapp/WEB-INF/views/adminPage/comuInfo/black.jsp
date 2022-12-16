<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<style type="text/css">
.containermain {
	margin-top: 1%;
}
	.menu2 {
		background-color: #f8ede3;
	}

table {
	border-collapse: collapse;
}

table tr th {
	width: 500px;
	height: 50px;
	border-bottom: 2px solid #D2D79F;
	background-color: #F8EDE3;
}

table tr td {
	height: 40px;
	text-align: center;
	border-bottom: 2px dotted #D2D79F;
}

table tr th:nth-child(1) {
	width: 40px;
}

table tr th:nth-child(2) {
	width: 95px;
}

table tr th:nth-child(5) {
	width: 220px;
}

#allCheck {
	width: 20px;
	height: 30px;
}

.chBox {
	width: 20px;
	height: 30px;
}

#chbtn:hover {
	font-weight: 700;
	background-color: #42855B;
	cursor: pointer;
	color: white;
}


.delbtn:hover {
	font-weight: 700;
	background-color: #42855B;
	cursor: pointer;
	color: white;
}

#reviewcode {
	height: 37px;
}

.search1 {
	display: flex;
	height: 8vh;
	padding-right: 10px;
	justify-content: flex-end;
}

.tablemain{
	width : 100%;
	display: flex;
	justify-content: center;
}

button{
border : 1px solid black;
border-radius : 5px;
width : 8vh;
height: 4vh;
}

.input{
	width: 100%; 
	margin-right: 30px;
	margin: 5px;
}

#search{
width: 100%; 
height :30px;
margin: 5px;
}

#blacklocal{
	width: 100%; 
	height : 27px;
	margin: 5px;
}



.TCRHcon{
	display : flex;
	justify-content: space-between;
}

.searchmenu{
	   width: 40%;
}
</style>

</head>
<body>
<h1>블랙리스트 게시글 관리</h1>
<div class ="container">
<div class="TCRcontainer">
		<form action="${pageContext.request.contextPath}/admin/blackselect?comuselect=black" method="post">
			<div class="TCRHcon">
				<div class = "searchmenu">
				
				<div class="selectMenu">
					<select name="blacklocal" id="blacklocal">
						<option id="null" value="null">카테고리</option>
						<option id="local" value="local">지역</option>
						<option id="buserName" value="buserName">유저네임</option>
						<option id="userCode" value="userCode">유저코드</option>
						<option id="blackuserCode" value="blackuserCode">신고대상유저코드</option>
					</select> 
				</div>
				
					<div class="text">
						<input type="text" name="search" id="search" placeholder="카테고리에 맞게 단어를 검색하세요" />
					</div>
				</div>
					
					<div class="button">
					<button class="ch">검색</button>
						<button class="deletebtn">삭제</button>
					</div>	
					
								
			</div>	
			
</form>
</div>

<div class="containermain">

			<table>
				<thead>
					<tr>
					<th><input type="checkbox" name="allCheck" id="allCheck" /></th>
						<th>글 번호</th>
						<th>글쓴이</th>
						<th>제목</th>
					<!-- 	<th>내용</th>  -->
						<th>지역</th>
						<th>작성일/작성시간</th>
						<th>유저코드</th>
						<th>신고대상유저코드</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list}">
						<%-- <c:if test="${vo.isDelete == 1}"> --%>
						<tr>
							<td><input class="blackChkCode" type="checkbox"
									name="blakcChk" value="${vo.blacklistCode}"></td>
							<td>${vo.blacklistCode}</td>
							<td>${vo.buserName}</td>
							<td><a
								href="${pageContext.request.contextPath}/blacklist/blacklistmain/${vo.blacklistCode}">${vo.blacklistTitle}</a></td>
					<!-- 	<td>${vo.blacklistContent}</td>  -->	
							<td>${vo.blacklistLocal}</td>
							<td>${vo.blacklistCreateDate}</td>
							<td>${vo.userCode}</td>
							<td>${vo.blackuserCode}</td>
							
						</tr>
						<%-- 	</c:if> --%>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<script type="text/javascript">
	/*검색 버튼*/
		$("#chbtn").click(function(){
			
		});
	</script>

	<script type="text/javascript">
	/* 전체 선택 버튼 */
	$("#allCheck").click(function(){
		 
		 var chk = $("#allCheck").prop("checked");
		 if(chk) {
		  $(".blackChkCode").prop("checked", true);
		 } else {
		  $(".blackChkCode").prop("checked", false);
		 }
		
		});
	</script>


	<script type="text/javascript">
	//개별 선택 버튼
		$('.blackChkCode').click(function(){
			 $("#allCheck").prop("checked", false);			
		});
	</script>

	<script type="text/javascript">
	 $(".deletebtn").click(function(){
		
		  var confirm_val = confirm("정말 삭제하시겠습니까?");
		 
		  if(confirm_val) {
		   var checkArr = new Array();
		  
		
		   
		   $("input[class='blackChkCode']:checked").each(function(){
		    checkArr.push($(this).attr("value"));
		    console.log(checkArr);
		   });
		   
		   var blackChkCode = new Array();
		   $.ajax({
		    url : "${pageContext.request.contextPath}/admin/blacklistdelete",
		    type : "POST",
		  
		    data : { blackChkCode : checkArr },
		    success : function(result){
	    	 if(result == 1) {          
	    		 location.href="${pageContext.request.contextPath}/admin/comuselect?comuselect=black";
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