<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	user-select: none;
}

#main_controller{
	display: flex;
	flex-direction: column;
	padding: 15px;
}

.header_box{
	display: flex;
	width: 100%;
	justify-content: flex-end;
}

.search_bar input{
	height: 30px;
	margin: 0 10px 0 0;
}

.iselect {
	height: 30px;
}

.btn_box2 button{
    color: #fff;
   	height: 30px;
	background-color: #26a563;
	border: none;
	border-radius: 10px;
/* 	width: 45%; */
	min-width:45px;
	cursor: pointer;
}

#inquiry_list {
	width: 100%;
	border-collapse: collapse;
	font-size: 14px;
	margin: 20px 0;
}

	#inquiry_list th, td {
		height: 40px;
	    text-align: center;
	    border-bottom: 2px dotted #D2D79F;
	}
	
	#inquiry_list th {
		background-color: #F8EDE3;
		height: 50px;
    	border-bottom: 2px solid #D2D79F;
	}
	
	#inquiry_list tr {
		cursor: pointer;
	}
	
	#inquiry_list tr:first-child {
		cursor: default;
	}

.main_content1 {
	display: flex;
	flex-direction: column;
	width: 70%;
	height: 90%;
	background-color: #fff;
	padding: 20px;
}

.main_item1, .main_item2 {
	display: flex;
	width: 100%;
	height: 40vh;
	flex-direction: column;
}

.main_item1 p, .main_item2 p {
	display: block;
	font-size: 15px;
	opacity: 0.9;
}

.main_item1 h5, .main_item2 h5 {
	display: block;
	font-size: 15px;
	opacity: 0.9;
	min-width: 100px;
}

.detail_header {
	display: flex;
	width: 100%;
	padding: 20px 10px;
	border-bottom: 1px solid #ccc;
}

.header_item1 {
	display: flex;
	width: 49%;
}

.header_item2 {
	display: flex;
	width: 49%;
	justify-content: space-evenly;
}

.detail_title {
	display: flex;
	width: 100%;
	padding: 20px 10px;
	border-bottom: 1px solid #ccc;
}

.title_item {
	display: flex;
	width: 100%;
}

.detail_content {
	display: flex;
	width: 100%;
	min-height: 60%;
	padding: 30px 10px;
	border-bottom: 1px solid #ccc;
}

.content_item {
	display: flex;
}

.content_item h5 {
	align-self: center;
}

.btn_box {
	display: flex;
	justify-content: space-evenly;
}

#answer{
	width: 100%;
	border: 1px solid #ccc;
    border-radius: 5px;
    resize: none;
}

/* .select_box { */
/* 	align-self: flex-end; */
/* } */

.btn_box button, #add {
	display: inline-block;
	width: 40%;
	padding: 15px 0;
	text-decoration: none;
	margin: 20px 0;
	color: #fff;
	font-weight: bold;
	font-size: 18px;
	border: 1px solid #26a653;
	text-align: center;
	background-color: #26a653;
	border-radius: 20px;
}

.btn_box button:hover {
	opacity: 0.8;
}
	.menu2 {
		background-color: #f8ede3;
	}
</style>
<body>
	<div id="main_controller">
<!-- 		<section class="select_box"> -->
<!-- 			<select class="state"> -->
<!-- 				<option value="전체상태">전체상태</option> -->
<!-- 				<option value="답변대기">답변대기</option> -->
<!-- 				<option value="답변완료">답변완료</option> -->
<!-- 			</select> -->
<!-- 		</section> -->
		<c:if test="${detail eq null }">
		<div class="header_box">
				<div class="search_bar">
					<select class="iselect">
	                	<option value="">카테고리</option>
			        	<option value="문의번호">문의번호</option>
			        	<option value="문의제목">문의제목</option>
			        	<option value="문의날짜">문의날짜</option>
			        	<option value="유저코드">유저코드</option>
		       		</select>
			    	<input type="text" name="isearch" id="isearch" placeholder="검색어를 입력해주세요." />
			    </div>
				<div class="btn_box2">
					<button id="search_btn" class="btn">검색</button>
				</div>
		</div>
			<table id="inquiry_list">
				<tr>
					<th>문의번호</th>
					<th>문의제목</th>
					<th>문의날짜</th>
					<th>유저코드</th>
					<th>문의상태</th>
				</tr>

				<c:forEach var="list" items="${inquiryList}">
					<tr class="inquiry_item${list.inquiryCode} item_box">
						<td>${list.inquiryCode}</td>
						<td>${list.inquiryTitle}</td>
						<td>${list.createDate}</td>
						<td>${list.userCode}</td>
						<td>${list.inquiryState}</td>
					</tr>
					<script type="text/javascript">
						$('.inquiry_item${list.inquiryCode}').on("click",function(){
							location.href = "${pageContext.request.contextPath}/admin/detail/${list.inquiryCode}";
						});
						if('${list.inquiryState}' == '답변대기'){
		        			$('.inquiry_item${list.inquiryCode}').hide();
		        		}
						
