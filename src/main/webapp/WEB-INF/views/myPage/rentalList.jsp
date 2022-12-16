<%@page import="com.sample.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>구장예약 내역</title>
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

.main_title{
	display: flex;
	justify-content: flex-start;
	font-size: 20px;
	font-weight: bold;
	padding-left: 15px;
	color: #525252;
}

#main_container {
    display: flex;
    width: 100%;
    height: 100%;
    justify-content: center;
    padding-top: 50px;
/*     background-color: #ccc; */
}

.main_area {
	display:flex;
    width: 1024px;
/*     height: 900px; */
    min-height: 500px;
/*     background-color: #ffaaaa; */
    align-items: center;
    flex-wrap: wrap;
/*     border: 1px solid black; */
}

.main_content1 {
	display: flex;
	flex-direction: column;
	width: 98%;
	background-color: #fff;
}

.main_box1 {
	width: 100%;
	height: 100%;
	padding: 15px;
/* 	background-color: #fffaec; */
/* 	color: #fff; */
}


#rantal_nav	{
	display: block;
	width: 100%;
	height: 50%;
/* 	border: 1px solid black; */
}


#rantal_list{
	width: 100%;
	border-collapse: collapse;
	font-size: 0.8rem;
	/* background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%); */
}

#rantal_list th, td {
	padding: 18px;
	text-align: center;
}

#rantal_list th:first-child{
	border-radius: 15px 0 0 0;
}

#rantal_list th:last-child{
	border-radius: 0 15px 0 0;
}

#rantal_list th {
	background-color: #26a653;
	color: #fff;
	border-bottom: 1px solid black;
}

.collapsible {
	display: none;
	background: #F4F4F4;
}

.rantal_content{
	padding: 10px;
	hight: 150px;
}

.infobox > ul {
	display: flex;
    justify-content: space-between;
    list-style-type: none;
    text-align: left;
    height: 100px;
    padding-right: 40px;
}

.infobox > ul > li {
	display: flex;
    flex-direction: column;
	/* display: inline-block;
	padding: 15px 5px;
	margin-right: 20px;
	background-color: #fff;
	border-radius: 15px; */
}

.rantal_item:nth-child(4n) {
   /*  background-color: #ddd; */
}

.rantal_item td:last-child {
	font-weight: 800;
}

#npc {
	text-align: center;
	font-size: 40px;
}

   .btn_box{
	display: flex;
	justify-content: space-evenly;
	width: 100%;
	margin-bottom: 5%;
}
    
    .btn_box button {
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
	cursor: pointer;
}

.btn_box button:hover {
	opacity: 0.8;
}

.select_box {
	align-self: flex-end;
	margin: 0 15px 10px 0;
}



