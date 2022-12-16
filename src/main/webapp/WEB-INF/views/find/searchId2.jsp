<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW 찾기</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
</head>
<body>
	<h1>${userVO.userName }님이</h1>
	<h1>가입하신 아이디는  [${userVO.userId}] 입니다.</h1>
	<a href="${pageContext.request.contextPath}/find/findPw">비밀번호 찾기</a>
	<a href="${pageContext.request.contextPath}/">메인으로 돌아가기</a>
</body>
</html>