<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fieldInfo.css" />
<style type="text/css">
	.menu1 {
		background-color: #f8ede3;
	}
</style>
</head>
<body>
<div class="container">
    <form action="${pageContext.request.contextPath}/admin/fieldselect" method="get">
    <div class="field_list_title">
        <h1>구장 목록</h1>
        <div class="button_area">
			<input type="hidden" name="fieldselect" value="fieldModify">
            <button class="field_modify" name="fieldChange" value="modify">수정</button>
            <button class="field_delete" name="fieldChange" value="delete">삭제</button>
        </div>
    </div>
    
    <div class="field_list_area">
    	<div class="option_bar">
            <div class="select_area">
                <div class="select_input_area">
                    <input type="checkbox" name="select_all" class="check_box " id="select_all" value="check">&nbsp;<b>전체선택</b>
                </div>
                <select name="local" id="search_local">
                    <option id="null" value="null">지역</option>
                    <option id="서울" value="서울">서울</option>
                    <option id="인천" value="인천">인천</option>
                    <option id="경기도" value="경기">경기도</option>
                    <option id="강원도" value="강원">강원도</option>
                    <option id="경상도" value="경상">경상도</option>
                    <option id="전라도" value="전라">전라도</option>
                    <option id="충청도" value="충청">충청도</option>
                    <option id="제주도" value="제주">제주도</option>
                </select>
            </div>
            
            <div class="search_area">
                <input type="text" name="input_content" id="input_content" placeholder="경기장 이름을 검색하세요."><button id="search_btn">검색</button>
            </div>
        </div>
        <div class="content_area">
	        <c:forEach var="field" items="${fieldList}">
	        <div class="content">
	            <div class="check_btn_area">
	                <input type="checkbox" name="check_btn" class="check_box check_btn" value="${field.fieldCode}">
	            </div>
	            <div class="field_image_area">
	                <img src="${pageContext.request.contextPath}/image/ground/${field.fieldImg1}" class="field_image">
	            </div>
	            <div class="field_info">
	                <div class="field_info_content">
	                    <span class="field_name">구장명 : <b class="name">${field.fieldName}</b></span>
	                    <span class="field_address">구장주소 : <b class="address">${field.fieldAddress}</b></span>
	                    <span class="field_type">구장형태 : <b>${field.fieldType}</b></span>
	                    <span class="phone">구장연락처 : <b>${field.fieldCall}</b></span>
	                                          	
             
	                    <span class="phone">구장비용 : <b><fmt:formatNumber value="${field.fieldRentalfee}" pattern="#,###"/>원</b></span>
	                    <span class="etc_info">특이사항 : <b>${field.fieldGrass},${field.fieldInOut}</b></span>
	                </div>
	            </div>
	        </div>
	        </c:forEach>
	     </div>
	     	<script type="text/javascript">
	     		let field_modify = document.querySelector(".field_modify");
	     		let field_delete = document.querySelector(".field_delete");
	     		let check_boxes = document.querySelectorAll(".check_box");
	     		let f_cnt = 0;
	     		let t_cnt = 0;
	     		
	     		field_modify.addEventListener("click",function() {
	     			check_boxes.forEach(function(e){
	     				if(e.checked == false){
	     					f_cnt++;
	     				}else{
	     					t_cnt++;
	     					field_modify.type="submit";
	     				}
	     			});
		     			if(t_cnt > 1){
		     				field_modify.type="button";
							alert("하나의 정보만 수정해주세요.");
							t_cnt=0;
		     			}else if(check_boxes.length == f_cnt){
		     				field_modify.type="button";
		     				alert("수정할 정보가 없습니다!");
		     				f_cnt=0;
		     			}
	     		});
	     		
	     		field_delete.addEventListener("click",function() {
	     			check_boxes.forEach(function(e){
	     				if(e.checked == false){
	     					f_cnt++;
	     				}
	     			});
				if(check_boxes.length == f_cnt){
						field_delete.type="button";
	     				alert("삭제할 정보가 없습니다!");
	     				f_cnt=0;
	     			}else {
	     				if(confirm("정말 삭제하시겠습니까? 메인 게임리스트,구장예약에서도 모든 정보가 삭제됩니다.")){
	     					alert("선택 구장에 관련된 모든 정보가 삭제됩니다.");
	     					field_delete.type="submit";
	     				}else {
	     					field_delete.type="button";
	     				}
	     				
	     			}
	     		});
	     	</script>
	     
        	<script type="text/javascript">
	            var local = document.getElementById("search_local");
				var content = document.querySelectorAll(".content");
				var input = document.getElementById("input_content");
				
				
 	            local.addEventListener("change",function() {
				var field_address =document.querySelectorAll(".address");
				
				for(let i=0; i<field_address.length; i++){
					if(local.value == "null" && input.value == "") {
							content[i].style.display ="";
					}else{
							let address = field_address[i].innerText;
							// name에 있는 문장에 local.value값이 포함됐을 때 시작지점이 몇번째인지 반환, -1은 값이 없을때
							if(address.indexOf(local.value) != -1) {
								content[i].style.display = "";
							} else {
								content[i].style.display = "none";
							}
						}
					}
 	            });
 	            
 	            input.addEventListener("input",function() {
 	            	local.value = "null";
 					var field_name =document.querySelectorAll(".name");
 					
 					for(let i=0; i<field_name.length; i++){
 						if(local.value == "null" && input.value == "") {
 								content[i].style.display ="";
 						}else{
 								let name = field_name[i].innerText;
 								console.log(name.indexOf(input.value));
 								// name에 있는 문장에 local.value값이 포함됐을 때 시작지점이 몇번째인지 반환, -1은 값이 없을때
 								if(name.indexOf(input.value) != -1) {
 									content[i].style.display = "";
 								} else {
 									content[i].style.display = "none";
 								}
 							}
 						}
 	 	            });
	        </script>

        <script>
            let select_all_btn = document.getElementById("select_all");
            let select_check_btn = document.querySelectorAll(".check_btn");

            select_all_btn.addEventListener("click",function() {
                select_check_btn.forEach(function(e){
                    if(select_all_btn.checked == true){
                        e.checked = true;
                        
                    }else if(select_all_btn.checked != true){
                        e.checked = false;
                    }
                });
            });
            
            select_check_btn.forEach(function(event){
            	event.addEventListener("click",function() {
    	        	select_all_btn.checked = false;
    	        });
            });

            
        </script>
    </div>
    </form>
</div>
</body>
</html>