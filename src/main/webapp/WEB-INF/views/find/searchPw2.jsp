<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW 찾기</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<body>
	<div id="container">
		<h1>새로운 비밀번호를 설정하세요.</h1>
		<form action="${pageContext.request.contextPath}/find/newPw" id="form1" method="POST">
    		<label for="pw1">새 비밀번호</label>
    		<input type="password" id="pw1" name="pw1" placeholder="새 비밀번호를 입력해주세요"><br />
    		<label for="pw2">비밀번호확인</label>
    		<input type="password" id="pw2" name="pw2" placeholder="비밀번호를 한번 더 입력해주세요" required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i"><br />
		</form>
		<button id="btn">새 비밀번호 설정</button>
		<hr>                              
		<a href="${pageContext.request.contextPath}/">메인으로 돌아가기</a>
	</div>
</body>
	
	<script type="text/javascript">
	
		$('#btn').click(function(){
			if(($('#pw1').val().length < 8 || $('#pw1').val().length > 16) ){
				Swal.fire(
					'비밀번호를 확인해주세요',
					'비밀번호는 8~16 크기의 숫자, 영문자로 이루어져야 합니다.',
					'warning'
				)
				// alert("비밀번호는 8~16 크기의 숫자, 영문자로 이루어져야 합니다.");
				return;
			}else if($('#pw1').val() != $('#pw2').val()){
				Swal.fire(
						'비밀번호를 확인해주세요',
						'비밀번호와 비밀번호확인이 다릅니다. 다시 입력해주세요.',
						'warning'
					)
				// alert("비밀번호와 비밀번호확인이 다릅니다. 다시 입력해주세요.");
				return;
			}
			for(let i=0; i < $('#pw1').val().length; i++){
				const pw1 = $('#pw1').val().charAt(i);
				if((pw1 < "a" || pw1 > "z") && (pw1 < "A" || pw1 > "Z") && (pw1 < "0" || pw1 > "9")){
					Swal.fire(
							'비밀번호를 확인해주세요',
							'비밀번호는 숫자, 영문자로 이루어져야 합니다.',
							'warning'
						)
					// alert("비밀번호는 숫자, 영문자로 이루어져야 합니다.");
					return;
				}
			}
				Swal.fire({
					  position: 'center',
					  icon: 'success',
					  title: '비밀번호가 성공적으로 설정되었습니다.',
					  showConfirmButton: false,
					  timer: 2000
				});

				setTimeout(formStart, 2000);

				// alert("비밀번호가 성공적으로 설정되었습니다.");
				function formStart(){
					$('#form1').submit();
				}
		});
	</script>
</html>