<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW 찾기</title>
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
        padding-top: 15px;
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

.main_title{
	display: block;
	width: 100%;
/* 	background: url("${pageContext.request.contextPath}/image/myPageTitle.jpg") no-repeat; */
/* 	background-size: contain; */
	padding: 10px 0;
	margin: 20px 0;
	align-self: end;
	text-align: center;
/* 	text-indent: -9999px; */
}

#main_container {
    display: flex;
    width: 100%;
    height: 100%;
    justify-content: center;
/*     background-color: #ccc; */
}

.main_area {
 	display:flex;
    width: 1024px;
    height: 900px;
/*     background-color: #ffaaaa; */
    justify-content: space-evenly;
/*     align-items: center; */
    flex-wrap: wrap;
/*     border: 1px solid black; */
}

.main_content1 {
 	display: flex;
 	flex-direction: column; 
	width: 40%;
	/* height: 98%; */
	height:50%;
/* 	justify-content: center; */
/* 	background-color: #fff; */
}

#btnbox{
	display: flex;
	justify-content: space-evenly;
}

.title {
    font-weight: bold;
    font-size: 12px;
    margin-top: 10px;
    margin-bottom: 5px;
    color: #000;
}

.main_content1 a, #btn {
	display: inline-block;
	width: 40%;
	padding: 15px 0;
	text-decoration: none;
	margin: 20px 0;
	color: #fff;
	font-weight:bold;
	font-size:18px;
	border: 1px solid #26a653;
	text-align: center;
	background-color: #26a653;
	border-radius: 20px;
}

.main_content1 a:hover {
	opacity: 0.8;
}

#btn:hover {
	opacity: 0.8;
}


.bottom_banner {
	width: 100%;
	height: 205px;
	background-color: #26A653;
	margin-top: 100px;
}
.input{
			border: 1px solid #2a2a2a;
		    background-color: #fff;
		    padding: 8px;
		    width: 100%;
            height: 50px;
		    border-radius: 7px;
		    color: #000000;
            padding-left: 20px;
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
        }
        .ck_btn {
        	width: 22%;
		    height: 50px;
		    background: #fff;
		    border-radius: 7px;
		    border: 1px solid #000;
		    
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

footer {
	width: 100%;
	height: 423px;
	display: flex;
	justify-content: space-evenly;
	padding: 30px;
	background-color: #2a2a2a;
}

.footer_left {
	width: 40%;
}

.footer_right {
	width: 40%;
}

.login_icon {
	margin-left: 15px;
}

.etc_icon {
	margin-left: 10px;
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
						<div class="etc_icon">
							<a href="${pageContext.request.contextPath}/etc/etc"> <svg
									width="24" height="24" viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg">
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
					</div>
				</div>

			</div>
		</div>
        <div id="main_container">
            <div class="main_area">
			<h1 class="main_title">아이디 찾기</h1>
				<div class="main_content1">
					<form action="${pageContext.request.contextPath}/find/searchId" name="form1" id="form1" method="POST">
		<div class="title"> 이름</div>
        <div><input class="input" type="text" name="userName" id="userName" autofocus required placeholder="이름"></div>
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
	</form>
	<div id="btnbox">
		<button id="btn" >확인</button>          
		<a href="${pageContext.request.contextPath}/find/findInfo">뒤로가기</a>
	</div>
				</div>
            </div>
        </div>

		
        
        <div class="bottom_banner"></div>
		<footer>
			<div class="footer_left"></div>
			<div class="footer_right"></div>

		</footer>

		<script type="text/javascript">
            let main_logo = document.querySelector(".main_logo");
            
            main_logo.addEventListener("click",function() {
                location.href="${pageContext.request.contextPath}";
            });
        </script>
        
        <script type="text/javascript">
		form_ck = document.form1;
		let email;
		let email1;
		$('#email_ck_btn').click(function() {
			name = $('#userName').val();
			email_1 = $('#userEmail1').val();
			email_2 = $('#userEmail2').val();
			email = email_1 + email_2;
			console.log('완성된 이메일 : ' + email_1 + email_2); // 이메일 오는지 확인
			const checkInput = $('.mail_check_input'); // 인증번호 입력하는곳 
			
			$.ajax({
				type : 'get',
				url: "${pageContext.request.contextPath}/loginPage/mailCheck1?email1="+email_1+"&email2="+email_2+"&name="+name,
				success : function (data) {
					console.log("data : " +  data);
					if(data == 0){
						Swal.fire(
							'가입정보가 일치하지 않습니다.',
							'가입자의 이름과 이메일을 확인 후 다시 입력해주세요!',
							'warning'
						)
						/* alert('가입하신 정보의 아이디가 없습니다. '+'확인후 다시 입력해주세요'); */
						return;
					}
					checkInput.attr('disabled',false);
					code = data;
					Swal.fire({
						  position: 'center',
						  icon: 'success',
						  title: '인증번호가 전송되었습니다. 이메일을 확인해주세요.',
						  showConfirmButton: false,
						  timer: 2000
					});
				}			
			}); // end ajax
		});
		
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
		
		$('#btn').click(function(e){
			if($('#mail_check_warn').text() != '인증번호가 일치합니다.'){
				Swal.fire(
						'인증번호가 일치하지 않습니다',
						'이메일과 인증번호를 다시 확인해주세요!',
						'warning'
				)
				/* alert("이메일과 인증번호를 확인해주세요!"); */
				return;
			}else if($('#userName').val() != name){
				Swal.fire(
						'이름이 변경되었습니다.',
						'이름을 알맞게 다시 입력해주세요.',
						'warning'
				)
				/* alert("이름이 불일치합니다 다시 입력해주세요"); */
				return;
			}else{
				$('#form1').submit();
			}
		});
		
	</script>
	</div>
</body>
</html>