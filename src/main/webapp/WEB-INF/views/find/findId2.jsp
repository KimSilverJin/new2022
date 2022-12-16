<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 찾기</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<body>
	<div id="container">
		<h1>아이디 찾기</h1>
		<p>가입자의 이름과 이메일을 입력해주세요</p>
	</div>
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
	<button id="btn" >아이디찾기</button>
	<hr>                              
	<a href="${pageContext.request.contextPath}/find/findInfo">뒤로가기</a>
	
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
</body>
</html>