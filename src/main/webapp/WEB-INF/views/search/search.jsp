<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>이지풋볼</title>
			<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
		</head>
		<!-- CSS , JS -->
		<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css" />

		<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

		<body>
			<div id="container">
				<form action="${pageContext.request.contextPath}/search_result" method="get">
					<div id="searchbar">
<!-- 						<svg class="icon" width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" -->
<!-- 							class="icon"> -->
<%-- 							<circle data-v-454f7528="" cx="10.5" cy="10.5" r="6" stroke="#222836"></circle> --%>
<!-- 							<path data-v-454f7528="" stroke="#222836" d="M14.354 14.646l4.949 4.95"></path> -->
<!-- 						</svg> -->
						<input type="text" name="search" id="search" placeholder="경기지역 검색" autocomplete="off" />
<!-- 						<button id="searchbtn" disabled="disabled">검색</button> -->
					</div>
				</form>
				<div id="searchbox" class="saerchbox2">
					<span class="closebtn"><img src="${pageContext.request.contextPath}/image/close1.jpg" /></span>
					<div id="keyword">
						<p>최근 검색어</p>
						<ul id="keywords">

						</ul>
					</div>
					<section class="sch">
						<div class="schheader">
							<h3>다양한 매치</h3>
						</div>
						<div class="schmain">
							<a href="${pageContext.request.contextPath}/home">
								<p>소셜매치</p>
							</a>
							<a href="${pageContext.request.contextPath}/team/team">
								<p>팀매치</p>
							</a>
							<a href="${pageContext.request.contextPath}/rental/rental">
								<p>구장예약</p>
							</a>
						</div>
					</section>
					<section class="sch">
						<div class="schheader">
							<h3>새로운 경기장</h3>
						</div>
						<div class="schmain2">
							<ul id="stadiumlist">
								<%-- <c:forEach items="${list}" var="field">
									<li><a class="recent"
											href="${pageContext.request.contextPath}/stadium/${field.fieldCode}">${field.fieldName}</a>
									</li>
								</c:forEach> --%>
							</ul>
						</div>
					</section>
				</div>
				<div id="search_result_box">
					<span class="closebtn"><img src="${pageContext.request.contextPath}/image/close1.jpg" /></span>
					<h5 id="search_result_box_inner"></h5>
					<section class="sch">
						<ul id="insert_target"></ul>
						<ul id="search_result_list">
							<!-- 검색어 자동저장 -->
						</ul>
					</section>
				</div>
			</div>
			<script type="text/javascript">
				/* X버튼 클릭시 검색창 종료 */
				const closebtn = document.querySelectorAll(".closebtn");
				const searchbox = document.getElementById("searchbox");
				closebtn.forEach(el => {
					el.addEventListener("click", e => {
						$("#searchbox").hide();
						$("#search_result_box").hide();
						$("#search").val(null);
					});
				});

				searchbox.addEventListener("click", e => {
					const evTarget = e.target;
					if (evTarget.classList.contains("saerchbox2")) {
						saerchbox.style.display = "none";
					}
				});
			</script>
			
			<script type="text/javascript">
			$('#search').on("keypress", function(e){
				if(e.keyCode==13){
					e.preventDefault();
				}	
			});
			
			</script>


			<script type="text/javascript">
				/* 인풋창 입력시 데이터 실시간 받아오기 */
				$("#search").on("change keyup", react);
				function react(e) {
				
					// textarea 입력된 글자수 길이 확인	
					var inputLength = $(this).val().trim().length;

					// textarea 에 작성된 전체 데이터 확인
					var totalText = $(this).val();
					// if (e.keyCode != 37 && e.keyCode != 39) {

					// textarea 에 현재 입력된 데이터 확인 
					var nowText = totalText.substring(inputLength - 1, inputLength);

					$("#search_result_box_inner").text("'" + totalText + "'에 대한 검색결과");

					if (inputLength == 0) {
						$("#searchbox").css("display", "block");
						$("#search_result_box").css("display", "none");
					} else {
						$("#searchbox").css("display", "none");
						$("#search_result_box").css("display", "block");
					}


// 					if (e.keyCode != 8 && !e.altKey && !e.ctrlKey && e.keyCode != 16 && e.keyCode != 17 && e.keyCode != 18 && e.keyCode != 19 && e.keyCode != 20 && e.keyCode != 27 && e.keyCode != 37 && e.keyCode != 39) {
					const searchText = document.getElementById("search").value;
					const simple_data1 = { searchText };

					const lastText = searchText.charAt(searchText.length - 1);
					$.ajax({
						url: "${pageContext.request.contextPath}/recent_list",
						type: "POST",
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						data: JSON.stringify(simple_data1),
						async: false,
						success: function (data) {
							// console.log(data);
							// console.dir(data);
							const ul = document.getElementById("search_result_list");

							if (ul.hasChildNodes() /*&& (inputLength == 0 || data.length === 0 || lastText != nowText) */) {
								while (ul.hasChildNodes()) {
									ul.removeChild(ul.firstChild);
								}
							}

							for (let list of data) {
								const li = document.createElement("li");
								const a = document.createElement("a");
								if (inputLength > 0 && list.fieldName.trim() != null) {
									console.log((list.fieldName) - 1);
									console.log(list.fieldName);
									a.innerText = list.fieldName;
									a.href = "${pageContext.request.contextPath}/rental/rentalDetail?fieldCode=" + list.fieldCode;
									a.classList.add("recent");
									li.append(a);
									ul.append(li);
								}

								console.log("list :" + list.fieldName - 1 == list.fieldName);
								console.log("--------------------");
							}
							$(".recent").on("click", recentAdd);
						},
						error: function (e2) {
							alert(e2);
						}

					});
					/* const fieldName = searchText;
					const simple_data = { fieldName };
					$.ajax({
						url: "${pageContext.request.contextPath}/recent_list",
						type: "GET",
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						data: JSON.stringify(simple_data),
						success: function (data) {
							console.log(data);
							for (let recent of data) {
								cosnole.log("field Text :" + recent.fieldName);
							}
						},
						error: function (e) {
							alert(e);
						}
					}); */


					/* 답없음 */
					/* var isComplete = false;
					var ref = [
						{ key: 1, name: '데이터1' },
						{ key: 2, name: '데이터2' },
						{ key: 3, name: '자바스크립트' },
						{ key: 4, name: 'Json' },
					];
	
					var txt = $(this).val();
	
					ref.forEach(function (arg) {
						if (arg.name.indexOf(txt) > -1) {
							$("#search_result_list").append("<li>").text(arg.name).attr({ 'key': arg.key });
						}
					});
	
					$('#search_result_list').children().each(function () {
						$(this).click(function () {
							$('#search').val($(this).text());
							$('#insert_target').val("key : " + $(this).attr('key') + ", data : " + $(this).text());
							$('#search_result_list').children().remove();
							isComplete = true;
						});
					});*/


					/* $(function () {
						$("#seearch").autocomplete({
							source: function (request, response) {
								$.ajax({
									url: "${pageContext.request.contextPath}/recent_list",
									type: "POST",
									dataType: "json",
									data: JSON.stringify(request.term),
									success: function (data) {
										response(
											$.map(data, function (item) {
												return {
													label: item.AREA_NAME,
													value: item.AREA_NAME,
													idx: item.IDX,
												}
											})
										)
									}
								})
							},
							focus: function(event, ui){
								return false;
							},
							select: function(event,ui){
								console.log(ui.item.idx)
							},
							delay: 100,
							autoFocus: true
						});
					}) */
					// }
				};



			</script>

			<script type="text/javascript">
				/* 모달하다망함 */
				$('#search').on("click", function () {
					if ($('#search').val() == null || $('#search').val() == '') {
						$('#searchbox').show();
						$('#search_result_box').hide();
					}
					/* if($.trim($('#search').val()) != null || $.trim($('#search').val() != '')){
						$('#searchbox').hide();
						$('#search_result_box').show();
					} */
				});
				/* $(document).on('click',function(e){
					if($("#searchbox").is(e.target)){
						$("#searchbox").hide();
					}
				}); */


				/* 최근 검색어 추가하기 */
				const readd = document.querySelectorAll(".recent");
				readd.forEach(el => {
					el.addEventListener("click", recentAdd);
				});


				/* 함수 영역 추가 */
				function recentAdd() {
					const searchData = document.getElementById("search").value;

					if (searchData.trim() == '' || searchData.trim() == null) {
						return;
					}
					const ul = document.getElementById("keywords");


					const simple_data4 = { searchData };

					$.ajax({
						url: "${pageContext.request.contextPath}/recent",
						type: "post",
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						data: JSON.stringify(simple_data4),
						async: false,
						success: function (data) {
							console.log(data);
							if (data.state == "ok") {
								const li = document.createElement("li");
								const span1 = document.createElement("span");
								const span2 = document.createElement("span");
								span2.innerText = " x ";
								span1.classList.add("recent_data");
								span1.innerText = searchData;
								li.append(span1);
								li.append(span2);
								ul.append(li);
							}
						},
						error: function (e) {
							alert(e);
						}
					});
					/* span2.addEventListener("click", function () {
						const searchData = span1.innerText;
						const simple_data3 = { searchData };
						$.ajax({
							url: "${pageContext.request.contextPath}/delete_recent",
							type: "POST",
							contentType: "application/json; charset=utf-8",
							dataType: "json",
							data: JSON.stringify(simple_data3),
							success: function (data) {
								console.log(data);
								if (data.state == "ok") {
									span2.parentElement.remove();
								}
							},
							error: function (e) {
								alert(e);
							}
						})
					}); */
				}

				/* 최근검색어 받아오기 */
				window.addEventListener("DOMContentLoaded", function () {
					$.ajax({
						url: "${pageContext.request.contextPath}/recent",
						type: "GET",
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						async: false,
						success: function (data) {
							const ul = document.getElementById("keywords");
							const ul2 = document.getElementById("stadiumlist");
							for (let recent of data) { // json타입은 .으로 접근이 안되서어서 for문으로 접근을 하게 만듬
								const li = document.createElement("li");
								const span1 = document.createElement("span");
								const span2 = document.createElement("span");
								span2.innerText = " x ";
								span1.classList.add("recent_data");
								span1.innerText = recent.searchData;
								li.append(span1);
								li.append(span2);
								ul.append(li);

								// 최근검색어 삭제 버튼 
								span2.addEventListener("click", function () {
									const searchData = span1.innerText;
									const simple_data2 = { searchData };
									$.ajax({
										url: "${pageContext.request.contextPath}/delete_recent",
										type: "POST",
										contentType: "application/json; charset=utf-8",
										dataType: "json",
										data: JSON.stringify(simple_data2),
										async: false,
										success: function (data) {
											console.log(data);
											if (data.state == "ok") {
												span2.parentElement.remove();
											}
										},
										error: function (e) {
											alert(e);
										}
									})
								});
							}
							$('.recent_data').click(function () {
								const data1 = $(this).text();
								$('#search').val(data1);
								const searchText = document.getElementById("search").value;
								const simple_data1 = { searchText };
								const s_data1 = { data1 };
								const ul = document.getElementById("search_result_list");
								
								$.ajax({
									url: "${pageContext.request.contextPath}/recent_list",
									type: "POST",
									contentType: "application/json; charset=utf-8",
									dataType: "json",
									data: JSON.stringify(simple_data1),
									async: false,
									success: function (data) {
										console.log(data);
										for (let list of data) {
										/* $('#search').val(data1); */
										$("#searchbox").css("display", "none");
										$("#search_result_box").css("display", "block");
										$("#search_result_box_inner").text("'" + data1 + "'에 대한 검색결과");
											const li = document.createElement("li");
											const a = document.createElement("a");
											console.log((list.fieldName) - 1);
											console.log(list.fieldName);
											a.innerText = list.fieldName;
											a.href = "${pageContext.request.contextPath}/rental/rentalDetail?fieldCode=" + list.fieldCode;
											a.classList.add("recent");
											li.append(a);
											ul.append(li);
										}
										// $(".recent").on("click", recentAdd);
									},
									error: function (e2) {
										alert(e2);
									}
								});
							});
						}
					});
				});

			</script>

			<script type="text/javascript">
				window.addEventListener("DOMContentLoaded", function(){
// 				$('#search').on("click", function(){
					$.ajax({
						url: "${pageContext.request.contextPath}/searchlist",
						type: "GET",
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						async: false,
						success: function(data){
							const ul2 = document.getElementById("stadiumlist");
							console.log(data);
							for (const list of data) {
								const li2 = document.createElement("li");
								const a2 = document.createElement("a");
								const p = document.createElement("p");
								p.innerText = list.fieldName;
// 								a2.innerText = list.fieldName;
								a2.href = "${pageContext.request.contextPath}/rental/rentalDetail?fieldCode=" + list.fieldCode;
								a2.append(p);
								li2.append(a2);
								ul2.append(li2);		
							}
						},
						error: function(e){
							alert(e);
						}
					})

					/* fetch("${pageContext.request.contextPath}/searchlist")
						.then(response => response.json())
						.then(data => console.log(data))
						.catch(error => console.log(error)); */
				});
			</script>
		</body>

		</html>