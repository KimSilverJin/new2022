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
		width: 10%;
	    display: flex;
	}
	.Goption {
		display: flex;
		width:70%;
	}
	#Gselect{
	    width: 100%;
	    border: 1px solid #000;
	}
	.GRsearch{
    	width: 100%;
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
		width:40px;
	}
	table tr th:nth-child(2){
		width:95px;
	}
	table tr th:nth-child(7){
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
	
	.Gbutton{
		height: 30px;
	    justify-content: center;
	    display: flex;
	    align-items: center;
	   	width: 125px;
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
	
	.menu1 {
		background-color: #f8ede3;
	}
</style>
</head>
<body>
	<div class="Gcontainer">
		<form name="form1" action="${pageContext.request.contextPath}/admin/payselect" method="get">
			<div class="Gheader_area">
				<div class="Gselect_option">
					<select name="Gselect" id="Gselect">
						<option value="null">??????</option>
						<option value="rvCode">????????????</option>	
						<option value="rvType">????????????</option>	
						<option value="gameDay">????????????</option>
						<option value="gameTime">????????????</option>
						<option value="fieldCode">????????????</option>
						<option value="fieldRentalfee">?????????</option>
						<option value="userPayment">????????????</option>
						<option value="payCode">????????????</option>
						<option value="userCode">????????????</option>
						<option value="userName">????????????</option>
						<option value="rvDay">????????????</option>						
					</select>
				</div>
				<div class="Goption">
					<div class="GRsearch">
						<input type="text" name="Gsearch" id="Gsearch" placeholder="??????????????? ?????? ????????? ???????????????" />
						<input type="text" style='display:none;' />
					</div>
					<div class="Gbutton">
						<button type="button" id="Gbtn">??????</button>
					</div>	
					<div class="Gbutton">
						<button type="button" class="Gdelete_btn" name="payselect" value="pay_cancel">????????????</button>
					</div>	
				</div>			
			</div>
		<div class="rv_table_area">
			<table>
				<thead>
					<tr>
						<th><input type="checkbox" name="allCheck" id="allCheck"/></th>
						<th>????????????</th>
						<th>????????????</th>
						<th>??????</th>
						<th>????????????</th>						
						<th>????????????</th>
						<th>????????????</th>		
						<th>?????????</th>
						<th>????????????</th>
						<th>????????????</th>
						<th>????????????</th>
						<th>????????????</th>
						<th>????????????</th>
						<th>????????????</th>		
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${rvListAll}">
						<tr class="content">
							<td><input type="checkbox" name="chBox" class="chBox" value="${item.rvCode}" /></td>
							<td class="rvCode">${item.rvCode}</td>
							<c:if test="${item.rvType eq 'G'}">
							<td class="rvType">G????????????</td>
							</c:if>
							<c:if test="${item.rvType eq 'T'}">
							<td class="rvType">T????????????</td>
							</c:if>
							<c:if test="${item.rvType eq 'S'}">
							<td class="rvType">S??????</td>
							</c:if>
							<c:if test="${item.rvType eq 'TS'}">
							<td class="rvType">T??????</td>
							</c:if>
							<td class="rvState">${item.rvState}</td>
							<td class="gameDay">${item.gameDay}</td>
							<td class="gameTime">${item.gameTime}</td>
							<td class="fieldCode">${item.fieldCode}</td>
							<td class="fieldRentalfee"><fmt:formatNumber value="${item.fieldRentalfee}" pattern="#,###"/></td>
							<td class="userPayment"><fmt:formatNumber value="${item.userPayment}" pattern="#,###"/></td>
							<td class="gameCode">${item.gameCode}</td>
							<td class="payCode">${item.payCode}</td>
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
        let select_all_btn = document.getElementById("allCheck");
        let select_check_btn = document.querySelectorAll(".chBox");

        // ?????? ?????? ??????
        select_all_btn.addEventListener("click",function() {
            select_check_btn.forEach(function(e){
                if(select_all_btn.checked == true){
                    e.checked = true;
                    
                }else if(select_all_btn.checked != true){
                    e.checked = false;
                }
            });
            
        });
        
        // ?????? ?????? ??????
        select_check_btn.forEach(function(e){
        	e.addEventListener("click",function() {
	        	select_all_btn.checked = false;
	        });
        });

        // ?????? ?????? ?????? ?????????
	    let delete_btn = document.querySelector(".Gdelete_btn");
		let select_cnt = 0;
	    delete_btn.addEventListener("click",function() {
	    	
	        select_check_btn.forEach(function(e){
		        if(e.checked == true){
		        	select_cnt++;
		        }
	        });
	        
	        if(select_cnt < 1){
	        	alert("?????? ??? ?????? ????????? ????????????.");
	        	select_cnt = 0;
	        	return;
	        }else{
	        	if(confirm("????????? ?????????????????????????")){
					this.type ="submit";
	        	}else {
	        		return;
	        	}
	        }

	    });

		let content = document.querySelectorAll(".content");
		var input = document.getElementById("Gsearch");
		let search_btn = document.getElementById("Gbtn");

		// ?????? ?????? ????????? ?????????
		search_btn.addEventListener("click",function() {
		    let select = document.getElementById("Gselect");
			// select ????????? ?????????
			if(select.value == "null"){
				let cnt = 0;
				for(let i=0; i<content.length; i++){
					content[i].style.display="";
					cnt++;
				}
			}
			
			let select_box = ["rvCode","rvType","gameDay","gameTime","fieldCode","fieldName","fieldRentalfee","userPayment","payCode","userCode","userName","rvDay"];
			// ?????? ??????
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
		
		// ?????? ????????? ?????????
		input.addEventListener("input",function() {
		    let select = document.getElementById("Gselect");
			// select ????????? ?????????
			if(select.value == "null"){
				let cnt = 0;
				for(let i=0; i<content.length; i++){
					content[i].style.display="";
					cnt++;
				}
			}
			
			let select_box = ["rvCode","rvType","gameDay","gameTime","fieldCode","fieldName","fieldRentalfee","userPayment","payCode","userCode","userName","rvDay"];
			// ?????? ??????
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
		
		// ????????? ?????????
		input.addEventListener("keyup", function (e) {
	        if (e.keyCode === 13) {
	           e.preventDefault();
	           search_btn.click();
	        }
	    });
		
    </script>

</body>
</html>