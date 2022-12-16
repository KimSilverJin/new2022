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
<style>
	.menu3 {
		background-color: #f8ede3;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>블랙리스트 신고 현황 및 블랙리스트 관리</h1>
		<form
			action="${pageContext.request.contextPath}/admin/reviewselect?comuselect=report"
			id="form1" method="post">
			<div class="button">
				<button class="checkbtn" type="button">블랙리스트 승인</button>

				<button class="clearbtn" type="button">블랙리스트 해제</button>
			</div>

		</form>



		<div class="tablemain">
			<!-- </form>  -->
			<table>
				<thead>
					<tr>
						<th><input type="checkbox" name="allCheck" id="allCheck" /></th>
						<th>유저 코드</th>
						<th>유저 이름</th>
						<th>신고 횟수</th>
						<th>블랙리스트 현황</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${black}">
						<tr>
							<td><input class="blakcChkCode" type="checkbox"
									name="blackChk" value="${vo.blackuserCode}"></td>
							<td>${vo.blackuserCode}</td>
							<td>${vo.userName}</td>
							<td>${vo.count}</td>
							<td>${vo.userBlack}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>

	<script type="text/javascript">
	/* 전체 선택 버튼 */
	$("#allCheck").click(function(){
		 
		 var chk = $("#allCheck").prop("checked");
		 if(chk) {
		  $(".blakcChkCode").prop("checked", true);
		 } else {
		  $(".blakcChkCode").prop("checked", false);
		 }
		
		});
	</script>


	<script type="text/javascript">
	//개별 선택 버튼
		$('.blakcChkCode').click(function(){
			 $("#allCheck").prop("checked", false);			
		});
	</script>

	<script type="text/javascript">
	 $(".checkbtn").click(function(){
		
		  var confirm_val = confirm("블랙리스트로 유저로 승인하시겠습니까?");
		 
		  if(confirm_val) {
		   var checkArr = new Array();
		  
		
		   
		   $("input[class='blakcChkCode']:checked").each(function(){
		    checkArr.push($(this).attr("value"));
		    console.log(checkArr);
		   });
		   
		   var reviewChkCode = new Array();
		   $.ajax({
		    url : "${pageContext.request.contextPath}/admin/blackcheck",
		    type : "POST",
		  
		    data : { blakcChkCode : checkArr },
		    success : function(result){
	    	 if(result == 1) {   
	    		 location.href="${pageContext.request.contextPath}/admin/comuselect?comuselect=signUp";
    		  } else {
    		    alert("변경 실패"); 
    		  }
    		 },
    		 error : function(e){
					alert(e);
					
    		 }
    		});
		   }
     });
	</script>
	
	<script type="text/javascript">
	 $(".clearbtn").click(function(){
		
		  var confirm_val = confirm("블랙리스트로 유저에서 해제하시겠습니까?");
		 
		  if(confirm_val) {
		   var checkArr = new Array();
		  
		
		   
		   $("input[class='blakcChkCode']:checked").each(function(){
		    checkArr.push($(this).attr("value"));
		    console.log(checkArr);
		   });
		   
		   var reviewChkCode = new Array();
		   $.ajax({
		    url : "${pageContext.request.contextPath}/admin/blackclear",
		    type : "POST",
		  
		    data : { blakcChkCode : checkArr },
		    success : function(result){
	    	 if(result == 1) {        
	    		 location.href="${pageContext.request.contextPath}/admin/comuselect?comuselect=signUp";
    		  } else {
    		    alert("변경 실패"); 
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