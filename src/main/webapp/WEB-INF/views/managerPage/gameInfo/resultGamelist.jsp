<%@page import="com.sample.vo.GlistVO"%>
<%@page import="com.sample.vo.UserVO"%>
<%@page import="com.sample.vo.GameResultVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	List<GameResultVO> result = null;
	List<UserVO>userlist = null;
	List<GlistVO> gamelist = null;
	List<Integer> teamlist = null;
	
	if(session.getAttribute("result") != null){
		result = (List<GameResultVO>)session.getAttribute("result");
	}
	if(session.getAttribute("userlist") != null){
		userlist = (List<UserVO>)session.getAttribute("userlist");
	}
	if(session.getAttribute("gamelist") !=null) {
		gamelist = (List<GlistVO>)session.getAttribute("gamelist");
	}
	if(session.getAttribute("tcodelist") != null) {
		teamlist = (List<Integer>)session.getAttribute("tcodelist");
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
        .sub_menu3 {
		    background-color: #26a653;
		    color: white;
		    border-radius: 10px 10px 0px 0px;
		}
		.sub_menu1 {
			font-weight: 100;
		}		
		.sub_menu2 {
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
            height: 300px;
            background-color: #b7e1c6;
            padding: 10px;

        }

        #modalout {
            position: absolute;
            width: 64%;
    		height: 77%;
            background-color: gray;
            display: none;
        }

        #modal * {
            /* border: 1px solid black; */
        }

        #flist {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        #flist>li {
            display: flex;
            align-items: center;
            width: 100%;
        }

        #flist>li>p {
            width: 120px;
            font-size: 20px;
            height: 30px;
        }
        .listbox{
        	list-style: none
            margin: 0;
            padding: 0;
            /* background-color: white; */
            width: 170px;
            height: 30px;
            overflow-y: scroll;
            overflow-x: hidden;
           
        }
        .inbox{
        	height: 30px;
        	width: 170px;
        }
</style>
</head>
<body>
<div id="modalout"></div>
    <div id="modal">
        <h3>경기 결과 추가</h3>
        <form action="${pageContext.request.contextPath}/manager/radd" method="post">
        <input type="hidden" name="select" value="gameAdmin">
        <input type="hidden" name="ty" value="add" id="ty">
        <input type="hidden" name="resultCode" value="-1" id="rcode">
            <ul id="flist">
                <li><p>경기번호 : </p> <input type="text" name="gameCode" id="ingameCode" class="inbox" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
                <li><p id="pgbox" style="display: none;"></p><ul id="gclist" class="listbox" style="display: none;">
                    	<%
                    		for(int i=0; i<gamelist.size(); i++) {
                    			%>
                    			<li id="gnum<%=i %>" class="gnumlist"><%out.println(gamelist.get(i).getGameCode());%></li>
                    			<li class="gamet" style="display: none;"><%out.println(gamelist.get(i).getGameType());%></li>
                    			<%
                    		}
                    	%>
                    </ul>
                    </li>
                    
                <li><p>신청자코드 : </p> <input type="text" name="userCode" id="inuserCode" class="inbox" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
                <li><p id="pcbox" style="display: none;"></p><ul id="uclist" class="listbox" style="display: none;">
                    	<%
                    	for(int i=0; i<userlist.size(); i++) {
                			%>
                			<li id="cnum<%=i %>" class="cnumlist"><%out.println(userlist.get(i).getUserCode());%></li>
                			<%
                		}
                    	%>
                    </ul>
                    </li>
                    
                <li><p>팀코드 : </p> <input type="text" name="teamCode" id="inteamCode" class="inbox" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
                <li><p id="ptbox" style="display: none;"></p><ul id="tclist" class="listbox" style="display: none;">
                    	<%
                    	for(int i=0; i<teamlist.size(); i++) {
                			%>
                			<li id="tnum<%=i %>" class="tnumlist"><%out.println(teamlist.get(i));%></li>
                			<%
                		}
                    	%>
                    </ul>
                    </li>
                <li><p>결과 : </p> <input type="text" class="inbox" name="result" id="inresult" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> </li>
                <li><p>득점 : </p> <input type="text" class="inbox" name="score" id="inscore" autocomplete='off'> </li>
                <li><p>어시스트 : </p> <input type="text" class="inbox" name="assitst" id="inassist" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> </li>
                
            </ul>
            <button id="addbtn">등록</button>
        </form>
            <button id="close">닫기</button>

    </div>


