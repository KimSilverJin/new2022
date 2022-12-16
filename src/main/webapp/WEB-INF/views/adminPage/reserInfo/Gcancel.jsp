<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.menu4 {
		background-color: #f8ede3;
	}
	.Gcontainer{
		margin-top: 1%;
	}
	.Gheader_area{
		display: flex;
	    width: 100%;
	    height: 30px;
	    justify-content: space-between;
	    margin-bottom: 1%;
	    padding: 10px 0px;
    	box-sizing: content-box;
	}
	.Gselect_option{
		width: 30%;
	    display: flex;
	}
	#Gselect{
	    width: 60%;
	    border: 1px solid #000;
	}
	.GRsearch{
    	width: 50%;
	}

	#Gsearch{
		width: 100%;
    	height: 30px;
    	border: 1px solid black;
    	padding-left : 15px;
	}


	table {
		border-collapse : collapse;
		
	}
	table tr th {
		width : 120px;
		height : 50px;
		border-bottom : 2px solid #D2D79F;
		background-color : #F8EDE3;
	}
	
	table tr th:nth-child(1){
		width:105px;
	}
	table tr th:nth-child(2){
		width:140px;
	}
	table tr th:nth-child(4){
		width:220px;
	}

	table tr td {
		height : 40px;
		text-align : center;
		border-bottom : 2px dotted #D2D79F;
	}
	#allCheck{
		width: 20px;
   		height: 30px;
	}
	.chBox{
		width: 20px;
    	height: 30px;
	}
	.buttons {
		width: 10%;
	}
	
	.Gbutton{
		height: 30px;
	    justify-content: center;
	    display: flex;
	    align-items: center;
	   	width: 10%;
	    margin-left: 1%;
	}
	#Gbtn{
    	color: black;
    	height: 30px;
	    background-color: #BDD2B6;
	    border: none;
	    border-radius: 10px;
	    width: 100%;
	}
	#Gbtn:hover{
		cursor : pointer;
		background-color : #42855B;
		font-weight : 700;
		color:white;
	}
	.Gdelete_btn{
	    background-color: #BDD2B6;
    	border: 0px;
    	border-radius: 10px;
    	margin-bottom: 1%;
    	width: 100%;
    	height: 100%;
	}
	.Gdelete_btn:hover {
		font-weight : 700;
		background-color : #42855B;
		cursor : pointer;
		color:white;
	}
</style>
</head>
<body>
	<div class="Gcontainer">
		<form name="form1" action="${pageContext.request.contextPath}/admin/reserselect" method="get">
			<div class="Gheader_area">
				<div class="Gselect_option">
					<select name="Gselect" id="Gselect">
						<option value="null">선택</option>
						<option value="rvCode">예약번호</option>	
						<option value="gameDay">매치날짜</option>
						<option value="gameTime">매치시간</option>
						<option value="fieldName">구장이름</option>
						<option value="fieldType">구장크기</option>
						<option value="fieldRentalfee">구장대여비</option>
						<option value="userCode">신청자코드</option>
						<option value="userName">신청자이름</option>
						<option value="rvDay">예약날짜</option>						
					</select>
				</div>
				
				<div class="GRsearch">
					<input type="text" name="Gsearch" id="Gsearch" placeholder="카테고리에 맞게 단어를 검색하세요" />
					<input type="text" style='display:none;' />
				</div>
				<div class="Gbutton">
					<button type="button" id="Gbtn">검색</button>
				</div>			
			</div>


		<div class="rv_table_area">
			<table>
				<thead>
					<tr>
						<th>예약 번호</th>
						<th>매치 날짜</th>						
						<th>매치 시간</th>
						<th>구장 이름</th>
						<th>구장 크기</th>
						<th>구장 대여비</th>
						<th>신청자 코드</th>
						<th>신청자 이름</th>
						<th>예약 날짜</th>						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${cancelRV}">
						<tr class="content">
							<td class="rvCode">${item.rvCode}</td>
							<td class="gameDay">${item.gameDay}</td>
							<td class="gameTime">${item.gameTime}</td>
							<td class="fieldName">${item.fieldName}</td>
							<td class="fieldType">${item.fieldType}</td>
							<td class="fieldRentalfee"><fmt:formatNumber value="${item.fieldRentalfee}" pattern="#,###"/></td>
							<td class="userCode">${item.userCode}</td>
							<td class="userName">${item.userName}</td>
							<td class="rvDay">${item.rvDay}</td>							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		</form>
	</div>
	
    <script>
		let content = document.querySelectorAll(".content");
		var input = document.getElementById("Gsearch");
		let search_btn = document.getElementById("Gbtn");

		// 검색 버튼 클릭시 이벤트
		search_btn.addEventListener("click",function() {
		    let select = document.getElementById("Gselect");
			// select 선택값 없을때
			if(select.value == "null"){
				let cnt = 0;
				for(let i=0; i<content.length; i++){
					content[i].style.display="";
					cnt++;
				}
			}
			
			let select_box = ["rvCode","gameDay","gameTime","fieldName","fieldType","fieldRentalfee","userCode","userName","rvDay"];
			// 검색 로직
			for(let j=0; j<select_box.length; j++){
				if(select.value == select_box[j]){
					for(let i=0; i<content.length; i++){
						let selectItem = "."+select_box[j];
						text = document.querySelectorAll(selectItem)[i].innerText;
						if(text.indexOf(input.value) != -1) {
							content[i].style.display="";
						}else {
							content[i].style.display="none";
						}
					}
				}
			}
		});
		
		// 엔터키 활성화
		input.addEventListener("keyup", function (e) {
	        if (e.keyCode === 13) {
	           e.preventDefault();
	           search_btn.click();
	        }
	    });
		
    </script>

</body>
</html>