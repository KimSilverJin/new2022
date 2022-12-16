<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fieldInfo.css" />
</head>
<body>
	<div class="modify_content_area">
	<h1>구장 수정</h1>
			<c:forEach var="item" items="${list}">
	        <form:form modelAttribute="${item}" action="${pageContext.request.contextPath}/admin/fieldModify?select=fieldAdmin" method="post">
	        	<div class="content">
	        		
					<div class="field_info">
							<form:hidden path="fieldCode"/>
							
							<label for="fieldName">구장명 : </label>
							<form:input path="fieldName" class="form_input" disabled="disabled"/>
							<br />
							<label for=fieldAddress>구장주소 : </label>
							<form:input path="fieldAddress" class="form_input" />
							<br />
							<label for="fieldType">구장형태 : </label>
							<form:input path="fieldType" class="form_input"/>
							<br />
							<label for="fieldCall">구장연락처 : </label>
							<form:input path="fieldCall" class="form_input"/>
							<br />
							<label for="fieldRentalfee">구장비용 : </label>
							<form:input path="fieldRentalfee" class="form_input"/>
							<br />							
							<label for="fieldGrass">특이사항1 : </label>
							<form:input path="fieldGrass" class="form_input"/>
							<br />
							<label for="fieldInOut">특이사항2 : </label>
							<form:input path="fieldInOut" class="form_input"/>
							<br />
							<label for="fieldImg1">이미지1 : </label>
							<form:input path="fieldImg1" class="form_input"/>
							<br />
							<label for="fieldImg2">이미지2 : </label>
							<form:input path="fieldImg2" class="form_input"/>
							<br />
							<label for="fieldImg3">이미지3 : </label>
							<form:input path="fieldImg3" class="form_input"/>
							<br />
							<label for="fieldImg4">이미지4 : </label>
							<form:input path="fieldImg4" class="form_input"/>
							<br />
							<label for="fieldImg5">이미지5 : </label>
							<form:input path="fieldImg5" class="form_input"/>
							<br />
						</div>
				</div>
						<div class="button_area"> <button id="modify_btn">수정</button> </div>
			</form:form>
		</c:forEach>
	 </div>
	 <script type="text/javascript">
	 	let modify_btn = document.getElementById("modify_btn");
	 	
	 	modify_btn.addEventListener("click",function() {
	 		location.href = "${pageContext.request.contextPath}/admin/fieldselect";
	 	});
	 	
	 </script>
	     
	
</body>
</html>