// 						$('.state').on("change", function(){
// 							$('.inquiry_item${list.inquiryCode}').show();
// 				        	if($('.state').val() == "답변대기"){
// 				        		if('${list.inquiryState}' == '답변완료'){
// 				        			$('.inquiry_item${list.inquiryCode}').hide();
// 				        		}
// 				        	}else if($('.state').val() == "답변완료"){
// 				        		if('${list.inquiryState}' == '답변대기'){
// 				        			$('.inquiry_item${list.inquiryCode}').hide();
// 				        		}
// 				        	}else{
// 				        		$('.inquiry_item${list.inquiryCode}').show();
// 				        	}
// 			        	});
					</script>
				</c:forEach>

			</table>
		</c:if>
		<c:if test="${detail ne null }">
			<div class="main_content1">
				<div class="main_item1">
					<div class="detail_header">
						<section class="header_item1">
							<h5>등록일</h5>
							<p>${inquiryVO.createDate}</p>
						</section>
						<section class="header_item2">
							<h5>처리상태</h5>
							<p>${inquiryVO.inquiryState}</p>
						</section>
					</div>
					<div class="detail_title">
						<section class="title_item">
							<h5>제목</h5>
							<p>${inquiryVO.inquiryTitle}</p>
						</section>
					</div>
					<div class="detail_content">
						<section class="content_item">
							<h5>내용</h5>
							<p>${inquiryVO.inquiryContent}</p>
						</section>
					</div>
				</div>
				<!-- 관리자 답변 들어갈곳 -->
				<c:if test="${inquiryVO.inquiryState eq '답변완료'}">
					<div class="main_item2">
						<div class="detail_header">
							<section class="header_item1">
								<h5>답변일</h5>
								<p>${inquiryVO.answerDate}</p>
							</section>
						</div>
						<div class="detail_content">
							<section class="content_item">
								<h5>답변</h5>
								<p>${inquiryVO.answerContent}</p>
							</section>
						</div>
						<div class="btn_box">
							<button id="btn">뒤로가기</button>
						</div>
					</div>
				</c:if>
				<c:if test="${inquiryVO.inquiryState eq '답변대기'}">
					<div class="main_item2">
						<div class="detail_content">
							<section class="content_item">
								<h5>답변내용</h5>
								<textarea id="answer" name="answer" rows="10" cols="100"></textarea>
							</section>
						</div>
						<div class="btn_box">
						<button id="add">답변하기</button>
						<button id="btn">뒤로가기</button>
					</div>
					</div>
				</c:if>
			</div>
	</div>
	</c:if>
	</div>

	<script type="text/javascript">
		$('#btn').on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/adminselect?adminselect=qna";
		});
		
		$('#add').on("click", function(){
			const answer = $('#answer').val();
			if(answer.trim() == null || answer.trim() == ""){
				alert('내용이 비었습니다.');
				return;
			}
			
			var confirm_val = confirm("글을 작성하시겠습니까?");
			 
			if(confirm_val) {
				location.href = "${pageContext.request.contextPath}/admin/inquiry_add?detail=${inquiryVO.inquiryCode}&answer="+answer;
			}
		});
	</script>
	
	<script type="text/javascript">
		$('#search_btn').click(function(){
			const iselect = $('.iselect').val();
			const isearch = $.trim($('#isearch').val());
			
			if(iselect == null || iselect == ""){
				alert('카테고리를 선택해주세요');
			}else if(isearch == null || isearch == "" ) {
				alert('검색어를 입력해주세요');
			}else{
				location.href = "${pageContext.request.contextPath}/admin/inquirySearch?adminselect=qnafinish&iselect="+iselect+"&isearch="+isearch;	
			}
			
		});
		
		$('#isearch').on("keyup", function(e){
			if (e.keyCode == 13) {
				$('#search_btn').click(); 
	        }
		});
	</script>
</body>
</html>