<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 관리</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>

<style type="text/css">
.container {
	margin-top: 1%;
}


table {
	border-collapse: collapse;
}

table tr th {
	width: 300px;
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
	width: 50%; 
	margin-right: 30px;
}
input{
	width : 100%;
}
	.menu1 {
		background-color: #f8ede3;
	}
</style>


</head>
<body>
	<h1>리뷰 관리</h1>
	<div class="container">

		<form
			action="${pageContext.request.contextPath}/admin/reviewselect?comuselect=review"
			id="form1" method="post">
			<div class="search1">
				<div class ="input">
				<input type="text" name="reviewcode" id="reviewcode"
					placeholder="찾으시는 유저코드를 입력하세요" />
				</div>
				<div class="button">
					<button id="chbtn">검색</button>
					
					<button class="delbtn" type="button">삭제</button>
				</div>
				
			</div>
		<!-- 	<div class="button2">
					<button class="delbtn" type="button">삭제</button>
			</div> -->


			<div class ="tablemain">
				<!-- </form>  -->
				<table>
					<thead>
						<tr>
							<th><input type="checkbox" name="allCheck" id="allCheck" /></th>
							<th>리뷰 번호</th>
							<th>유저 이름</th>
							<th>콘텐츠내용</th>
							<th>리뷰 날짜</th>
							<th>유저 코드</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${review}">
							<tr>
								<td><input class="reviewChkCode" type="checkbox"
									name="reviewChk" value="${vo.reviewCode}"></td>
								<td>${vo.reviewCode}</td>
								<td>${vo.userName}</td>
								<td>${vo.content}</td>
								<td>${vo.createDate}</td>
								<td>${vo.userCode}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</form>
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
		  $(".reviewChkCode").prop("checked", true);
		 } else {
		  $(".reviewChkCode").prop("checked", false);
		 }
		
		});
	</script>


	<script type="text/javascript">
	//개별 선택 버튼
		$('.reviewChkCode').click(function(){
			 $("#allCheck").prop("checked", false);			
		});
	</script>

	<script type="text/javascript">
	 $(".delbtn").click(function(){
		
		  var confirm_val = confirm("정말 삭제하시겠습니까?");
		 
		  if(confirm_val) {
		   var checkArr = new Array();
		  
		
		   
		   $("input[class='reviewChkCode']:checked").each(function(){
		    checkArr.push($(this).attr("value"));
		    console.log(checkArr);
		   });
		   
		   var reviewChkCode = new Array();
		   $.ajax({
		    url : "${pageContext.request.contextPath}/admin/reviewdelete",
		    type : "POST",
		  
		    data : { reviewChkCode : checkArr },
		    success : function(result){
	    	 if(result == 1) {          
	    		 location.href="${pageContext.request.contextPath}/admin/comuselect?comuselect=review";
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