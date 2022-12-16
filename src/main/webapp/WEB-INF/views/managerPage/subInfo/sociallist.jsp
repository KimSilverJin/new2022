<%@page import="com.sample.vo.GlistVO"%>
<%@page import="com.sample.vo.UserVO"%>
<%@page import="com.sample.vo.FieldReservationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	List<FieldReservationVO> sgamelist = null;
	List<UserVO>userlist = null;
	List<GlistVO> gamelist = null;
	
	if(session.getAttribute("sgamelist") != null){
		sgamelist = (List<FieldReservationVO>)session.getAttribute("sgamelist");
	}
	if(session.getAttribute("userlist") != null){
		userlist = (List<UserVO>)session.getAttribute("userlist");
	}
	if(session.getAttribute("gamelist") !=null) {
		gamelist = (List<GlistVO>)session.getAttribute("gamelist");
	}
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>매니저페이지</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
<style>
	#searchbox1 {
		display: flex;
		height: 80px;
		align-items: center;
		justify-content: space-between;

	}
	
	#upside{
		display: flex;
		justify-content: space-between;
    	font-size: 15px;
    	margin-bottom:10px;
    	
	}
	
        #saerch{
			width: 50%;
		    height: 30px;
		    display: flex;	
		    justify-content: flex-end;
        }
        #inputbox{
        	width : 85%;
		    height: 30px;
		    background-color: #fff;
		    border: 1px solid #e5e5e5;
		    padding-left: 18px;
		    margin-right:10px;
        }
        

        #list{
    		display: flex;
    		justify-content: center;
        }
        #list table{
        	border-collapse: collapse;
        }
        #list table thead tr{
        	background-color : #D2D79F;
        }
       #list table tr th{
		    width: 120px;
		    height: 50px;
		    background-color: #e4e4e4;
		}
		#list table tbody tr {
			border-bottom: 1px dotted #c3c3c3;
		}
       		
       #list table tr th:first-child{
       		width : 50px;
       }
       #list table tr td{
       		height: 40px;
		    text-align: center;
       }
       #Cbox{
       		width : 18px;
       		height : 18px;
       }
       
       .searchbox1_area {
       	 	display: flex;
       	 	flex-direction: row;
       }
       #select{
		    height: 30px;
		    border: 1px solid #cfcfcf;
		    background-color: #F5F5F5;
		    color: #8E8E8E;
		    font-weight: bold;
		    text-align: center;
		    margin-right:20px;
     	}
       .checkbox{
       		width : 18px;
       		height : 18px;
       }
        .sub_menu1 {
		    background-color: #26a653;
		    color: white;
		    border-radius: 10px 10px 0px 0px;
		}
		.sub_menu2 {
			font-weight: 100;
		}		
		.sub_menu3 {
			font-weight: 100;
		}
	    .nev{
		    display: flex;
		    justify-content: center;
		    margin-top: 30px;
		    font-weight: bold;
		    color: #525252;		
    	}
        
        .box_css {
		    height: 30px;
		    border: 1px solid #cfcfcf;
		    background-color: #F5F5F5;
		    color: #8E8E8E;
		    font-weight: bold;
		    text-align: center;
		    cursor : pointer;
        }
        
        .page_btn {
        	color: #525252;
        	margin: 0px 6px 0px 6px;
        	cursor: pointer;
        }
        
        .listnum {
        	margin: 0px 7px 0px 7px;
        	cursor: pointer;
        }
	
	
	
	
	
	/* 모달 */
	
	
	  #modal {
            display: none;
            position: absolute;
            top: 30%;
            left: 36%;
            width: 400px;
            height: 305px;
            background-color: #fff;
            border-radius:25px;
            padding: 20px;
            box-shadow: 5px 5px 10px 10px #ddd;

        }

        #modalout {
            position: absolute;
            width: 1024px;
          	height: 100%;
            background-color: gray;
            display: none;
        }

        #flist {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        #flist>li {
            padding-top: 10px;
            display: flex;
            align-items: center;
            width: 100%;
        }

        #flist>li>p {
            width: 120px;
            font-size: 15px;
            height: 30px;
        }
        .listbox{
        	list-style: none;
            margin: 0;
            padding: 0;
            /* background-color: white; */
            width: 170px;
            height: 50px;
            overflow-y: scroll;
            overflow-x: hidden;
            visibility: hidden;
           
        }
        .gnumlist{
        	display: none;
        }
        .cnumlist{
        	display: none;
        }
        .inbox{
        	height: 30px;
        	width: 170px;
        }
        #btnbox2{
        	display: flex;
    		justify-content: center;
    		padding-top: 15px;
        }
        #btnbox2 * {
        	background: #26A653;
        	border: none;
        	border-radius: 20px;
        	color:#fff;
        	width: 50px;
        	font-size: 15px;
        	text-align: center;
        	margin-right: 10px;
        	
        }
