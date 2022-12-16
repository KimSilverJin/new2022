<%@page import="com.sample.vo.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sample.service.LoginService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
    		request.setCharacterEncoding("UTF-8");
    		
    		ArrayList<UserVO> bean = (ArrayList<UserVO>)request.getAttribute("userIdList");
/*     		for(UserVO i : bean){
    		System.out.print(i.getUserId() + " ");
    		}
    		System.out.println(); */
    %>
<html>
<head>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
    <meta charset="utf-8">
    <title>회원 가입</title>
	<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
    <style>
        * {
            box-sizing: border-box;
            margin:0px;
        }
        body {
            background-size:cover;
            width: 100%;
            height: 100%;
            color: #F5F6F7;
            background-color:#fff;
        }
        
        .content {
		    display: flex;
		    flex-direction: column;
		    margin: auto;
		    padding-bottom: 260px;
		    padding-top: 60px;
		}
        .signin_layout {
            display:inline-block;
            text-align:left;
            width:400px;
            margin:0px;
        }   
        .layout_title {
            width:100%;
		    text-align: left;
    		margin-bottom: 25px;
		   	font-family: 'Happiness-Sans-Title';
        }
        .text{
            font-size: 38px;
		    color: #2A2A2A;
        }
        .sub_text {
            font-size: 28px;
		    font-weight: bold;
    		color: #26A653;
        }
    

        .title{
		    font-weight: bold;
		    font-size: 12px;
		    margin-top: 10px;
		    margin-bottom: 5px;
		    color: #000;
        }


        .input{
    		border: 1px solid #b1b1b1;
		    background-color: #fff;
		    padding: 8px;
		    width: 100%;
            height: 50px;
		    border-radius: 7px;
		    color: #000000;
            padding-left: 20px;
        }
        .input:focus {
        	outline: none;
        }
        .address_area {
        	display: flex;
    		justify-content: space-between;
        }
        .address {
    		width: 77%;
    	}
        .email_control:nth-child(1) {
        	width:30%;
        }
        .email_control:nth-child(2){
        	width:45%;	
        	padding-left: 9px;
        }
        .email_group {
            display: flex;
            justify-content: space-between;
        }
        .ck_btn {
        	width: 22%;
		    height: 50px;
		    background: #fff;
		    border-radius: 7px;
    		border: 1px solid #b1b1b1;
        }
        .mail_check_input {
		    width: 100%;
		    height: 35px;
		    border-radius: 10px;
		    background-color: aliceblue;
		    margin-top: 10px;
		    margin-bottom: 5px;
		    padding-left: 18px;
		    border: 1px solid darkgrey;
        }
        
       	.local {
        	width:49%;
        }
        
        .input_area {
            display: flex;
            justify-content: center;
            flex-direction: column;
        }

        .user_birth_year {
        	width:30%;
        }
        
        .user_birth_month {
		    width: 30%;
            height: 50px;
		    border-color: #DADADA;
		    padding-left: 10px;
		    margin-left: 11px;
		    margin-right: 11px;
		    border-radius: 10px;
        }
        
        .user_birth_day {
		    width: 29%;
            height: 50px;
		    border-color: #DADADA;
		    padding-left: 10px;
		    border-radius: 10px;
        }
        
        .sign_up {
            border-radius: 8px;
    		margin-top: 40px;
		    width: 100%;
		    height: 50px;
		    background-color: #26A653;
		    color: white;
		    font-size: 15px;
		    border:0;
            cursor: pointer;
        }
        
        .able {
        	color:red;
        	display:none;
        	margin-top: 5px;
        	font-size:13px;
        }



    </style>
</head>

