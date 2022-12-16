<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

  <%
//     String clientId = "poD0EBSOvA7nhaA84Yi5";//애플리케이션 클라이언트 아이디값";
//     String redirectURI = URLEncoder.encode("http://localhost:8080/EZFootBall/home", "UTF-8");
//     SecureRandom random = new SecureRandom();
//     String state = new BigInteger(130, random).toString();
//     String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
//          + "&client_id=" + clientId
//          + "&redirect_uri=" + redirectURI
//          + "&state=" + state;
//     session.setAttribute("state", state);

	String isUser = request.getParameter("isUser");
	String black = request.getParameter("black");
	System.out.println(isUser);
	System.out.println(black);
	
// 	if(isUser == null){
		
// 	}
	
 %>
    <%
    	request.setCharacterEncoding("utf-8");

    	String id_ck = "";
    	String val = "";
    	
    	Cookie[] cookies = request.getCookies();

        	for(Cookie cookie : cookies) {
        		if(cookie.getName().equals("userId")){
        			val = cookie.getValue();
        		}
        	}
        	
        	for(Cookie cookie : cookies) {
        		if(cookie.getName().equals("id_ck")){
        			id_ck = cookie.getValue();
        		}
        	}

    %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>로그인 페이지</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
    <style>
        * {
            box-sizing: border-box;
            margin:0;
        }
        body {
            background-size:cover;
            width: 100%;
            height: 100%;
            color: #999;
			background-color: #fff;
        }
        
        .inner_container {
	        width: 100%;
	        margin: 0 auto;
	        display: flex;
	        flex-direction: column;
	        justify-content: center;
    	}
		
	    .main_title {
	    	display: flex;
	    	flex-direction: column;
	    	font-family: 'Happiness-Sans-Title';
    		margin-bottom: 60px;
	    }
	    
	    .title1 {
	    	font-size:30px;
	    	color:#2A2A2A;
	    }
	    .title2 {
	    	font-size:35px;
	    	color:#26A653;
	    	font-weight: bold;
	    }
		
        .content {
		    display: flex;
		    flex-direction: column;
		    height: 765px;
		    margin: auto;
		    padding-bottom: 60px;
    		padding-top: 185px;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            
        }
        .input {
			display: flex;
			width: 350px;
   			height: 55px;
			margin: 5px 0px;
    		border: 1px solid #898989;
			background-color: #fff;
			padding: 8px 17px;
			border-radius: 5px;
			font-size: 12px;
			color: #000;
    
        }
        .radio_label {
			margin: 0;
			text-align: left;
			display: flex;
			justify-content: left;
			margin-top: 5px;
			color: #999999;
			font-size: 12px;
        }
        .radio {
			display: flex;
			margin-right: 5px;
			width: 10px;
            
        }
        #login {
            width: 350px;
			height: 55px;
			background-color: #26A653;
			border: 0;
			border-radius: 3px;
			color: white;
			margin: 10px 0px;
        }
        a {
            text-decoration: none;
			color: #999;
			font-size: 11px;
			margin-bottom: 13px;
    		margin-top: 6px;
        }
        .id_footer {
        	display:flex;
            width: 100%;
            justify-content: space-around;
        }

        .id_foot {
            display: flex;
        }
        #sign_up {
		    border: 1px solid #707070;
		    color: #2a2a2a;
		    width: 85px;
		    height: 25px;
		    border-radius: 10px;
		    background-color: #fff;
		    cursor: pointer;
        }
        .user_question {
        	display:flex;
        	width:100%;
        	justify-content: center;
        	align-content: center;
        }

    </style>
</head>
<body>



    <div class="inner_container">
        <div class="content">
            <div class="main_title">
        		<h3 class="title1">땀흘리고 싶을 땐</h3>
        		<div class="title2">이지풋볼</div>
    		</div>
            <form action="${pageContext.request.contextPath}/loginPage/login?pageurl=redirect:/home" method="post">
                <input class="input" type="text" placeholder="ID" name="userId" id="id_input" value="<%=val%>">
                <input class="input" type="password" placeholder="password" name="userPw">
                <label class="radio_label"> 
                <input class="radio" type="checkbox" name="id_remem" id="id_remem" value="checked" <%=id_ck %>> 아이디 기억하기</label>
                <button id="login">Login</button>
                <div class="user_question">
                	<a href="#">회원이 아니신가요?</a>
                </div>
                
                <div class="id_footer">
                	<div class="id_foot">
	                    <button type="button" id="sign_up"><a href="${pageContext.request.contextPath}/find/findInfo">ID/PW찾기</a></button>
	                </div>
	                <div class="id_foot">
	                    <button type="button" id="sign_up"><a href="${pageContext.request.contextPath}/loginPage/signUp">회원가입</a></button>
	                </div>
	           	</div>
            </form>
            
            <script type="text/javascript">
            console.log("<%=isUser%>");
            console.log("<%=black%>");
            
        		if(<%=black%> == 1){
        			Swal.fire(
        	        '블랙리스트 유저 입니다'
                    	);
        		
        		}else if(<%=isUser%> == false) {
            		Swal.fire(
					'으악!',
					'아이디와 비밀번호를 확인해주세요'
            		);
        		}
            	
            	
            </script>
            
<%--             <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a> --%>
<!--             <a href="javascript:kakaoLogin()";> <img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style ="height:60px; width:auto;"/> </a>  -->
		    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		    <script>
		
// 		        window.Kakao.init("a6ef3628740d44bfe81144c1696044f9");
// 		        function kakaoLogin() {
// 		            // 로그인버튼 눌렀을 때 실행
// 		            window.Kakao.Auth.login({
// 		                scope:'profile_nickname, account_email, gender, age_range, birthday',
// 		                success: function(authObj) {
// 		                    console.log(authObj);
// 		                    window.Kakao.API.request({
// 		                        url:'/v2/user/me',
// 		                        success: res => {
// 		                            const Kakao_account = res.kakao_account;
// 		                            console.log(Kakao_account);
		
// 		                        }
// 		                    })
// 		                }
// 		            }) ;
// 		        }
		    </script>
        </div>
    </div>

</body>
</html>