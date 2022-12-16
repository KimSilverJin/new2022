<%@page import="com.sample.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String authority = null;
	if(session.getAttribute("sessionVO") != null) {
		UserVO uvo = (UserVO)session.getAttribute("sessionVO");
		authority = uvo.getUserAuthority();
		
	}else {
		authority = "일반회원";
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이지풋볼 / 내 정보 수정</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
<style>
        * {
        box-sizing: border-box;
        margin: 0px;
        font-family: 'Noto Sans KR', sans-serif;
    }
    
    
    .container {
        width: 100%;
        margin: 0 auto;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .header_container {
        width: 100%;
        height: 56px;
        display: flex;
        justify-content: center;
    }

    .header_area {
        width: 1024px;
        height: 100%;
        padding-top: 20px;
    }

    .header_content {
        display: flex;
        height: 100%;
        justify-content: space-between;
    }
    .header_left {
        width:95px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .main_logo{
         background: url("${pageContext.request.contextPath}/image/ez_logo1.svg") no-repeat center;
         background-size: 95px 35px;
    	cursor: pointer;
    }
    .ez_icon {
        width: 65px;
        height:35px;
    }
    
      .search_input_area {
      	 position: relative;
      }

      .search_input {
         width: 375px;
         height: 35px;
         background-color: white;
         border: 1px solid #e5e5e5;
         border-radius: 10px;
      }
      
      .glass {
      	 font-size: 20px;
	     position: absolute;
	     right: 13px;
	     top: 8px;
	     color: #464a54;
      }
      .header_right {
        display: flex;
        justify-content: center;
        align-items: center;
      }
    
/*     .main_title{ */
/* 		display: block; */
/* 		width: 100%; */
/* 		background: url("${pageContext.request.contextPath}/image/myPage3.png") no-repeat 10px; */
/* 		background-size: contain; */
/* 	 	padding: 8px 0; */
/* 		text-indent: -9999px; */
/* 	} */

    #main_container{
    	width: 100%;
    	height: 100%;
    	display: flex;
    	justify-content: center;
/*     	background-color: #ccc; */
    }
    
    .main_area {
    	width: 1024px;
/*     	min-height: 900px; */
/*     	margin-top: 50px; */
/*     	background-color: #ffaaaa; */
    }
    
    .main_content {
		width: 42%;
	    margin: 0 auto;
	    margin-top: 12%;
	    padding: 35px 35px 15px 35px;
	    background-color: #fff;
	    box-shadow: 6px 6px 20px #00000014;
	    border-radius: 20px;
	    margin-bottom: 20%;
    }
    .main_content h4 {
    	padding-bottom: 38px;
    	font-size: 20px;
    	color: #525252;
    }
    
    #btnbox{
		display: flex;
		justify-content: space-evenly;
	    margin-top: 35px;
	}
    
    #change_btn, #return {
	    display: inline-block;
	    width: 30%;
	    padding: 10px 0;
	    text-decoration: none;
	    margin: 20px 0;
	    color: #fff;
	    font-weight: bold;
	    font-size: 13px;
	    border: 1px solid #26a653;
	    text-align: center;
	    background-color: #26a653;
	    border-radius: 27px;
	}

	.main_content button:hover {
		opacity: 0.8;
	}
	
	.main_content p {
		font-size: 12px;
    	color: #989898;
	}
	
	.email_box{
		display: flex;
	}

    
    .input{
	    border: 1px solid #D7D7D7;
	    background-color: #fff;
	    padding: 8px;
	    width: 80%;
	    height: 38px;
	    border-radius: 7px;
	    color: #000000;
	    padding-left: 13px;
	    margin-bottom: 16px;
     }
        
    .input::placeholder {
    	color:#C0C0C0;
    }
        
    .local{
		width: 49%;
	}
	
    .title {
	    font-weight: bold;
	    font-size: 12px;
	    margin-top: 10px;
	    margin-bottom: 5px;
	    color: #000;
	}
	
	.ck_btn, .ck_btn1{
		display: inline-block;
	    width: 20%;
	    padding: 10px 0;
	    text-decoration: none;
/* 	    margin: 20px 0; */
	    color: #fff;
	    font-weight: bold;
	    font-size: 13px;
	    border: 1px solid #26a653;
	    text-align: center;
	    background-color: #26a653;
	    border-radius: 27px;
	    height: 39px;
	}
	
	#email_btn{
		display: inline-block;
	    width: 20%;
	    height: 39px;
	    background-color: #26a653;
	    border-radius: 27px;
	    color: #fff;
	    font-weight: bold;
	    font-size: 13px;
	    text-decoration: none;
	    border: 1px solid #26a653;
	    text-align: center;
	}
    
    .user_birth_year {
	    width: 30%;
	}

	.user_birth_month {
	    width: 30%;
	    border-color: #DADADA;
	    margin-left: 11px;
	    margin-right: 11px;
	    border-radius: 10px;
   	    padding: 8px;
	    padding-left: 10px;
	}
	
	.user_birth_day {
	    width: 29%;
	    border-color: #DADADA;
	    border-radius: 10px;
	   	padding: 8px;
	    padding-left: 10px;
	}
	
	#userEmail1 {
		width: 35%;
	}
	
	#userEmail2 {
		width: 45%;
	}
	
	#mail_check_warn{
		display:inline-block;
	    font-size: 12px;
    	color: #989898;
	}
	
	.authentication{
		display: flex;
		justify-content: space-between;
	}
	
	.hid{
		display: none;
	}

    .bottom_banner {
        width:100%;
        height:205px;
        background-color: #26A653;
        margin-top: 100px;
    }
    footer {
        width: 100%;
        height: 423px;
        display: flex;
        justify-content: space-evenly;   
        padding: 30px;
        background-color: #2a2a2a;
        margin-top: 150px;
    }
    .footer_left {
        width:40%;

    }

    .footer_right {
        width:40%;

    }
    
    .address {
    	width: 77%;
    }

    .login_icon {
        margin-left:15px;
    }
    .etc_icon {
        margin-left:10px;
    }
    .header_icon {
	    text-decoration: none;
	    color: #4e4e4e;
	    font-size: 27px;
	    margin-left: 15px;
    }