.bottom_banner {
	width: 100%;
	height: 205px;
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
	margin-top:150px;
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

.rvcodebox{
	display: flex;
	justify-content: space-around;
}
.rvcodep{
	color : #26A653;
	font-weight: bold;
	font-size: 16px;
}
.rantal_item{
	border: 1px solid #CDCDCD;
	margin: 3px;
	padding: 3px;
}
.marginbox > td{
	padding: 0;
}
.statebox{
	width: 300px;
	display: flex;
    justify-content: flex-end;
    font-size: 16px;
}
.downbox{
	display: flex;
    align-items: center;
    width: 25px;
}
td > a{
	text-decoration: none;
	color: black;
}
.infobox{
	display: flex;
    flex-direction: column;
}
.daybox{
	font-size: 14px;
	font-weight: bold;
	display: flex;
    padding-left: 38px;
    padding-top: 20px;
    padding-bottom: 20px;
}
.namebox{
	color: #525252;
	font-size: 14px;
	font-weight: bold;
	padding-bottom: 10px;
}
.paybox{
	font-size: 16px;
	font-weight: bold;
}
.opbox{
	width: 90px;
	text-align:center;
    border-radius: 30px;
    margin-right: 10px;
    border: 1px solid #A9A9A9;
    font-size: 12px;
    height: 30px;
}
    .header_icon {
	    text-decoration: none;
	    color: #4e4e4e;
	    font-size: 27px;
	    margin-left: 15px;
    }
        .refund{
    	height: 35px;
    	width : 91%;
    	margin: 0 auto;
    	display: flex;
    	justify-content: flex-end;
    	padding-bottom: 10px;
    }
    .refundbtn{
    	background-color: white;
    	border: 1px solid #26A653;
    	font-size: 12px;
    	border-radius: 40px;
    }
</style>
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
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
			<div class="main_title">구장예약 내역</div>
				<div class="main_content1">
					<section class="select_box">
	                <select class="match_type  opbox">
	                    <option value="전체경기">전체</option>
	                    <option value="팀매치">팀매치</option>
	                    <option value="구장예약">구장예약</option>
	                </select>
					<select class="state opbox">
	                    <option value="전체상태">예약상태</option>
	                    <option value="예약완료">예약완료</option>
	                    <option value="신청취소">예약취소</option>
	                </select>
	                </section>
					<section class="main_box1">
						<div id="rantal_nav">
							<h1 id="npc">예약 내역이 없습니다.</h1>
							<table id="rantal_list">
								<!-- <thead> -->
									<tr style="display: none;">
										<th>예약번호</th>
										<th>매치타입</th>
										<th>구장명</th>
										<th>매치일자</th>
										<th>매치시간</th>
										<th>상태</th>
									</tr>
									
								<!-- </thead> -->
								<!-- <tbody> -->
<!-- 									<tr class="rantal_item"> -->
<!-- 										<td>111111</td> -->
<!-- 										<td>대충 어딘가 경기장</td> -->
<!-- 										<td>대충어디도 어디시 어디동 11</td> -->
<!-- 										<td>2022-01-02</td> -->
<!-- 										<td>14:00 ~ 16:00</td> -->
<!-- 										<td>예약완료</td> -->
<!-- 									</tr> -->
<!-- 									<tr class="collapsible"> -->
<!-- 										<td class="rantal_content" colspan="10" height="100px"> -->
<!-- 											<ul> -->
<!-- 												<li>매치종류 : 구장예약</li> -->
<!-- 												<li>매치형태 : 6:6</li> -->
<!-- 												<li>예약자 : 사람1</li> -->
<!-- 												<li>예약신청일 : 2022-01-01</li> -->
<!-- 												<li>결제금액 : 120,000</li> -->
<!-- 											</ul> -->
<!-- 										</td> -->
<!-- 									</tr> -->
<!-- 									<tr class="rantal_item"> -->
<!-- 										<td>222222</td> -->
<!-- 										<td>대충 어딘가 경기장</td> -->
<!-- 										<td>대충어디도 어디시 어디동 11</td> -->
<!-- 										<td>2022-01-02</td> -->
<!-- 										<td>14:00 ~ 16:00</td> -->
<!-- 										<td>예약완료</td> -->
<!-- 									</tr> -->
<!-- 									<tr class="collapsible"> -->
<!-- 										<td class="rantal_content" colspan="10" height="100px"> -->
<!-- 											<ul> -->
<!-- 												<li>매치종류 : 팀예약</li> -->
<!-- 												<li>매치형태 : 6:6</li> -->
<!-- 												<li>예약자 : 사람1</li> -->
<!-- 												<li>예약신청일 : 2022-01-01</li> -->
<!-- 												<li>결제금액 : 120,000</li> -->
<!-- 											</ul> -->
<!-- 										</td> -->
<!-- 									</tr> -->
								<!-- </tbody> -->
							</table>
						</div>
<!-- 										<li>예약번호 : 111111</li> -->
<!-- 										<li>예약일자 : 2022-01-01</li> -->
<!-- 										<li>예약구장 : 대충어딘가경기장</li> -->
<!-- 										<li>구장위치 : 대충어디도 어디시 어디동 11</li> -->
<!-- 										<li>매치타입 : 6:6</li> -->
<!-- 										<li>구장비용 : 120,000원</li> -->
<!-- 										<li>예약자 : 사람1</li> -->
<!-- 										<li>결제금액 : 120,000원</li> -->
<!-- 										<li>매치(대여)일자 : 2022-01-02</li> -->
<!-- 										<li>매치시간 : 09:00:00</li> -->
<!-- 										<li>상태 : 예약완료</li> -->
							
					</section>
				</div>
					<div class="btn_box">
						<button id="btn">뒤로가기</button>
					</div>
            </div>
        </div>

		
        
    <footer>
        <jsp:include page="../etc/footer.jsp"></jsp:include>
    </footer>

		<script type="text/javascript">
            let main_logo = document.querySelector(".main_logo");
            
            main_logo.addEventListener("click",function() {
                location.href="${pageContext.request.contextPath}";
            });
        </script>
         <script type="text/javascript">
	        $('#btn').click(function(){
				$(location).attr("href","${pageContext.request.contextPath}/myPage/myPage");
			});
        </script>
        <script type="text/javascript">
        	const table = document.getElementById("rantal_list");
        	table.style.display = "none";
        	// 목록 받아오기
        	window.addEventListener("DOMContentLoaded", function(){
        		let rvcode = "";
					$.ajax({
						url: "${pageContext.request.contextPath}/myPage/getRentalList",
						type: "GET",
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						async: false,
						success: function(data){				
							console.log(data);
							for (const list of data.list) {
								$('#npc').hide();
								table.style.display = "inline-table";
								console.log(data.userName);
								const tr1 = document.createElement("tr");
								const tr2 = document.createElement("tr");
								const tr3 = document.createElement("tr");
								const td1 = document.createElement("td");
								const newtd = document.createElement("td");
								newtd.className = "statebox";
								newtd.innerText = list.rvState;
								newtd.id = "stat" + list.rvCode;
								
								rvcode = list.rvCode;

								tr1.innerHTML = 
									"<td class='rvcodebox'>"+"<div class='downbox'>▽</div>"+"<div> <p>예약번호</p> <p class='rvcodep'>"+list.rvCode+"</p></div></td>"+
									"<td>"+list.fieldType+"</td>"+
									"<td><a href='${pageContext.request.contextPath}/rental/rentalDetail?fieldCode="+ list.fieldCode+"'>"+list.fieldName+"</a></td>"+
									"<td>"+list.gameDay+" 매치 </td>"+
									"<td>"+list.gameTime1+" ~ "+list.gameTime2+"</td>";
								tr1.append(newtd);
									if(list.rvState == '예약취소' || list.rvState == '취소신청'){
										newtd.style.color = "#CDCDCD";
										td1.innerHTML = "<div class='infobox'><div class='daybox'>"+list.rvDay+" 예약 </div><ul>"+
										"<li><p class='namebox'>구장주소</p><p>"+list.fieldAddress+"</p></li>"+
										"<li style='padding-right: 80px;'><p class='namebox'>예약자</p><p>"+data.userName+"</p></li>"+
										"<li style='padding-right: 80px;'><p class='namebox'>예약타입</p><p>"+list.rvType+"</p></li>"+
										"<li><p class='namebox'>결제정보</p><p>총 결제금액</p></li>"+
										"<li><p class='namebox'>　</p><p class='paybox'>"+list.userPayment.toLocaleString()+"원</p></li>"+
										"</ul> <div class='refund' style='visibility: hidden;'> <button class='refundbtn'>신청 취소</button> </div>";
									}else{
										td1.innerHTML = "<div class='infobox'><div class='daybox'>"+list.rvDay+" 예약 </div><ul>"+
										"<li><p class='namebox'>구장주소</p><p>"+list.fieldAddress+"</p></li>"+
										"<li style='padding-right: 80px;'><p class='namebox'>예약자</p><p>"+data.userName+"</p></li>"+
										"<li style='padding-right: 80px;'><p class='namebox'>예약타입</p><p>"+list.rvType+"</p></li>"+
										"<li><p class='namebox'>결제정보</p><p>총 결제금액</p></li>"+
										"<li><p class='namebox'>　</p><p class='paybox'>"+list.userPayment.toLocaleString()+"원</p></li>"+
										"</ul> <div class='refund' style='visibility: visible;'> <button class='refundbtn' id=" + list.rvCode + ">신청 취소</button> </div>";
									}
									
									
								tr3.className = "marginbox";
								tr3.innerHTML = 
									"<td>　</td>"+
									"<td>　</td>"+
									"<td>　</td>"+
									"<td>　</td>"+
									"<td>　</td>"+
									"<td>　</td>";
								
								
								td1.classList.add("rantal_content");
								td1.style.height = "150px";
								td1.colSpan = "10";
								tr1.classList.add("rantal_item");
								tr2.classList.add("collapsible");
								tr2.append(td1);
								table.append(tr1);
								table.append(tr2);
								table.append(tr3);
								
								// select 박스 예약상태 확인 
								$('.state').on("change", function(){
									tr1.style.display = "table-row";
									$('.collapsible').hide();
					        		if($('.state').val() == "예약완료"){
					        			if(list.rvState == '취소신청' || list.rvState == '예약취소'){
					        				tr1.style.display = "none";
					        			}
					        		}else if($('.state').val() == "신청취소"){
					        			if(list.rvState == '예약완료'){
					        				tr1.style.display = "none";
					        			}
					        		}else{
					        			tr1.style.display = "table-row";
					        		}
					        	});
								
								$('.match_type').on("change", function(){
				        			tr1.style.display = "table-row";
				        			$('.collapsible').hide();
									if($('.match_type').val() == "팀매치"){
					        			if(list.rvType == '구장예약'){
					        				tr1.style.display = "none";
					        			}
					        		}else if($('.match_type').val() == "구장예약"){
					        			if(list.rvType == '팀매치'){
					        				tr1.style.display = "none";
					        			}
					        		}else{
					        			tr1.style.display = "table-row";
					        		}
								});
								
								//  취소
								$('.refundbtn').on("click",function(){
						     		var del = confirm("정말취소하시겠습니까?");
									 if(del){
										 var numse = $(this).prop("id");
							        	 	var select = "#stat"+numse;
							        	 	
							        	 	let params = {rvCode:numse};
							        	 	 $.ajax({
							      		      url:"${pageContext.request.contextPath}/myPage/refund",
							      		      type:"POST",
							      		      contentType:"application/json; charset=utf-8",
							      		      dataType : "json",
							      		      data:JSON.stringify(params), 
							      		      success: function(data) {
							      		    	if(data ==1){
							      		    		location.reload();
							      		    		/* console.log("성공");
							      		    		console.log(this);
							      		    		$(select).text("취소신청");
							      		    		$(select).css('color','#CDCDCD');
							      		    		$(numse).css('visibility','#hidden'); */
							      		    	}
							      		    	  
							      		      },
							      		      error: function() {
							      		          alert("에러 발생");
							      		      }
							      		  })
									 }else{
										 location.reload();
									 } 
				        	 	
				        		
				        	});
								
								
							}
								// list 누르면 아래 박스추가
					        	$('.rantal_item').on("click",function(){
									$(this).next().nextAll('.collapsible').hide();
									$(this).next().prevAll('.collapsible').hide();
										console.log($(this).next().css('display'));
									if($(this).next().css('display') == "table-row"){
										$(this).next().hide();
										return;
									}
					        		$(this).next().show();
					        	});
							
						},
						error: function(e){
							alert(e);
						}
					})
				});
        </script>
	</div>
</body>
</html>