<div id="out">
		<div id="searchbox1">
			<div class="searchbox1_area">		
				<select name="" id="select" class="box_css">
				<option value="null">카테고리</option>
				<option value="gameCode">경기번호</option>
				<option value="gameType">경기타입</option>
				<option value="userCode">참가자코드</option>
				<option value="teamCode">팀코드</option>
				</select>

				<div id="btnbox">
					<button id="add" class="box_css">추가</button>
					<button id="del" class="box_css">삭제</button>
					<button id="upd" class="box_css">수정</button>
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
							<th>경기타입</th>
							<th>참가자코드</th>
							<th>참가자이름</th>
							<th>팀코드</th>
							<th>결과</th>
							<th>득점</th>
							<th>어시스트</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<%
							for(int i=0; i<result.size(); i++){
								if(i>15){
									%>
									<tr style="display: none;" class="gamelist" id="game<%=i%>" >
									<td id="rc<%=i %>" class="resultCode" style="display: none;"><%out.println(result.get(i).getResultCode());%></td>
									<td><input type="checkbox" name="" id="Cbox" class="checkbox"></td>
									<td class="gameCode"><%out.println(result.get(i).getGameCode()); %></td>
									<td class="gameType"><%out.println(result.get(i).getGameType()); %></td>
									<td class="userCode"><%out.println(result.get(i).getUserCode()); %></td>
									<td class="userName"><%
										for(int j=0; j<userlist.size();j++){
											if(userlist.get(j).getUserCode()==result.get(i).getUserCode()){
												out.println(userlist.get(j).getUserName());
											}
										}
									%></td>
									<td class="teamCode"><%out.println(result.get(i).getTeamCode()); %></td>
									<td class="result"><%out.println(result.get(i).getResult()); %></td>
									<td class="score"><%out.println(result.get(i).getScore());%></td>
									<td class="assist"><%out.println(result.get(i).getAssist()); %></td>
									</tr>
									<%
								} else{
								%>
								<tr class="gamelist" id="game<%=i%>" >
								<td id="rc<%=i %>" class="resultCode" style="display: none;"><%out.println(result.get(i).getResultCode());%></td>
								<td><input type="checkbox" name="" id="Cbox" class="checkbox"></td>
								<td class="gameCode"><%out.println(result.get(i).getGameCode()); %></td>
								<td class="gameType"><%out.println(result.get(i).getGameType()); %></td>
								<td class="userCode"><%out.println(result.get(i).getUserCode()); %></td>
								<td class="userName"><%
									for(int j=0; j<userlist.size();j++){
										if(userlist.get(j).getUserCode()==result.get(i).getUserCode()){
											out.println(userlist.get(j).getUserName());
										}
									}
								%></td>
								<td class="teamCode"><%out.println(result.get(i).getTeamCode()); %></td>
								<td class="result"><%out.println(result.get(i).getResult()); %></td>
								<td class="score"><%out.println(result.get(i).getScore());%></td>
								<td class="assist"><%out.println(result.get(i).getAssist()); %></td>
								</tr>
								<%
								}
							}
						%>
					</tbody>
				</table>
			</div>
			<div id="nev"class="nev">
			<a id="pre" class="page_btn"> ◀ </a>
			<%
			if(result.size()%15 == 0 ) {
				for(int i=1; i<=result.size()/15;i++){
					if(i>15) {
						%>
						<a class="listnum" id="num<%=i%>" style="display: none;"class="page_btn"> <% out.print(i); %></a>
						<%
					}else{
						%>
						<a class="listnum" id="num<%=i%>"class="page_btn"> <% out.print(i); %> </a>
						<%
					}
				}
			}else if(result.size()%15 > 0 ){
				for(int i=1; i<=result.size()/15 + 1;i++){
					if(i>15) {
						%>
						<a class="listnum" id="num<%=i%>" style="display: none;" class="page_btn"> <% out.print(i); %></a>
						<%
					}else{
						%>
						<a class="listnum" id="num<%=i%>" class="page_btn"> <% out.print(i); %> </a>
						<%
					}
				}
				
			}else{
			%>
				<a> 1 </a>
			<%
			}
				
			%>
			<a id="next" class="page_btn"> ▶ </a>
			</div>
			
			
			<div id="snev" style="display: none;" class="nev">
			<a id="spre" class="page_btn"> ◀ </a>
			<%
			if(result.size()%15 == 0 ) {
				for(int i=1; i<=result.size()/15;i++){
					if(i>15) {
						%>
						<a id="num<%=i%>" style="display: none;" class="page_btn"> <% out.print(i); %></a>
						<%
					}else{
						%>
						<a id="num<%=i%>" class="page_btn"> <% out.print(i); %> </a>
						<%
					}
				}
			}else if(result.size()%15 > 0 ){
				for(int i=1; i<=result.size()/15 + 1;i++){
					if(i>15) {
						%>
						<a id="num<%=i%>" style="display: none;" class="page_btn"> <% out.print(i); %></a>
						<%
					}else{
						%>
						<a id="num<%=i%>" class="page_btn"> <% out.print(i); %> </a>
						<%
					}
				}
				
			}else{
			%>
				<a> 1 </a>
			<%
			}
				
			%>
			<a id="snext" class="page_btn"> ▶ </a>
			</div>
			
		</div>		
	</div>
	
	<!-- 이전/다음 -->
	<script type="text/javascript">	
	let listselect = 0;
	let end = 0;
	if(<%=result.size()%15==0%>){
		end = <%=result.size()/15%>;
	}else{
		end = <%=result.size()/15%> + 1;
	}
	/* 이전 버튼 */
	document.getElementById("pre").addEventListener("click",function(){
		if(listselect - 15 >=0){
			listselect = listselect - 15;
		}else{
			listselect = 0;
		}
		
		for(let i=0; i< document.getElementsByClassName("listnum").length; i++) {
			document.getElementsByClassName("listnum")[i].style.display = "none";
		}
		if(listselect+15 > document.getElementsByClassName("listnum").length){
			for(let i= listselect; i<document.getElementsByClassName("listnum").length; i++){
				document.getElementsByClassName("listnum")[i].style.display = "";
			}
		}else{
			for(let i= listselect; i<listselect+15; i++){
				document.getElementsByClassName("listnum")[i].style.display = "";
			}
		}
		
		
	});
	
	/* 다음 버튼 */
	document.getElementById("next").addEventListener("click",function(){
		if(listselect == 0){
			listselect = 0;
		}else if(listselect + 15 >=(end-15)){
			listselect = end-15;
		}else{
			listselect = listselect + 15;
		}
		
		
		
		for(let i=0; i< document.getElementsByClassName("listnum").length; i++) {
			document.getElementsByClassName("listnum")[i].style.display = "none";
		}
		
		if(listselect == 0){
			if(listselect + 15 > end){
				for(let i= 0; i<document.getElementsByClassName("listnum").length; i++){
					document.getElementsByClassName("listnum")[i].style.display = "";
				}
			}else{
				for(let i= 0; i<15; i++){
					document.getElementsByClassName("listnum")[i].style.display = "";
				}
			}
			
		}else if(listselect+15 > end){
			for(let i= listselect; i<document.getElementsByClassName("listnum").length; i++){
				document.getElementsByClassName("listnum")[i].style.display = "";
			}
		}else{
			for(let i= listselect; i<listselect+15; i++){
				document.getElementsByClassName("listnum")[i].style.display = "";
			}
		}
		
		
	});
	
	</script>
	
	<!-- 페이징 버튼 -->
	<script type="text/javascript">
	for(let i=0; i< document.getElementsByClassName("listnum").length; i++) {
		document.getElementsByClassName("listnum")[i].addEventListener("click",function(){
			if (document.getElementsByClassName("listnum").length <15){
				listselect = 0;
		        for(let j= listselect; j<document.getElementsByClassName("listnum").length; j++){
					document.getElementsByClassName("listnum")[j].style.display = "";
				}
			}else if (this.innerText > (end-8) && (end-8)>0){
				listselect = end-15;
		        for(let j=0; j< document.getElementsByClassName("listnum").length; j++){
		        	document.getElementsByClassName("listnum")[j].style.display = "none";
		        }
		        for(let j= listselect; j<listselect+15; j++){
					document.getElementsByClassName("listnum")[j].style.display = "";
				}
		        
			}else if(this.innerText >=8){
				listselect = this.innerText - 8;
		        for(let j=0; j< document.getElementsByClassName("listnum").length; j++){
		        	document.getElementsByClassName("listnum")[j].style.display = "none";
		        }
		        for(let j= listselect; j<listselect+15; j++){
					document.getElementsByClassName("listnum")[j].style.display = "";
				}
		        
			}else if (this.innerText <8){
				listselect = 0;
		        for(let j=0; j< document.getElementsByClassName("listnum").length; j++){
		        	document.getElementsByClassName("listnum")[j].style.display = "none";
		        }
		        for(let j= listselect; j<listselect+15; j++){
					document.getElementsByClassName("listnum")[j].style.display = "";
				}
			}
			
			
			/* 리스트 변경 */
			let sele = this.innerText;
			let num = (sele-1)*15;
			
			for(let i=0; i<document.getElementsByClassName("gamelist").length; i++){
				document.getElementsByClassName("gamelist")[i].style.display = "none";
			}
			
			if(num+15 > document.getElementsByClassName("gamelist").length){
				for(let i=num; i<document.getElementsByClassName("gamelist").length; i++){
					document.getElementsByClassName("gamelist")[i].style.display = "";
				}
			}else{
				for(let i=num; i<num+15; i++){
					document.getElementsByClassName("gamelist")[i].style.display = "";
				}
			}
			
			
	    })
	}
	</script>

	<!-- 삭제 버튼 -->
	<script type="text/javascript">
	 document.getElementById("del").addEventListener("click", function () {
		 var rclist = "resultCode=-1";
		 let ttcnt=0;
		 for(let i=0; i<<%=result.size()%>; i++){
			 if(document.getElementsByClassName("checkbox")[i].checked == true){
				 rclist = rclist + "&resultCode=" + document.getElementsByClassName("resultCode")[i].innerText;
				 ttcnt++;
		 	}
		 }
		 
		if(ttcnt >0){
			 var del = confirm("삭제 후 상황에 맞게 신청내역도 수정이 필요할 수 있습니다.\n정말 삭제하시겠습니까?");
			 if(del){
				 location.href = "${pageContext.request.contextPath}/manager/rdel?"+rclist;
			 }else{
				 location.reload();
			 } 
		 
		}else{
			 alert("삭제할 결과를 선택 해 주세요");
		}
	 })
	 
	</script>

	<!-- 추가 모달창 -->
	<script>
        document.getElementById("add").addEventListener("click", function () {
        	alert("소셜매치 결과 추가 시 신청자 코드만 입력,\n 팀매치 결과 추가 시 팀코드만 입력");
            document.getElementById("modalout").style.display="block";
            document.getElementById("modalout").style.opacity="0.1";
            var modal =  document.getElementById("modal");
            modal.style.display = "block";
            document.getElementById("ty").value = "add";
           
        });
    </script>
    
    <!-- 수정 모달창 -->
	<script>
        document.getElementById("upd").addEventListener("click", function () {
        	let upcnt = 0;
            
            for(let i=0; i<document.getElementsByClassName("gameCode").length; i++){
            	if(document.getElementsByClassName("checkbox")[i].checked == true){
            		upcnt++;
            	}
            	
            }
            if(upcnt < 1){
            	alert("수정할 경기를 선택해 주세요");
            }else{
            	for(let i=0; i<document.getElementsByClassName("gameCode").length; i++){
                	if(document.getElementsByClassName("checkbox")[i].checked == true){
                		 document.getElementById("ingameCode").value = document.getElementsByClassName("gameCode")[i].innerText;
                		 document.getElementById("inuserCode").value = document.getElementsByClassName("userCode")[i].innerText;
                		 document.getElementById("inteamCode").value = document.getElementsByClassName("teamCode")[i].innerText;
                		 document.getElementById("inresult").value = document.getElementsByClassName("result")[i].innerText;
                		 document.getElementById("inscore").value = document.getElementsByClassName("score")[i].innerText;
                		 document.getElementById("inassist").value = document.getElementsByClassName("assist")[i].innerText;
                		 document.getElementById("rcode").value = document.getElementsByClassName("resultCode")[i].innerText;
                		 document.getElementById("ty").value = "update";
                		 if(document.getElementById("inteamCode").value > 0){
                			 document.getElementById("inuserCode").readOnly = "true";
                			
                		 }else if(document.getElementById("inuserCode").value > 0){
                			 document.getElementById("inteamCode").readOnly = "true";
                			 document.getElementById("inteamCode").value = "0";
                		 }
                		 
                	}
                }
            	document.getElementById("modalout").style.display="block";
                document.getElementById("modalout").style.opacity="0.1";
                var modal =  document.getElementById("modal");
                modal.style.display = "block";
            }
           
        });
    </script>
    
    <!-- 추가 모달 닫기 -->
    <script type="text/javascript">
    document.getElementById("close").addEventListener("click", function () {
    	for(let i=0; i<document.getElementsByClassName("gameCode").length; i++){
         	document.getElementsByClassName("checkbox")[i].checked = false;
		 }
    	
    	 document.getElementById("ingameCode").value = "";
		 document.getElementById("inuserCode").value = "";
		 document.getElementById("inteamCode").value = "";
		 document.getElementById("inresult").value = "";
		 document.getElementById("inscore").value = "";
		 document.getElementById("inassist").value = "";
		 
        document.getElementById("modalout").style.display = "none";
        var modal =  document.getElementById("modal");
        modal.style.display = "none";
    });
    </script>
    
    <!-- 경기 코드 숫자 검색 -->
	<script type="text/javascript">
	 var ing = document.getElementById("ingameCode");
	 ing.addEventListener("keyup", function (event) {
		 
		 for(let i=0; i< <%=gamelist.size()%>; i++){document.getElementById("gnum"+i).style.display = "none"}
		
		
		 for(let i=0; i< <%=gamelist.size()%>; i++){
			 let intext = document.getElementById("ingameCode").value.trim();
			 let ortext = document.getElementsByClassName("gnumlist")[i].innerText.trim();
			 if(intext.length >= 3 ){
				 if(ortext.indexOf(intext) != -1){
					 console.log("dmdkr");
					 document.getElementById("pgbox").style.display = "block";
					 document.getElementById("gclist").style.display = "block";
					 document.getElementsByClassName("gnumlist")[i].style.display = "";
					 document.getElementById("gnum"+i).style.display = "block";
					 document.getElementById("gnum"+i).style.backgroundColor = "#fff";
				 }
			 }else{
				 document.getElementById("pgbox").style.display = "none";
				 document.getElementById("gclist").style.display = "none";
			 }
		 }
       });
	</script>
    
    <!-- 유저 코드 숫자 검색 -->
	<script type="text/javascript">
	 var ing = document.getElementById("inuserCode");
	 ing.addEventListener("keyup", function (event) {
		 
		 for(let i=0; i< <%=userlist.size()%>; i++){document.getElementById("cnum"+i).style.display = "none"}
		
		
		 for(let i=0; i< <%=userlist.size()%>; i++){
			 let intext = document.getElementById("inuserCode").value.trim();
			 let ortext = document.getElementsByClassName("cnumlist")[i].innerText.trim();
			 if(intext.length >= 2 ){
				 if(ortext.indexOf(intext) != -1){
					 document.getElementById("pcbox").style.display = "block";
					 document.getElementById("uclist").style.display = "block";
					 document.getElementsByClassName("cnumlist")[i].style.display = "";
					 document.getElementById("cnum"+i).style.display = "block";
					 document.getElementById("cnum"+i).style.backgroundColor = "#fff";
					 document.getElementById("inteamCode").readOnly = "true";
					 document.getElementById("inteamCode").value = "0";
				 }
			 }else{
				 document.getElementById("pcbox").style.display = "none";
				 document.getElementById("uclist").style.display = "none";
				 document.getElementById("inteamCode").readOnly = false;
			 }
		 }
		
       });
	</script>
	
	<!-- 팀 코드 숫자 검색 -->
	<script type="text/javascript">
	 var ing = document.getElementById("inteamCode");
	 ing.addEventListener("keyup", function (event) {
		 
		 for(let i=0; i< <%=teamlist.size()%>; i++){document.getElementById("tnum"+i).style.display = "none"}
		
		
		 for(let i=0; i< <%=teamlist.size()%>; i++){
			 let intext = document.getElementById("inteamCode").value.trim();
			 let ortext = document.getElementsByClassName("tnumlist")[i].innerText.trim();
			 if(intext.length >= 1 ){
				 if(ortext.indexOf(intext) != -1){
					 document.getElementById("ptbox").style.display = "block";
					 document.getElementById("tclist").style.display = "block";
					 document.getElementsByClassName("tnumlist")[i].style.display = "";
					 document.getElementById("tnum"+i).style.display = "block";
					 document.getElementById("tnum"+i).style.backgroundColor = "#fff";
					 document.getElementById("inuserCode").readOnly = "true";
					 document.getElementById("inuserCode").value = "0";
				 }
			 }else{
				 document.getElementById("ptbox").style.display = "none";
				 document.getElementById("tclist").style.display = "none";
				 document.getElementById("inuserCode").readOnly = false;
			 }
		 }
		
       });
	</script>
	
	<!-- 추가 모달 등록 버튼 -->
	<script type="text/javascript">
	document.getElementById("addbtn").addEventListener("click",function(){
		console.log("등록");
		console.log(document.getElementById("inteamCode").value.trim());
		let cnt = 0;
		
		for(let i=0; i<document.querySelectorAll("#flist li input").length; i++){
			if(document.querySelectorAll("#flist li input")[i].value == ""){
				alert("값을 입력해 주세요");
				document.querySelectorAll("#flist li input")[i].focus();
				cnt++;
				break;
			}
		}
		
		
		if(document.getElementById("inteamCode").value.trim().length >=1 && document.getElementById("inteamCode").value>1){
			for(let i=0; i <<%=gamelist.size()%>; i++){
				if(document.getElementsByClassName("gnumlist")[i].innerText.trim()==document.getElementById("ingameCode").value.trim()){
					console.log("durl");
					if(document.getElementsByClassName("gamet")[i].innerText.trim() != 'T'){
						alert("해당 경기는 소셜매치입니다");
						cnt++;
					}
				}
			}
		}
		
		if(document.getElementById("inuserCode").value.trim().length >=4 && document.getElementById("inteamCode").value == 0){
			for(let i=0; i <<%=gamelist.size()%>; i++){
				if(document.getElementsByClassName("gnumlist")[i].innerText.trim()==document.getElementById("ingameCode").value.trim()){
					console.log("durl");
					if(document.getElementsByClassName("gamet")[i].innerText.trim() != 'S'){
						alert("해당 경기는 팀매치입니다");
						cnt++;
					}
				}
			}
		}
		
		if(cnt == 0){
			this.type="submit";
		}else{
			this.type="button";
		}
    })
	
	</script>

	<!-- 검색 -->
	<script type="text/javascript">
	document.getElementById("sbtn").addEventListener("click",function(){
		let listselect = 0;
		let end = 0;
		if(<%=result.size()%15==0%>){
			end = <%=result.size()/15%>;
		}else{
			end = <%=result.size()/15%> + 1;
		}
		
		/* 경기번호 검색 */
		if(document.getElementById("select").value == "gameCode"){
			document.getElementById("nev").style.display = "none";
			document.getElementById("snev").style.display = "";
			let cnt = 0;
			for(let i=0; i<(<%=result.size()%>); i++){
				document.getElementById("tbody").children[i].className = "gamelist";
				var text = document.getElementsByClassName("gameCode")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tbody").children[i].style.display = "";
					document.getElementById("tbody").children[i].className = "gamelist crgamelist";
					cnt++;
					if(cnt>15){
						document.getElementById("tbody").children[i].style.display = "none";
					}
				}else{
					document.getElementById("tbody").children[i].style.display = "none";
				}
			}
						
			let num = Math.floor((cnt / 15))+1;
			for(let i=1; i<end+1; i++){
				document.getElementById("snev").children[i].className = "listnum";
				document.getElementById("snev").children[i].style.display = "none";
			}
			
			for(let i=1; i<num+1; i++){
				document.getElementById("snev").children[i].className = "listnum crlistnum";
				document.getElementById("snev").children[i].style.display = "";
				if(i>15){
					document.getElementById("snev").children[i].style.display = "none";
				}
				document.getElementById("snev").children[i].className = "crlistnum";
			}
			
			
			/* 페이징 */
			var senum = 0;
	        var seend = num;
			for(let i=0; i<num;i++){
				document.getElementsByClassName("crlistnum")[i].addEventListener("click",function(){
		            if(this.innerText < 8) {
		            	senum = 0;
		            }else if(this.innerText > num-8){
		            	if(num >15){
		            		senum = num - 15;
		            	}else{
		            		senum = 0;
		            	}
		            	
		            }else {
		            	senum = this.innerText - 8;
		            }
		            
		            if(senum+15 > num){
		            	for(let i=1; i<num+1; i++){
		            		document.getElementById("snev").children[i].style.display = "none";
		            	}
		            	for(let i=senum+1; i<num+1; i++){
		            		document.getElementById("snev").children[i].style.display = "";
		            		
		            	}
		            }else{
		            	for(let i=1; i<num+1; i++){
		            		document.getElementById("snev").children[i].style.display = "none";
		            	}
		            	for(let i = senum+1; i<senum+16; i++){
		            		document.getElementById("snev").children[i].style.display = "";
		            	}
		            }
		            
		            
		            /* 리스트변경 */
			        var snum = (this.innerText-1)*15;
			        for(let i=0; i<cnt; i++){
			        	document.getElementsByClassName("crgamelist")[i].style.display = "none";		        	
			        }
			        if(snum + 15 >cnt){
			        	if(cnt-15 >= 0){
			        		for(let i = cnt -15; i<cnt; i++){
				        		document.getElementsByClassName("crgamelist")[i].style.display = "";
				        	}
			        	}else{
			        		for(let i = 0; i<cnt; i++){
				        		document.getElementsByClassName("crgamelist")[i].style.display = "";
				        	}
			        	}
			        	
			        }else{
			        	for(let i = snum; i<snum+15; i++){
			        		document.getElementsByClassName("crgamelist")[i].style.display = "";
			        	}
			        }
		        });
			}
			
			/* 다음 */
			document.getElementById("snext").addEventListener("click",function(){
	            if(senum+15 >= num){
	            	if(num-15 <0){
	            		senum = 0;
	            	}else{
	            		senum = num-15;
	            	}
	            	
	            }else {
	            	senum = senum+15;
	            }
	            
	            for(let i=1; i<num+1; i++){
            		document.getElementById("snev").children[i].style.display = "none";
            	}
	            if((senum+15) >= num){
	            	for(let i=senum+1; i<num+1; i++){
	            		document.getElementById("snev").children[i].style.display = "";
	            	}
	            }else if(senum+15 < num ){
	            	for(let i=senum+1; i<senum+16; i++){
	            		document.getElementById("snev").children[i].style.display = "";
	            	}
	            }
            	
	            
	        });
			/* 이전 */
			document.getElementById("spre").addEventListener("click",function(){
				
	            if(senum-15 < 0){
	            	senum = 0;
	            }else {
	            	senum = senum-15;
	            }
	            for(let i=1; i<num+1; i++){
            		document.getElementById("snev").children[i].style.display = "none";
            	}
	            
	            if(senum+16 > num){
	            	for(let i=senum+1; i<num+1; i++){
	            		document.getElementById("snev").children[i].style.display = "";
	            	}
	            }else{
	            	for(let i=senum+1; i<senum+16; i++){
	            		document.getElementById("snev").children[i].style.display = "";
	            	}
	            }
	            
	        });
			
		}
		
		
		
		
		
		/* 경기타입 검색 */
		if(document.getElementById("select").value == "gameType"){
			document.getElementById("nev").style.display = "none";
			document.getElementById("snev").style.display = "";
			let cnt = 0;
			for(let i=0; i<(<%=result.size()%>); i++){
				document.getElementById("tbody").children[i].className = "gamelist";
				var text = document.getElementsByClassName("gameCode")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tbody").children[i].style.display = "";
					document.getElementById("tbody").children[i].className = "gamelist tygamelist";
					cnt++;
					if(cnt>15){
						document.getElementById("tbody").children[i].style.display = "none";
					}
				}else{
					document.getElementById("tbody").children[i].style.display = "none";
				}
			}
						
			let num = Math.floor((cnt / 15))+1;
			for(let i=1; i<end+1; i++){
				document.getElementById("snev").children[i].className = "listnum";
				document.getElementById("snev").children[i].style.display = "none";
			}
			
			for(let i=1; i<num+1; i++){
				document.getElementById("snev").children[i].className = "listnum tylistnum";
				document.getElementById("snev").children[i].style.display = "";
				if(i>15){
					document.getElementById("snev").children[i].style.display = "none";
				}
				document.getElementById("snev").children[i].className = "tylistnum";
			}
			
			
			/* 페이징 */
			var senum = 0;
	        var seend = num;
			for(let i=0; i<num;i++){
				document.getElementsByClassName("tylistnum")[i].addEventListener("click",function(){
		            if(this.innerText < 8) {
		            	senum = 0;
		            }else if(this.innerText > num-8){
		            	if(num >15){
		            		senum = num - 15;
		            	}else{
		            		senum = 0;
		            	}
		            	
		            }else {
		            	senum = this.innerText - 8;
		            }
		            
		            if(senum+15 > num){
		            	for(let i=1; i<num+1; i++){
		            		document.getElementById("snev").children[i].style.display = "none";
		            	}
		            	for(let i=senum+1; i<num+1; i++){
		            		document.getElementById("snev").children[i].style.display = "";
		            		
		            	}
		            }else{
		            	for(let i=1; i<num+1; i++){
		            		document.getElementById("snev").children[i].style.display = "none";
		            	}
		            	for(let i = senum+1; i<senum+16; i++){
		            		document.getElementById("snev").children[i].style.display = "";
		            	}
		            }
		            
		            
		            /* 리스트변경 */
			        var snum = (this.innerText-1)*15;
			        for(let i=0; i<cnt; i++){
			        	document.getElementsByClassName("tygamelist")[i].style.display = "none";		        	
			        }
			        if(snum + 15 >cnt){
			        	if(cnt-15 >= 0){
			        		for(let i = cnt -15; i<cnt; i++){
				        		document.getElementsByClassName("tygamelist")[i].style.display = "";
				        	}
			        	}else{
			        		for(let i = 0; i<cnt; i++){
				        		document.getElementsByClassName("tygamelist")[i].style.display = "";
				        	}
			        	}
			        	
			        }else{
			        	for(let i = snum; i<snum+15; i++){
			        		document.getElementsByClassName("tygamelist")[i].style.display = "";
			        	}
			        }
		        });
			}
			
			/* 다음 */
			document.getElementById("snext").addEventListener("click",function(){
	            if(senum+15 >= num){
	            	if(num-15 <0){
	            		senum = 0;
	            	}else{
	            		senum = num-15;
	            	}
	            	
	            }else {
	            	senum = senum+15;
	            }
	            
	            for(let i=1; i<num+1; i++){
            		document.getElementById("snev").children[i].style.display = "none";
            	}
	            if((senum+15) >= num){
	            	for(let i=senum+1; i<num+1; i++){
	            		document.getElementById("snev").children[i].style.display = "";
	            	}
	            }else if(senum+15 < num ){
	            	for(let i=senum+1; i<senum+16; i++){
	            		document.getElementById("snev").children[i].style.display = "";
	            	}
	            }
            	
	            
	        });
			/* 이전 */
			document.getElementById("spre").addEventListener("click",function(){
				
	            if(senum-15 < 0){
	            	senum = 0;
	            }else {
	            	senum = senum-15;
	            }
	            for(let i=1; i<num+1; i++){
            		document.getElementById("snev").children[i].style.display = "none";
            	}
	            
	            if(senum+16 > num){
	            	for(let i=senum+1; i<num+1; i++){
	            		document.getElementById("snev").children[i].style.display = "";
	            	}
	            }else{
	            	for(let i=senum+1; i<senum+16; i++){
	            		document.getElementById("snev").children[i].style.display = "";
	            	}
	            }
	            
	        });
			
		}
		
		
		/* 참여자코드검색 */
		if(document.getElementById("select").value == "userCode"){
			document.getElementById("nev").style.display = "none";
			document.getElementById("snev").style.display = "";
			let cnt = 0;
			for(let i=0; i<(<%=result.size()%>); i++){
				document.getElementById("tbody").children[i].className = "gamelist";
				var text = document.getElementsByClassName("gameCode")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tbody").children[i].style.display = "";
					document.getElementById("tbody").children[i].className = "gamelist ucgamelist";
					cnt++;
					if(cnt>15){
						document.getElementById("tbody").children[i].style.display = "none";
					}
				}else{
					document.getElementById("tbody").children[i].style.display = "none";
				}
			}
						
			let num = Math.floor((cnt / 15))+1;
			for(let i=1; i<end+1; i++){
				document.getElementById("snev").children[i].className = "listnum";
				document.getElementById("snev").children[i].style.display = "none";
			}
			
			for(let i=1; i<num+1; i++){
				document.getElementById("snev").children[i].className = "uclistnum";
				document.getElementById("snev").children[i].style.display = "";
				if(i>15){
					document.getElementById("snev").children[i].style.display = "none";
				}
				
			}
			
			
			/* 페이징 */
			var senum = 0;
	        var seend = num;
			for(let i=0; i<num;i++){
				document.getElementsByClassName("uclistnum")[i].addEventListener("click",function(){
		            if(this.innerText < 8) {
		            	senum = 0;
		            }else if(this.innerText > num-8){
		            	if(num >15){
		            		senum = num - 15;
		            	}else{
		            		senum = 0;
		            	}
		            	
		            }else {
		            	senum = this.innerText - 8;
		            }
		            
		            if(senum+15 > num){
		            	for(let i=1; i<num+1; i++){
		            		document.getElementById("snev").children[i].style.display = "none";
		            	}
		            	for(let i=senum+1; i<num+1; i++){
		            		document.getElementById("snev").children[i].style.display = "";
		            		
		            	}
		            }else{
		            	for(let i=1; i<num+1; i++){
		            		document.getElementById("snev").children[i].style.display = "none";
		            	}
		            	for(let i = senum+1; i<senum+16; i++){
		            		document.getElementById("snev").children[i].style.display = "";
		            	}
		            }
		            
		            
		            /* 리스트변경 */
			        var snum = (this.innerText-1)*15;
			        for(let i=0; i<cnt; i++){
			        	document.getElementsByClassName("ucgamelist")[i].style.display = "none";		        	
			        }
			        if(snum + 15 >cnt){
			        	if(cnt-15 >= 0){
			        		for(let i = cnt -15; i<cnt; i++){
				        		document.getElementsByClassName("ucgamelist")[i].style.display = "";
				        	}
			        	}else{
			        		for(let i = 0; i<cnt; i++){
				        		document.getElementsByClassName("ucgamelist")[i].style.display = "";
				        	}
			        	}
			        	
			        }else{
			        	for(let i = snum; i<snum+15; i++){
			        		document.getElementsByClassName("ucgamelist")[i].style.display = "";
			        	}
			        }
		        });
			}
			
			/* 다음 */
			document.getElementById("snext").addEventListener("click",function(){
	            if(senum+15 >= num){
	            	if(num-15 <0){
	            		senum = 0;
	            	}else{
	            		senum = num-15;
	            	}
	            	
	            }else {
	            	senum = senum+15;
	            }
	            
	            for(let i=1; i<num+1; i++){
            		document.getElementById("snev").children[i].style.display = "none";
            	}
	            if((senum+15) >= num){
	            	for(let i=senum+1; i<num+1; i++){
	            		document.getElementById("snev").children[i].style.display = "";
	            	}
	            }else if(senum+15 < num ){
	            	for(let i=senum+1; i<senum+16; i++){
	            		document.getElementById("snev").children[i].style.display = "";
	            	}
	            }
            	
	            
	        });
			/* 이전 */
			document.getElementById("spre").addEventListener("click",function(){
				
	            if(senum-15 < 0){
	            	senum = 0;
	            }else {
	            	senum = senum-15;
	            }
	            for(let i=1; i<num+1; i++){
            		document.getElementById("snev").children[i].style.display = "none";
            	}
	            
	            if(senum+16 > num){
	            	for(let i=senum+1; i<num+1; i++){
	            		document.getElementById("snev").children[i].style.display = "";
	            	}
	            }else{
	            	for(let i=senum+1; i<senum+16; i++){
	            		document.getElementById("snev").children[i].style.display = "";
	            	}
	            }
	            
	        });
			
		}
		
		
		/* 팀코드 검색 */
		if(document.getElementById("select").value == "teamCode"){
			document.getElementById("nev").style.display = "none";
			document.getElementById("snev").style.display = "";
			let cnt = 0;
			for(let i=0; i<(<%=result.size()%>); i++){
				document.getElementById("tbody").children[i].className = "gamelist";
				var text = document.getElementsByClassName("gameCode")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tbody").children[i].style.display = "";
					document.getElementById("tbody").children[i].className = "gamelist tcgamelist";
					cnt++;
					if(cnt>15){
						document.getElementById("tbody").children[i].style.display = "none";
					}
				}else{
					document.getElementById("tbody").children[i].style.display = "none";
				}
			}
						
			let num = Math.floor((cnt / 15))+1;
			for(let i=1; i<end+1; i++){
				document.getElementById("snev").children[i].className = "listnum";
				document.getElementById("snev").children[i].style.display = "none";
			}
			
			for(let i=1; i<num+1; i++){
				document.getElementById("snev").children[i].className = "tclistnum";
				document.getElementById("snev").children[i].style.display = "";
				if(i>15){
					document.getElementById("snev").children[i].style.display = "none";
				}
			}
			
			
			/* 페이징 */
			var senum = 0;
	        var seend = num;
			for(let i=0; i<num;i++){
				document.getElementsByClassName("tclistnum")[i].addEventListener("click",function(){
		            if(this.innerText < 8) {
		            	senum = 0;
		            }else if(this.innerText > num-8){
		            	if(num >15){
		            		senum = num - 15;
		            	}else{
		            		senum = 0;
		            	}
		            	
		            }else {
		            	senum = this.innerText - 8;
		            }
		            
		            if(senum+15 > num){
		            	for(let i=1; i<num+1; i++){
		            		document.getElementById("snev").children[i].style.display = "none";
		            	}
		            	for(let i=senum+1; i<num+1; i++){
		            		document.getElementById("snev").children[i].style.display = "";
		            		
		            	}
		            }else{
		            	for(let i=1; i<num+1; i++){
		            		document.getElementById("snev").children[i].style.display = "none";
		            	}
		            	for(let i = senum+1; i<senum+16; i++){
		            		document.getElementById("snev").children[i].style.display = "";
		            	}
		            }
		            
		            
		            /* 리스트변경 */
			        var snum = (this.innerText-1)*15;
			        for(let i=0; i<cnt; i++){
			        	document.getElementsByClassName("tcgamelist")[i].style.display = "none";		        	
			        }
			        if(snum + 15 >cnt){
			        	if(cnt-15 >= 0){
			        		for(let i = cnt -15; i<cnt; i++){
				        		document.getElementsByClassName("tcgamelist")[i].style.display = "";
				        	}
			        	}else{
			        		for(let i = 0; i<cnt; i++){
				        		document.getElementsByClassName("tcgamelist")[i].style.display = "";
				        	}
			        	}
			        	
			        }else{
			        	for(let i = snum; i<snum+15; i++){
			        		document.getElementsByClassName("tcgamelist")[i].style.display = "";
			        	}
			        }
		        });
			}
			
			/* 다음 */
			document.getElementById("snext").addEventListener("click",function(){
	            if(senum+15 >= num){
	            	if(num-15 <0){
	            		senum = 0;
	            	}else{
	            		senum = num-15;
	            	}
	            	
	            }else {
	            	senum = senum+15;
	            }
	            
	            for(let i=1; i<num+1; i++){
            		document.getElementById("snev").children[i].style.display = "none";
            	}
	            if((senum+15) >= num){
	            	for(let i=senum+1; i<num+1; i++){
	            		document.getElementById("snev").children[i].style.display = "";
	            	}
	            }else if(senum+15 < num ){
	            	for(let i=senum+1; i<senum+16; i++){
	            		document.getElementById("snev").children[i].style.display = "";
	            	}
	            }
            	
	            
	        });
			/* 이전 */
			document.getElementById("spre").addEventListener("click",function(){
				
	            if(senum-15 < 0){
	            	senum = 0;
	            }else {
	            	senum = senum-15;
	            }
	            for(let i=1; i<num+1; i++){
            		document.getElementById("snev").children[i].style.display = "none";
            	}
	            
	            if(senum+16 > num){
	            	for(let i=senum+1; i<num+1; i++){
	            		document.getElementById("snev").children[i].style.display = "";
	            	}
	            }else{
	            	for(let i=senum+1; i<senum+16; i++){
	            		document.getElementById("snev").children[i].style.display = "";
	            	}
	            }
	            
	        });
			
		}
		
    });	
	</script>
	
	<!-- 엔터키 검색 -->
	<script type="text/javascript">
	 var input = document.getElementById("inputbox");
	 input.addEventListener("keyup", function (event) {
         if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("sbtn").click();
         }
       });
	</script>
	
	<!-- 전체 체크박스 -->
	<script type="text/javascript">
	document.getElementById("Cbox").addEventListener("click", function () {
		if(this.checked == true){
			for(var i=0; i< <%=result.size()%>; i++){
				document.getElementsByClassName("checkbox")[i].checked = true;
			}
		}else {
			for(var i=0; i< <%=result.size()%>; i++){
				document.getElementsByClassName("checkbox")[i].checked = false;
			}
		}
       
    });
	</script>
</body>
</html>