</style>
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<body>
<div class="container">
    <div class="header_container">
        <div class="header_area">
            <div class="header_content">
               <div class="header_left main_logo">

               </div>
               <div class="header_right login_btn etc_btn">
                  <div class="search_input_area">
  		  			  <jsp:include page="../search/search.jsp"></jsp:include>
<!--                   <input type="text" class="search_input"> -->
	                  <iconify-icon class="glass" icon="fa6-solid:magnifying-glass"></iconify-icon>
                  </div>
                  <div class="adminMove">
                  	<% if(authority.equals("관리자")){ %>
                  		<a class="header_icon admin_btn" href="${pageContext.request.contextPath}/admin/admin"><iconify-icon icon="clarity:administrator-solid"></iconify-icon></a>
				  	<%}else if(authority.equals("매니저")){%>
				  		<a class="header_icon manager_btn" href="${pageContext.request.contextPath}/manager/manager"><iconify-icon icon="clarity:administrator-solid"></iconify-icon></a>
				  	<%} %>
                  </div>
                  
                  <div class="login_icon">
                     <a href="${pageContext.request.contextPath}/loginPage/login">
<!--                      <iconify-icon icon="akar-icons:person"></iconify-icon> -->
                        <svg width="25" height="28" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                           <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M12 2C9.23858 2 7 4.23858 7 7C7 9.76142 9.23858 12 12 12C14.7614 12 17 9.76142 17 7C17 4.23858 14.7614 2 12 2ZM9 7C9 5.34315 10.3431 4 12 4C13.6569 4 15 5.34315 15 7C15 8.65685 13.6569 10 12 10C10.3431 10 9 8.65685 9 7Z"
                              fill="#464A54" />
                           <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M12 13.5C7.5502 13.5 5.07689 15.0054 3.93312 16.0093C3.22723 16.6288 3 17.4996 3 18.2447C3 20.3187 4.68132 22 6.75534 22H17.2447C19.3187 22 21 20.3187 21 18.2447C21 17.4996 20.7728 16.6288 20.0669 16.0093C18.9231 15.0054 16.4498 13.5 12 13.5ZM5.25244 17.5124C6.03934 16.8217 8.04626 15.5 12 15.5C15.9537 15.5 17.9607 16.8217 18.7476 17.5124C18.8856 17.6335 19 17.8668 19 18.2447C19 19.2141 18.2141 20 17.2447 20H6.75534C5.78589 20 5 19.2141 5 18.2447C5 17.8668 5.11441 17.6335 5.25244 17.5124Z"
                              fill="#464A54" />
                        </svg>
                     </a>
                  </div>
                  
                  <% if(session.getAttribute("sessionVO") == null) { %>
                  <div class="etc_icon">
                     <a href="${pageContext.request.contextPath}/etc/etc">
                        <svg width="28" height="28" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                           <path
                              d="M5.5 10.5C6.32843 10.5 7 11.1716 7 12C7 12.8284 6.32843 13.5 5.5 13.5C4.67157 13.5 4 12.8284 4 12C4 11.1716 4.67157 10.5 5.5 10.5Z"
                              fill="#464A54" />
                           <path
                              d="M12 10.5C12.8284 10.5 13.5 11.1716 13.5 12C13.5 12.8284 12.8284 13.5 12 13.5C11.1716 13.5 10.5 12.8284 10.5 12C10.5 11.1716 11.1716 10.5 12 10.5Z"
                              fill="#464A54" />
                           <path
                              d="M18.5 10.5C19.3284 10.5 20 11.1716 20 12C20 12.8284 19.3284 13.5 18.5 13.5C17.6716 13.5 17 12.8284 17 12C17 11.1716 17.6716 10.5 18.5 10.5Z"
                              fill="#464A54" />
                        </svg>
                     </a>
                  </div>
                  <% } %>
                  
                  <% if(session.getAttribute("sessionVO") != null) { %>
                  <div class="logout_icon">
                     <a class="header_icon logout_btn" href="${pageContext.request.contextPath}/loginPage/logout">
						<iconify-icon icon="codicon:sign-out"></iconify-icon>
                     </a>
                  </div>
                  <%} %>
               </div>
            </div>

        </div>
    </div>

    <div id="main_container">
    	<div class="main_area">
    		<div class="main_content">
			<h4>내 정보 수정</h4>
				<form action="${pageContext.request.contextPath}/myPage/changeinfo/result" id="change" method="post">
					<div class="title">이름</div>
					<div><input type="text" class="input" name="userName" id="name" value="${userVO.userName }" disabled="disabled"/><button class="ck_btn" id="name_change">수정하기</button></div>
					<div class="title">아이디</div>
					<div><input type="text" class="input" name="userId" id="id" value="${userVO.userId}" disabled="disabled"/><button class="ck_btn" id="id_change">수정하기</button></div>
					<div class="title">이메일</div>
					<div class="email_box">
					<input type="text" class="input" name="userEmail1" id="userEmail1" value="${userVO.userEmail1}" disabled="disabled"/>
					<select class="input email_control" name="userEmail2" id="userEmail2" disabled="disabled">
							<option>@naver.com</option>
							<option>@daum.net</option>
							<option>@gmail.com</option>
							<option>@hanmail.com</option>
							<option>@yahoo.co.kr</option>
						</select>
					<button class="ck_btn" id="email_change">수정하기</button>
					</div>
					<section class="hid">
					<div class="authentication">
					<input class="input form_control mail_check_input" name="mail_check_input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
					<button id="email_btn">인증하기</button>
					</div>
					<span id="mail_check_warn">이메일이 변경되었습니다. 인증을 다시 받아주세요.
					</section>

					</span>					
				<div class="title">지역</div>
				    <select class="input local" id="userLocal1" name="userLocal" onchange="itemChange(this.value)">
				        <option value="">시/도 선택</option> 
				        <option value="서울" title="서울특별시">서울특별시</option>
				        <option value="부산" title="부산광역시">부산광역시</option>
				        <option value="대구" title="대구광역시">대구광역시</option>
				        <option value="인천" title="인천광역시">인천광역시</option>
				        <option value="광주" title="광주광역시">광주광역시</option>
				        <option value="대전" title="대전광역시">대전광역시</option>
				        <option value="울산" title="울산광역시">울산광역시</option>
				        <option value="세종" title="세종특별자치시">세종특별자치시</option> 
				        <option value="경기" title="경기도">경기도</option>
				        <option value="강원" title="강원도">강원도</option>
				        <option value="충북" title="충청북도">충청북도</option>
				        <option value="충남" title="충청남도">충청남도</option>
				        <option value="전북" title="전라북도">전라북도</option>
				        <option value="전남" title="전라남도">전라남도</option>
				        <option value="경북" title="경상북도">경상북도</option>
				        <option value="경남" title="경상남도">경상남도</option>
				        <option value="제주" title="제주특별자치도">제주특별자치도</option>
				    </select>
				    <select class="input local" name="userDistrict" id="userLocal2">
				        <option value="">선택하세요.</option>
				    </select>
				    <div class="title">주소</div>
				    <div class="title" id="address1">(현재주소 : ${userVO.userAddress })</div>
			           <div><input type="text" class="input address" id="address" name="userAddress1" value="${userVO.userAddress}" readonly /><button class="ck_btn1" id="address_kakao">주소찾기</button></div>
			        <div class="title">상세 주소</div>
			           <div><input type="text" class="input address_detail" name="userAddress2" value=""/></div>
			           <div class="title"> 생년월일</div>
			        <div><input class="input user_birth_year" type="text" name="userBirthYear" placeholder="년(4자)" maxlength=4 required>
			            <select class="user_birth_month" name="userBirthMonth">
			                <%
			
			                int month = 1;
			                while(month<13){
								
			                	if(month<10){
			                	 %>
			                	
			                    <option value="0<%=month%>"><%=month%>월</option>
			
			                     <%
			                	}else{
			                		
			                	 %>
			                	 <option value="<%=month%>"><%=month%>월</option>
			                	 
			                	<%
			                	}
			                    month = month+1;
			                }
			                %>
			            </select>
			            <select name="userBirthDay" class="user_birth_day">
			                 <%
			                int day = 1;
			                while(day<32){
			                	
			                	if(day<10){
			                    %>
			                    <option value="0<%=day%>"><%=day%>일</option>
			                    <% 
			                	}else {
			                	%>
			                	<option value="<%=day%>"><%=day%>일</option>
			                	<%
			                	}
			                    day = day+1;
			                }
			               	%>
			            </select>
			        </div>
			        <div class="title">성별</div>
			        <div>
				        <select class="input" name="userGender" id="gender" >
				            <option selected disabled>성별</option>
				            <option value="남성">남자</option>
				            <option value="여성">여자</option>
				        </select>
			       	</div>
				</form>
				<div id="btnbox">
					<button id="change_btn" type="submit">변경하기</button>
					<button id="return" type="submit">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	    <footer>
	        <jsp:include page="../etc/footer.jsp"></jsp:include>
	    </footer>
    </div>

	