<body style="text-align: center;">
<div class="content">
<div class="signin_layout">
    <div class="layout_title">
        <div class="text"> 풋살 짱이 될거야! </div>
        <div class="sub_text"> EZ한 이지풋볼</div>
    </div>
    <form name="form1" method="post" action="${pageContext.request.contextPath}/loginPage/signUp">
        <div class="title"> 아이디</div> 
        <div><input class="input" id="input_id" type="text" name="userId" method="post" autofocus required></div>
        <span class="able able_id"></span>
        <div class="title"> 비밀번호 </div>
        <div><input class="input" id="input_pw" type="password" name="userPw" pattern="[0-9a-zA-Z]{8,16}" required title="8~16크기의 숫자,영문자로 이루어져야 합니다."></div>
        <span class="able able_pw"></span>
        <div class="title"> 비밀번호 확인 </div>
        <div><input class="input" id="input_pwck" type="password" required></div>
        <span class="able able_pw_ck"></span>
        <div class="title"> 이름</div>
        <div><input class="input" type="text" name="userName" required></div>
        
        
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
        <option value=""> 선택하세요.
    </select>
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
        	
        	
		<div class="title">주소</div>
           <div class="address_area"><input type="text" class="input address" id="address" name="userAddress1" readonly /><button class="ck_btn" id="address_kakao">주소찾기</button></div>
        <div class="title">상세 주소</div>
           <div><input type="text" class="input address_detail" name="userAddress2" /></div>
           
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		window.onload = function(){
		    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
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
			<div class="form_group email_form">
				<div class="title">이메일</div>
				<div class="email_group">
					<input type="text" class="input email_control" name="userEmail1" id="userEmail1" placeholder="이메일"> 
						<select class="input email_control" name="userEmail2" id="userEmail2">
							<option>@naver.com</option>
							<option>@daum.net</option>
							<option>@gmail.com</option>
							<option>@hanmail.com</option>
							<option>@yahoo.co.kr</option>
						</select>
						<button type="button" class="ck_btn" id="email_ck_btn">본인인증</button>
				</div>
				<div class="mail_check_box">
					<input class="form_control mail_check_input" name="mail_check_input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
				</div>
				<span id="mail_check_warn"></span>
			</div>

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
        <div class="title"> 성별</div>
        <div>
        <select class="input" name="userGender">
            <option selected disabled>성별</option> <!--'성별'벨류 선택하면 안되게 만드는 방법-->
            <option value="남성">남자</option>
            <option value="여성">여자</option>
            </select>
       	</div>
        <div>
            <input class="sign_up" type="button" value="가입하기" name="sign_up">
      </div>
    </form>
</div>
</div>

		<script>
		form_ck = document.form1;
			let email;
			let email1;
			$('#email_ck_btn').click(function() {
// 				const emailInput = $('#userEmail1');
// 				emailInput.attr('disabled',true);
				email = $('#userEmail1').val() + $('#userEmail2').val();
				
				console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
				const checkInput = $('.mail_check_input'); // 인증번호 입력하는곳 
				
				$.ajax({
					type : 'get',
					
					// url : '<c:url value ="${pageContext.request.contextPath}/loginPage/mailCheck?email="/>'+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
					url: "${pageContext.request.contextPath}/loginPage/mailCheck?email="+email,
					success : function (data) {
						console.log("data : " +  data);
						checkInput.attr('disabled',false);
						code =data;
						alert('인증번호가 전송되었습니다.')
					}			
				}); // end ajax
			}); // end send eamil
			

			// 인증번호 비교 
			// blur -> focus가 벗어나는 경우 발생
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
			
			// 유효성 검사
		
			let able_id = document.querySelector(".able_id");
			let input_id = document.getElementById("input_id");
			let click_btn = document.getElementById("click_btn");
			
			input_id.addEventListener("input",function() {
				
	            for (i=0; i<input_id.value.length; i++){
	            	//문자를 반환(정수형), 범위 검사 가능
	                   var ch = input_id.value.charAt(i);
	                   //입력된 문자를 검사
	                   if ( ( ch < "a" || ch > "z") && (ch < "A" || ch > "Z") && (ch < "0" || ch > "9" ) )
	                   {
	   					alert("영문과 숫자로만 입력이 가능합니다!");
	                    form_ck.userId.select();
	                   }
	            }
				
				if(input_id.value.length == 0) {
					able_id.innerHTML = "";
				}else if(<%=bean.isEmpty()%>) {
					able_id.innerHTML = "사용가능한 아이디 입니다.";
					able_id.setAttribute("style","display:block;");
				}
				
				<% for(UserVO i : bean) { %>
				if(input_id.value.length == 0) {
					able_id.innerHTML = "";
				}else if(input_id.value == "<%=i.getUserId()%>" ) {
		
					able_id.innerHTML = "이미 사용중인 아이디입니다.";
					able_id.setAttribute("style","display:block;");
					return;
				}else {
					able_id.innerHTML = "사용가능한 아이디 입니다.";
					able_id.setAttribute("style","display:block;");
				}
				<%}%>
			
			});
			


			
			let input_pw = document.getElementById("input_pw");
			let input_pwck = document.getElementById("input_pwck");
			let able_pw = document.querySelector(".able_pw");
			let able_pw_ck = document.querySelector(".able_pw_ck");
			let sign_up = document.querySelector(".sign_up");
			
			let input = document.querySelectorAll(".input");
			
			
			input_pwck.addEventListener("input",function() {
		
				if(input_pw.value == input_pwck.value) {
					able_pw_ck.innerHTML = "비밀번호가 일치합니다.";
					able_pw_ck.setAttribute("style","display:block;");
				}else if(input_pw.value != input_pwck.value) {
					able_pw_ck.innerHTML = "비밀번호가 일치하지 않습니다.";
					able_pw_ck.setAttribute("style","display:block;");
				}else if(input_pw.value.length <8 || input_pw.value.length > 17){
					able_pw.innerHTML = "비밀번호는 비밀번호는 8~16크기의 숫자,영문자로 이루어져야 합니다.";
					able_pw.setAttribute("style","display:block;");
				}
			});
			
			input_pw.addEventListener("input",function() {
				
				if(input_pw.value == input_pwck.value) {
					able_pw_ck.innerHTML = "비밀번호가 일치합니다.";
					able_pw_ck.setAttribute("style","display:block;");
				}else if(input_pw.value != input_pwck.value) {
					able_pw_ck.innerHTML = "비밀번호가 일치하지 않습니다.";
					able_pw_ck.setAttribute("style","display:block;");
				}else if(input_pw.value.length <8 || input_pw.value.length > 17){
					able_pw.innerHTML = "비밀번호는 비밀번호는 8~16크기의 숫자,영문자로 이루어져야 합니다.";
					able_pw.setAttribute("style","display:block;");
				}
			});
			
			let code_check = document.getElementById("mail_check_warn");
			
			
			sign_up.addEventListener("click",function(){
			console.log("가입하기 버튼 누늘면 :"+email);
			console.log(form_ck.userEmail1.value.trim()+form_ck.userEmail2.value.trim());
// 		    	var pattern_num = /[0-9]/;	// 숫자 
		
// 		    	var pattern_eng = /[a-zA-Z]/;	// 문자 
		
// 		    	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
		
// 		    	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
		
				<% for(UserVO i : bean) { %>
				
					if(input_id.value == ''){
						alert("아이디를 확인해주세요!");
						return form_ck.userId.focus();
					}else if(input_id.value == "<%=i.getUserId()%>" && input_pw.value != input_pwck.value ){
						alert("아이디와 비밀번호를 확인해주세요!");
						return form_ck.userId.focus();
					}else if(input_id.value == "<%=i.getUserId()%>" && input_pw.value == input_pwck.value) {
						alert("아이디를 확인해주세요!");
						return form_ck.userId.focus();
					}else if(input_id.value != "<%=i.getUserId()%>" && input_pw.value != input_pwck.value){
						alert("비밀번호를 확인해주세요!");
						return form_ck.userPw.focus();
					}else if(input_pw.value != input_pwck.value) {
						alert("비밀번호가 일치하지 않습니다! 확인해주세요!");
						return form_ck.userPw.focus();
					}else if(input_pw.value.length <8 || input_pw.value.length > 17){
						alert("비밀번호는 비밀번호는 8~16크기의 숫자,영문자로 이루어져야 합니다.");
						return form_ck.userPw.focus();
					}else if(form_ck.userName.value == ''){
						alert("이름을 확인해주세요!");
						return form_ck.userName.focus();
					}else if(form_ck.userLocal.value == '' || form_ck.userDistrict.value == ''){
						alert("지역을 선택해주세요!");
						return form_ck.userLocal.focus();
					}else if(code_check.innerText != '인증번호가 일치합니다.'){
						alert("이메일과 인증번호를 확인해주세요!");
						return;
					}else if((form_ck.userEmail1.value.trim()+form_ck.userEmail2.value.trim()) != email){
						alert("이메일 아이디를 확인해주세요")
						return form_ck.userEmail1.focus();
					}
				<%}%>
				if(form_ck.userName.value=="" || form_ck.userLocal.value=="" || form_ck.userDistrict.value=="" || form_ck.userBirthYear.value=="" || form_ck.userGender.value=="성별"){
					alert("작성하지 않은 값이 있습니다. 확인해주세요");
					return;
				}else {
					alert("가입에 성공하셨습니다!");
					form_ck.submit();
				}			
			});
			
		
		</script>

</body>

</html>