</style>
</head>
<body>
	<div id="modalout"></div>
    <div id="modal">
        <h3>신청자 추가</h3>
            <ul id="flist">
                <li><p>경기번호 : </p> <input type="text" name="" id="ingameCode" class="inbox" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
                <li><p></p><ul id="gclist" class="listbox">
                    	<%
                    		for(int i=0; i<gamelist.size(); i++) {
                    			if(gamelist.get(i).getClose().equals("true")){
                    				if(gamelist.get(i).getGameType().equals("S")){
                    					%>
                            			<li id="gnum<%=i %>" class="gnumlist"><%out.println(gamelist.get(i).getGameCode());%></li>
                            			<%
                    				}else{
                    					%>
                            			<li id="gnum<%=i %>" class="gnumlist"><%out.println(gamelist.get(i).getGameCode());%>t</li>
                            			<%
                    				}
                    				
                    			}else{
                    				%>
                        			<li id="gnum<%=i %>" class="gnumlist"><%out.println(gamelist.get(i).getGameCode());%>x</li>
                        			<%
                    			}
                    			
                    		}
                    	%>
                    </ul>
                    </li>
                    
                <li><p>신청자코드 : </p> <input type="text" name="" id="inuserCode" class="inbox" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
                <li><p></p><ul id="uclist" class="listbox">
                    	<%
                    	for(int i=0; i<userlist.size(); i++) {
                			%>
                			<li id="cnum<%=i %>" class="cnumlist"><%out.println(userlist.get(i).getUserCode());%></li>
                			<%
                		}
                    	%>
                    </ul>
                    </li>
                    
                
            </ul>
            
            <div id="btnbox2">
            	<button id="addbtn">등록</button>
            	<div id="close">닫기</div>
            </div>

    </div>
    
    
    <!-- 게임 코드 숫자 검색 -->
	<script type="text/javascript">
	 var ing = document.getElementById("ingameCode");
	 let lcnt =0;
	 ing.addEventListener("keyup", function (event) {
		 document.getElementById("gclist").style.visibility = "visible";
		 for(let i =0; i< <%=gamelist.size()%>; i++){document.getElementById("gnum"+i).style.display = "none";}
		 
		 for(let i =0; i< <%=gamelist.size()%>; i++){
			 let intext = document.getElementById("ingameCode").value.trim();
			 let ortext = document.getElementsByClassName("gnumlist")[i].innerText.trim();
			 if(intext.length >= 3 ){
				 if(ortext.indexOf(intext) != -1 && ortext.indexOf("x") == -1 && ortext.indexOf("t") == -1){
					 document.getElementById("gnum"+i).style.display = "block";
					 document.getElementById("gnum"+i).style.backgroundColor = "#fff";
				}
				 if(intext == ortext){
					 lcnt++;
					 break;
				 }else{
					 lcnt = 0;
				 }
			 }
			 
		 }
       });
	</script>
	
	<!-- 유저 코드 숫자 검색 -->
	<script type="text/javascript">
	 var ing = document.getElementById("inuserCode");
	 let ccnt =0;
	 ing.addEventListener("keyup", function (event) {
		 document.getElementById("uclist").style.visibility = "visible";
		for(let i =0; i< <%=userlist.size()%>; i++){document.getElementById("cnum"+i).style.display = "none";}
		 
		 
		 for(let i =0; i< <%=userlist.size()%>; i++){
			 let intext = document.getElementById("inuserCode").value.trim();
			 let ortext = document.getElementsByClassName("cnumlist")[i].innerText.trim();
			 if(intext.length >= 2 ){
				 if(ortext.indexOf(intext) != -1){
					 document.getElementById("cnum"+i).style.display = "block";
					 document.getElementById("cnum"+i).style.backgroundColor = "#fff";
				 }
				 if(intext == ortext){
					 ccnt++;
					 break;
				 }else{
					 ccnt = 0;
				 }
			 }
			 
		 }
       });
	</script>
	
	
    <!-- 추가 -->
    <script type="text/javascript">
    document.getElementById("addbtn").addEventListener("click",function(){
    	let ingameCode = document.getElementById("ingameCode").value;
    	let inuserCode = document.getElementById("inuserCode").value;
    	console.log(document.getElementsByClassName("userCode").length);
    	let cnt =0;
    	
    	let pnum=0;
    	let index = 0;
    	for(let i=0; i< <%=sgamelist.size()%>; i++){
    		if(document.getElementsByClassName("gameCode")[i].innerText == ingameCode){
    			pnum = document.getElementsByClassName("GamePnum")[i].innerText;
    			index = i;
    			break;
    		}
    	} 
    	
    	if(lcnt > 0 && ccnt >0 ){
    		for(let i=0; i<   document.getElementsByClassName("userCode").length; i++){
        		
        		if(ingameCode == document.getElementsByClassName("gameCode")[i].innerText && inuserCode == document.getElementsByClassName("userCode")[i].innerText){
        			alert("이미 존재하는 신청자 입니다");
        			cnt++;
        			break;
        		}
        	} 
    		
    		var max = false;
    		if(cnt == 0 ){
    			console.log("신청"+pnum);
    			console.log("최대"+document.getElementsByClassName("GameMaxp")[index].innerText.trim());
    			if(pnum + 1 > document.getElementsByClassName("GameMaxp")[index].innerText.trim()){
        			var confirmflag = confirm("최대 신청자 수 이상입니다 신청 하시겠습니까?");
        			 if(confirmflag){
        				 location.href = "${pageContext.request.contextPath}/manager/sadd?userCode="+inuserCode+"&gameCode="+ingameCode;
        	           }
        		}else{
        			location.href = "${pageContext.request.contextPath}/manager/sadd?userCode="+inuserCode+"&gameCode="+ingameCode;
        		}
    		}
        	
		}else {
			alert("게임코드와 신청자코드를 확인해주세요");
		}
    	
    });
    
    </script>
    
    
    <!-- 모달 닫기 -->
    <script type="text/javascript">
    document.getElementById("close").addEventListener("click", function () {
        document.getElementById("modalout").style.display = "none";
        var modal =  document.getElementById("modal");
        modal.style.display = "none";
        document.getElementById("ingameCode").value = "";
        document.getElementById("inuserCode").value = "";
    });
    </script>
	
    
	<div id="out">
		<div id="searchbox1">
			<div class="searchbox1_area">
				<select name="" id="select" class="box_css">
				<option value="null">카테고리</option>
				<option value="subname">신청자</option>
				<option value="gamecode">경기번호</option>
				<option value="gday">경기일자</option>
				<option value="fieldname">경기장소</option>
				<option value="fieldtype">매치형태</option>
				<option value="gender">성별</option>
				<option value="mag">매니저</option>
				</select>
				<div id="btnbox">
					<button id="add" class="box_css">추가</button>
					<button id="del" class="box_css">삭제</button>
				</div>
			</div>
			<div id="saerch">
				<input type="text" name="" id="inputbox" placeholder="검색어를 입력하세요">
				<button id="sbtn" class="box_css">검색</button>
			</div>
		</div>

		<div id="result">
			<div id="upside">
				<div>총 <%=gamelist.size() %>건</div>
			</div>
			<div id="list">
				<table>
					<thead>
						<tr>
							<th><input type="checkbox" name="" id="Cbox"></th>
							<th>경기번호</th>
							<th>예약번호</th>
							<th>신청자</th>
							<th>신청자코드</th>
							<th>경기날짜</th>
							<th>경기장</th>
							<th>매치형태</th>
							<th>경기성별</th>
							<th>참여인원</th>
							<th>매니저</th>
						</tr>
					</thead>
					<tbody  id="tablelist">
						<%
							for(int i=0; i< sgamelist.size(); i++){
								%>
								<tr class="gamelist" id="list<%=i %>">
									<td><input type="checkbox" name="checkbox" class="checkbox"></td>
									<td class="gameCode">
										<%out.print(sgamelist.get(i).getGameCode()); %>
									</td>
									<td class="rvCode">
										<%out.print(sgamelist.get(i).getRvCode()); %>
									</td>
									<td class="userName">
										<%
											for(int j=0; j< userlist.size(); j++) {
												if(sgamelist.get(i).getUserCode() == userlist.get(j).getUserCode()){
													out.print(userlist.get(j).getUserName());
												}
											}
										%>
									</td>
									<td class="userCode">
										<%out.print(sgamelist.get(i).getUserCode()); %>
									</td>
									<td class="GameDay">
										<%out.print(sgamelist.get(i).getGameDay()); %>
									</td>
									<td class="fieldName">
										<%out.print(sgamelist.get(i).getFieldName()); %>
									</td>
									<td class="fieldType">
										<%out.print(sgamelist.get(i).getFieldType()); %>
									</td>
									<td class="GameGender">
										<%
											for(int j=0; j< gamelist.size(); j++){
												if(sgamelist.get(i).getGameCode() == gamelist.get(j).getGameCode()){
													out.print(gamelist.get(j).getGameGender());
												}
											}
										%>
									</td>
									<td class="GamePnum">
										<%
											for(int j=0; j< gamelist.size(); j++){
												if(sgamelist.get(i).getGameCode() == gamelist.get(j).getGameCode()){
													out.print(gamelist.get(j).getGamePnum());
												}
											}
										%>
									</td>
									<td class="GameMaxp" style="display: none;">
										<%
											for(int j=0; j< gamelist.size(); j++){
												if(sgamelist.get(i).getGameCode() == gamelist.get(j).getGameCode()){
													out.print(gamelist.get(j).getGameMaxp());
												}
											}
										%>
									</td>
									<td class="GameMag">
										<%
											for(int j=0; j< gamelist.size(); j++){
												if(sgamelist.get(i).getGameCode() == gamelist.get(j).getGameCode()){
													out.print(gamelist.get(j).getGameMag());
												}
											}
										%>
									</td>
								</tr>
							<%}
						%>
					</tbody>
				</table>
			</div>
			<div id="nev" class="nev">
			
			<%
			if((sgamelist.size()/15)>=1){
				for(int i=1; i<=sgamelist.size()/15+1; i++){
			%>
				<a href="#" id="<%=i%>" class="listnum"> <%out.print(i); %> </a>
			<%
				}
			}else{
			%>
				<a> 1 </a>
			<%
			}
			%>	
			</div>
		</div>

	</div>
	
	<!-- 초기 로딩시 -->
	<script type="text/javascript">
	for(let k=0; k< <%=sgamelist.size()%>; k++){
    	document.getElementById("tablelist").children[k].style.display = "none";
    }
	if(<%=sgamelist.size()%> <15) {
		for(let k=0; k<<%=sgamelist.size()%>; k++){
	    	document.getElementById("tablelist").children[k].style.display = "";
	    }
	}else{
		for(let k=0; k<15; k++){
	    	document.getElementById("tablelist").children[k].style.display = "";
	    }
	}
	
		
	</script>
	
	<!-- 리스트 바꾸기 -->
	<script type="text/javascript">
		for(let i=0; i<(<%=sgamelist.size()/15%>+1); i++){
			let j = i*15;
			
			document.getElementById("nev").children[i].addEventListener("click",function(){
	            for(let k=0; k< <%=sgamelist.size()%>; k++){
	            	document.getElementById("tablelist").children[k].style.display = "none";
	            }
	            
	            if(i==<%=sgamelist.size()/15%>){
	            	for(let k=j; k<<%=sgamelist.size()%>; k++){
		            	document.getElementById("tablelist").children[k].style.display = "";
		            	console.log("gma");
		            }
	            }else{
	            	for(let k=j; k<j+15; k++){
		            	document.getElementById("tablelist").children[k].style.display = "";
		            	console.log("durl");
		            }
	            }
	            
	        });
		}
	</script>

	<!-- 검색 -->
	<script type="text/javascript">
		document.getElementById("sbtn").addEventListener("click",function(){
		console.log(document.getElementById("select").value);
		
		
		/* 카테고리 */
		if(document.getElementById("select").value == "null"){
			
			let cnt = 0;
			for(let i=0; i<(<%=sgamelist.size()%>); i++){
				document.getElementById("tablelist").children[i].style.display = "";
				cnt++;
			}
			
			let num = Math.round((cnt / 15))+1;
			console.log(num);
			for(let i=num; i<<%=sgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		/* 신청자 검색 */
		if(document.getElementById("select").value == "subname"){
			
			let cnt = 0;
			for(let i=0; i<(<%=sgamelist.size()%>); i++){
				var text = document.getElementsByClassName("userName")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value)!= -1){
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			console.log(num);
			for(let i=num; i<<%=sgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		
		/* 경기번호 검색 */
		if(document.getElementById("select").value == "gamecode"){
			let cnt = 0;
			for(let i=0; i<(<%=sgamelist.size()%>); i++){
				var text = document.getElementsByClassName("gameCode")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=sgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		
		/* 경기일자 검색 */
		if(document.getElementById("select").value == "gday"){
			let cnt = 0;
			for(let i=0; i<(<%=sgamelist.size()%>); i++){
				var text = document.getElementsByClassName("GameDay")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=sgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		/* 경기장소 검색 */
		if(document.getElementById("select").value == "fieldname"){
			let cnt = 0;
			for(let i=0; i<(<%=sgamelist.size()%>); i++){
				var text = document.getElementsByClassName("fieldName")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=sgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		
		/* 매치형태 검색 */
		if(document.getElementById("select").value == "fieldtype"){
			let cnt = 0;
			for(let i=0; i<(<%=sgamelist.size()%>); i++){
				var text = document.getElementsByClassName("fieldType")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=sgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		/* 매니저 검색 */
		if(document.getElementById("select").value == "mag"){
			let cnt = 0;
			for(let i=0; i<(<%=sgamelist.size()%>); i++){
				var text = document.getElementsByClassName("GameMag")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value)!= -1) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=sgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		
		/* 경기성별 검색 */
		if(document.getElementById("select").value == "gender"){
			let cnt = 0;
			for(let i=0; i<(<%=sgamelist.size()%>); i++){
				var text = document.getElementsByClassName("GameGender")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=sgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		
	});
	</script>
	
	
	<!-- 엔터키 검색 -->
	<script type="text/javascript">
	 var input = document.getElementById("inputbox");
	 input.addEventListener("keyup", function (event) {
		 console.log("dlqfur");
         if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("sbtn").click();
         }
       });
	</script>
	

	<!-- 삭제 -->
	<script type="text/javascript">
		 document.getElementById("del").addEventListener("click",function(){
			 var cklist = "rvCode=0";
			 var gclist = "gameCode=1";
			 var uclist = "userCode=1";
			 for(var i=0; i< <%=sgamelist.size()%>; i++){
				 if(document.getElementsByClassName("checkbox")[i].checked == true){
					 
					 console.log(document.getElementsByClassName("rvCode")[i].innerText);
					 cklist = cklist + "&rvCode=" + document.getElementsByClassName("rvCode")[i].innerText;
					 uclist = uclist + "&userCode=" + document.getElementsByClassName("userCode")[i].innerText;
					 gclist = gclist + "&gameCode=" + document.getElementsByClassName("gameCode")[i].innerText;
				 }
			 }
			 console.log(cklist);
			 console.log(gclist);
			 console.log(uclist);
			 
			 var del = confirm("정말삭제하시겠습니까?");
			 if(del){
				 location.href = "${pageContext.request.contextPath}/manager/sdel?"+cklist+"&"+uclist+"&"+gclist;
			 }else{
				 location.reload();
			 }
			 
	     });
	</script>


	<!-- 추가 모달창 -->
	<script>
        document.getElementById("add").addEventListener("click", function () {
            document.getElementById("modalout").style.display="block";
            document.getElementById("modalout").style.opacity="0.1";
            var modal =  document.getElementById("modal");
            modal.style.display = "block";
           
        });
    </script>

	<!-- 전체 체크박스 -->
	<script type="text/javascript">
	document.getElementById("Cbox").addEventListener("click", function () {
		if(this.checked == true){
			for(var i=0; i< <%=sgamelist.size()%>; i++){
				document.getElementsByClassName("checkbox")[i].checked = true;
			}
		}else {
			for(var i=0; i< <%=sgamelist.size()%>; i++){
				document.getElementsByClassName("checkbox")[i].checked = false;
			}
		}
       
    });
	</script>

</body>
</html>