<script type="text/javascript">
	let main_logo = document.querySelector(".main_logo");
	
	main_logo.addEventListener("click",function() {
		location.href="${pageContext.request.contextPath}";
	});
</script>

	<script type="text/javascript">
		$('#return').click(function(){
			$(location).attr("href","${pageContext.request.contextPath}/myPage/myPage");
		});
	</script>
	

        <script>
        //서울특별시
        var a1=["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
    
        //부산광역시
        var b1=["강서구","금정구","기장군","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구"];
    
        //대구광역시
        var c1=["남구","달서구","달성군","동구","북구","서구","수성구","중구"];
    
        //인천광역시
        var d1=["강화군","계양구","남구","남동구","동구","부평구","서구","연수구","옹진군","중구"];
    
        //광주광역시
        var e1=["광산구","남구","동구","북구","서구"];
    
        //대전광역시
        var f1=["대덕구","동구","서구","유성구","중구"];
    
        //울산광역시
        var g1=["남구","동구","북구","울주군","중구"];
    
        //세종특별자치시
        var h1=["세종특별자치시"];
    
        //경기도
        var i1=["가평군","고양시 덕양구","고양시 일산동구","고양시 일산서구","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시 분당구","성남시 수정구","성남시 중원구","수원시 권선구","수원시 영통구","수원시 장안구","수원시 팔달구","시흥시","안산시 단원구","안산시 상록구","안성시","안양시 동안구","안양시 만안구","양주시","양평군","여주시","연천군","오산시","용인시 기흥구","용인시 수지구","용인시 처인구","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시"];
    
        //강원도
        var j1=["강릉시","고성군","동해시","삼척시","속초시","양구군","양양군","영월군","원주시","인제군","정선군","철원군","춘천시","태백시","평창군","홍천군","화천군","횡성군"];
    
        //충청북도
        var k1=["괴산군","단양군","보은군","영동군","옥천군","음성군","제천시","증평군","진천군","청주시상당구","청주시서원구","청주시청원구","청주시흥덕구","충주시"];
    
        //충청남도
        var l1=["계룡시","공주시","금산군","논산시","당진시","보령시","부여군","서산시","서천군","아산시","예산군","천안시동남구","천안시서북구","청양군","태안군","홍성군"];
    
        //전라북도
        var m1=["고창군","군산시","김제시","남원시","무주군","부안군","순창군","완주군","익산시","임실군","장수군","전주시덕진구","전주시완산구","정읍시","진안군"];
    
        //전라남도
        var n1=["강진군","고흥군","곡성군","광양시","구례군","나주시","담양군","목포시","무안군","보성군","순천시","신안군","여수시","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
    
        //경상북도
        var o1=["경산시","경주시","고령군","구미시","군위군","김천시","문경시","봉화군","상주시","성주군","안동시","영덕군","영양군","영주시","영천시","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군","포항시남구","포항시북구"];
    
        //경상남도
        var p1=["거제시","거창군","고성군","김해시","남해군","밀양시","사천시","산청군","양산시","의령군","진주시","창녕군","창원시 마산합포구","창원시 마산회원구","창원시 성산구","창원시 의창구","창원시 진해구","통영시","하동군","함안군","함양군","합천군"];
    
        //제주특별자치도
        var q1=["서귀포시","제주시"];
    	
        $('#userLocal1').val('${userVO.userLocal}').prop("selected", true);
        itemChange('${userVO.userLocal}');
        $('#userLocal2').val('${userVO.userDistrict}').prop("selected", true);
        
        function itemChange(arr01){
            removeOption();
            if(arr01=="서울"){
                addOption(a1);
            }else if(arr01=="부산"){
                addOption(b1);
            }else if(arr01=="대구"){
                addOption(c1);
            }else if(arr01=="인천"){
                addOption(d1);
            }else if(arr01=="광주"){
                addOption(e1);
            }else if(arr01=="대전"){
                addOption(f1);
            }else if(arr01=="울산"){
                addOption(g1);
            }else if(arr01=="세종"){
                addOption(h1);
            }else if(arr01=="경기"){
                addOption(i1);
            }else if(arr01=="강원"){
                addOption(j1);
            }else if(arr01=="충북"){
                addOption(k1);
            }else if(arr01=="충남"){
                addOption(l1);
            }else if(arr01=="전북"){
                addOption(m1);
            }else if(arr01=="전남"){
                addOption(n1);
            }else if(arr01=="경북"){
                addOption(o1);
            }else if(arr01=="경남"){
                addOption(p1);
            }else if(arr01=="제주"){
                addOption(q1);
            }
                                
        
        }
        function removeOption(){
          var objSel = document.getElementById("userLocal2");
    
          for(i=objSel.length; i>=0; i--){
            objSel.options[i]=null;
          }
        }
    
        function addOption(bbb){
          var objSel = document.getElementById("userLocal2");
          for (i=0; i<bbb.length;i++){
              var objOption = document.createElement("option");  
              if(i==0){
                objOption.text = '선택해주세요.' ;
                objOption.value = '';
              }else{
                objOption.text = bbb[i] ;
                objOption.value = bbb[i];
              }
            objSel.options.add(objOption);
          }
        }
    
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		window.onload = function(){
		    document.getElementById("address_kakao").addEventListener("click", function(e){ //주소입력칸을 클릭하면
		    	e.preventDefault();
		    
		        //카카오 지도 발생
		        new daum.Postcode({
		            oncomplete: function(data) { //선택시 입력값 세팅
		                document.getElementById("address").value = data.address; // 주소 넣기
		                document.querySelector("input[name=userAddress1]").focus(); //상세입력 포커싱
		            }
		        }).open();
		        
		        
		    });
		}
	</script>
	<script type="text/javascript">
		let birth = '${userVO.userBirth}'.split('-');
		
		$('.user_birth_year').val(birth[0]);
		$('.user_birth_month').val(birth[1]);
		$('.user_birth_day').val(birth[2]);
		
		$('#gender').val('${userVO.userGender}');
		
		$('#userEmail2').val('${userVO.userEmail2}');
		
		let add_detail = $('#address').val().split(',');
		
		
// 		add_detail = add_detail.replace('경기 고양시 덕양구 가양대로 110', "");
		
		$('.address').val(add_detail[0]);
		
		$('.address_detail').val($.trim(add_detail[1]));
		var arr = new Array();
		<c:forEach items = '${userList}' var = 'item'>
			arr.push({userid: '${item.userId}',
					email1: '${item.userEmail1}',
					email2: '${item.userEmail2}'
				});
		</c:forEach>
		let id_val = document.getElementById("id").value;
		let email1 = document.getElementById("userEmail1").value+document.getElementById("userEmail2").value;
		$('.ck_btn').click(function(e){
			e.preventDefault();
			if($(this).text()== "수정완료"){
// 				let leng = $('#id').val().length > $('#email1').val().length ? $('#id').val().length : $('#email1').val().length;   
				for(let i=0; i < $('#id').val().length; i++){
					const id1 = $('#id').val().charAt(i);
					if((id1 < "a" || id1 > "z") && (id1 < "A" || id1 > "Z") && (id1 < "0" || id1 > "9")){
						alert("아이디는 숫자, 영문자로 이루어져야 합니다.");
						return;
					}
				}
				
				for(let i=0; i < $('#userEmail1').val().length; i++){
					const email1 = $('#userEmail1').val().charAt(i);
					if((email1 < "a" || email1 > "z") && (email1 < "A" || email1 > "Z") && (email1 < "0" || email1 > "9")){
						alert("이메일은 숫자, 영문자로 이루어져야 합니다.");
						return;
					}
				}
				
				
			
				for (var i = 0; i < arr.length; i++) {
				
					if(($('#id').val() != id_val) && ($('#id').val() ==  arr[i].userid)){
						alert('이미 사용중인 아이디입니다.');	
						$(this).siblings().attr("disabled", false).focus();
						$(this).css('background-color', '#ccc').css('border', '#ccc');
						$(this).text("수정완료");
						return false;
					}else if($('#id').val() == null || $('#id').val() == ""){
						alert('아이디를 확인해주세요!');	
						$(this).siblings().attr("disabled", false).focus();
						$(this).css('background-color', '#ccc').css('border', '#ccc');
						$(this).text("수정완료");
						return false;
					}else if((($('#userEmail1').val()+$('#userEmail2').val()) != email1) && (($('#userEmail1').val()+$('#userEmail2').val()) ==  arr[i].email1+arr[i].email2)){
						alert('이미 사용중인 이메일입니다');	
						$(this).siblings().attr("disabled", false).focus();
						$(this).css('background-color', '#ccc').css('border', '#ccc');
						$(this).text("수정완료");
						return false;
					}else{
						$(this).siblings().attr("disabled", true);
						$(this).css('background-color', '#26a653').css('border', '#26a653');
						$(this).text("수정하기");
					}
				};
// 				$(this).siblings().attr("disabled", true);
// 				$(this).('ck_btn').text("수정하기");
				if(email1 != ($('#userEmail1').val()+$('#userEmail2').val())){
					alert('이메일이 변경되었습니다. 인증을 다시 받아주세요');
					$('.hid').show();
				}
				return;
			}else{
				$(this).siblings().attr("disabled", false).focus();
				$(this).css('background-color', '#ccc').css('border', '#ccc');
				$(this).text("수정완료");
			}
			
		});
	</script>
	<script type="text/javascript">
		$('#change_btn').on("click", function(){
			if($('#name_change').text() == '수정완료' || $('#id_change').text() == '수정완료' || $('#email_change').text() == '수정완료'){
				alert("수정을 완료하고 변경을 눌러주세요");
				return;
			}else if ($('.user_birth_year').val() == ""){
				alert("날짜를 입력해주세요");
				$('.user_birth_year').focus();
				return;
			}else if($('#mail_check_warn').text() != '인증번호가 일치합니다.' && $('.hid').css('display') == 'block'){
				alert("이메일과 인증번호를 확인해주세요!");
				return;
			}
			$(':input').attr("disabled", false);
			
			var confirm_val = confirm("정말 수정하시겠습니까?");
			 
			if(confirm_val) {
				$('#change').submit();	
			}
		});
		
		$('#email_btn').click(function(e){
			e.preventDefault();
			if($(this).text() == '인증하기'){
				
			userId = $('#Id').val();
			email_1 = $('#userEmail1').val();
			email_2 = $('#userEmail2').val();
			email = email_1 + email_2;
			const checkInput = $('.mail_check_input'); // 인증번호 입력하는곳 
			
			$.ajax({
				type : 'get',
				url: "${pageContext.request.contextPath}/myPage/mailCheck?email="+email,
				success : function (data) {
					console.log("data : " +  data);
					if(data == 0){
						alert('가입하신 정보가 맞지 않습니다. '+'확인후 다시 입력해주세요');
						return;
					}
					checkInput.attr('disabled',false);
					code = data;
					alert('인증번호가 전송되었습니다.');
				}			
			}); // end ajax
			$(this).text('전송완료').css('background-color', '#ccc').css('border', '#ccc').attr('disabled','true');
			
			}
		});
		
		$('.mail_check_input').blur(function () {
			const inputCode = $(this).val();
			const $resultMsg = $('#mail_check_warn');
			
			if(inputCode === code){
				email1 = $('#userEmail1').val() + $('#userEmail2').val();
				console.log(email1);
				if(email1 == email || email1 == undefined){
				
					$resultMsg.html('인증번호가 일치합니다.');
					$resultMsg.css('color','green');
					$('#mail_check_btn').attr('disabled',true);
					$('#userEamil1').attr('readonly',true);
					$('#userEamil2').attr('readonly',true);
					$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
			        $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
			        
					$('#userEmail1').bind('input',function() {
						email1 = $('#userEmail1').val() + $('#userEmail2').val();
						console.log("email: "+email +" email1: "+email1);
						console.log(email != email1);
						if(email != email1){
							$resultMsg.html('이메일 아이디가 불일치 합니다. 다시 확인해주세요!.');
							$resultMsg.css('color','red');

						}else{
							$resultMsg.html('인증번호가 일치합니다.');
							$resultMsg.css('color','green');
						}
					});
				}
				return;
			}else{
				$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
				$resultMsg.css('color','red');
				return;
			}
		});
		
	</script>
</div>
</body>
</html>
