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
<title>Insert title here</title>
<style>
	.menu3 {
		background-color: #f8ede3;
	}
	#searchbox {
		display: flex;
		height: 80px;
		align-items: center;
		justify-content: space-between;
		padding: 0 30px;

	}
	
	#upside{
		display: flex;
		justify-content: space-between;
    	padding: 0 15px;
    	
	}
	
	 #select{
        	width: 10%;
    		height: 30px;
    		border: 2px solid #26a563;
   			border-radius: 10px;
        }
        #saerch{
        	width: 50%;
    		height: 30px;
        }
        #inputbox{
        	width : 85%;
        	height : 30px;
        }
        #sbtn{
        	width: 13%;
		    height: 30px;
		    border: 2px solid #BDD2B6;
		    border-radius: 10px;
		    background-color: #BDD2B6;
		    color: white;
		    font-weight: 700;
        }
        #sbtn:hover {
        	cursor : pointer;
        	background-color : red;
        }
        #add{
        	border: 1px solid #BDD2B6;;
    		background: #BDD2B6;
    		color: white;
    		border-radius: 5px;
        }
        #del{
        	border: 1px solid #BDD2B6;
    		background: #BDD2B6;
    		color: white;
    		border-radius: 5px;
        }
       #upd{
        	border: 1px solid #BDD2B6;
    		background: #BDD2B6;
    		color: white;
    		border-radius: 5px;
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
		    border-bottom: 2px solid #D2D79F;
		    background-color: #F8EDE3;
		}
       		
       }
       #list table tr th:first-child{
       		width : 50px;
       }
       #list table tr td{
       		height: 40px;
		    text-align: center;
		    border-bottom: 2px dotted #D2D79F;
       }
       #Cbox{
       		width : 18px;
       		height : 18px;
       }
       .checkbox{
       		width : 18px;
       		height : 18px;
       }
       .nev{
           display: flex;
    		justify-content: center;
    	}
	
	
    	
    /* ?????? */
	
	
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
        <h3>?????? ?????? ??????</h3>
        <form action="${pageContext.request.contextPath}/game/radd" method="post">
        <input type="hidden" name="select" value="gameAdmin">
        <input type="hidden" name="ty" value="add" id="ty">
        <input type="hidden" name="resultCode" value="-1" id="rcode">
            <ul id="flist">
                <li><p>???????????? : </p> <input type="text" name="gameCode" id="ingameCode" class="inbox" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
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
                    
                <li><p>??????????????? : </p> <input type="text" name="userCode" id="inuserCode" class="inbox" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
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
                    
                <li><p>????????? : </p> <input type="text" name="teamCode" id="inteamCode" class="inbox" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
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
                <li><p>?????? : </p> <input type="text" class="inbox" name="result" id="inresult" autocomplete='off'> </li>
                <li><p>?????? : </p> <input type="text" class="inbox" name="score" id="inscore" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> </li>
                <li><p>???????????? : </p> <input type="text" class="inbox" name="assitst" id="inassist" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> </li>
                
            </ul>
            <button id="addbtn">??????</button>
        </form>
            <button id="close">??????</button>

    </div>


<div id="out">
		<div id="searchbox">
			<select name="" id="select">
				<option value="null">????????????</option>
				<option value="gameCode">????????????</option>
				<option value="gameType">????????????</option>
				<option value="userCode">???????????????</option>
				<option value="teamCode">?????????</option>
			</select>


			<div id="saerch">
				<input type="text" name="" id="inputbox" placeholder="???????????? ???????????????">
				<button id="sbtn">??????</button>
			</div>
		</div>

		<div id="result">
			<div id="upside">
				<div>???<%=result.size() %>???</div>
				<div id="btnbox">
					<button id="add">??????</button>
					<button id="del">??????</button>
					<button id="upd">??????</button>
				</div>
			</div>
			<div id="list">
				<table>
					<thead>
						<tr>
							<th><input type="checkbox" name="" id="Cbox"></th>
							<th>????????????</th>
							<th>????????????</th>
							<th>???????????????</th>
							<th>???????????????</th>
							<th>?????????</th>
							<th>??????</th>
							<th>??????</th>
							<th>????????????</th>
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
			<a id="pre"> ?????? </a>
			<%
			if(result.size()%15 == 0 ) {
				for(int i=1; i<=result.size()/15;i++){
					if(i>15) {
						%>
						<a class="listnum" id="num<%=i%>" style="display: none;"> <% out.print(i); %></a>
						<%
					}else{
						%>
						<a class="listnum" id="num<%=i%>"> <% out.print(i); %> </a>
						<%
					}
				}
			}else if(result.size()%15 > 0 ){
				for(int i=1; i<=result.size()/15 + 1;i++){
					if(i>15) {
						%>
						<a class="listnum" id="num<%=i%>" style="display: none;"> <% out.print(i); %></a>
						<%
					}else{
						%>
						<a class="listnum" id="num<%=i%>"> <% out.print(i); %> </a>
						<%
					}
				}
				
			}else{
			%>
				<a> 1 </a>
			<%
			}
				
			%>
			<a id="next"> ?????? </a>
			</div>
			
			
			<div id="snev" style="display: none;" class="nev">
			<a id="spre"> ?????? </a>
			<%
			if(result.size()%15 == 0 ) {
				for(int i=1; i<=result.size()/15;i++){
					if(i>15) {
						%>
						<a id="num<%=i%>" style="display: none;"> <% out.print(i); %></a>
						<%
					}else{
						%>
						<a id="num<%=i%>"> <% out.print(i); %> </a>
						<%
					}
				}
			}else if(result.size()%15 > 0 ){
				for(int i=1; i<=result.size()/15 + 1;i++){
					if(i>15) {
						%>
						<a id="num<%=i%>" style="display: none;"> <% out.print(i); %></a>
						<%
					}else{
						%>
						<a id="num<%=i%>"> <% out.print(i); %> </a>
						<%
					}
				}
				
			}else{
			%>
				<a> 1 </a>
			<%
			}
				
			%>
			<a id="snext"> ?????? </a>
			</div>
			
		</div>		
	</div>
	
	<!-- ??????/?????? -->
	<script type="text/javascript">	
	let listselect = 0;
	let end = 0;
	if(<%=result.size()%15==0%>){
		end = <%=result.size()/15%>;
	}else{
		end = <%=result.size()/15%> + 1;
	}
	/* ?????? ?????? */
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
	
	/* ?????? ?????? */
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
	
	<!-- ????????? ?????? -->
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
			
			
			/* ????????? ?????? */
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

	<!-- ?????? ?????? -->
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
			 var del = confirm("?????? ??? ????????? ?????? ??????????????? ????????? ????????? ??? ????????????.\n?????? ?????????????????????????");
			 if(del){
				 location.href = "${pageContext.request.contextPath}/game/rdel?"+rclist;
			 }else{
				 location.reload();
			 } 
		 
		}else{
			 alert("????????? ????????? ?????? ??? ?????????");
		}
	 })
	 
	</script>

	<!-- ?????? ????????? -->
	<script>
        document.getElementById("add").addEventListener("click", function () {
        	alert("???????????? ?????? ?????? ??? ????????? ????????? ??????,\n ????????? ?????? ?????? ??? ???????????? ??????");
            document.getElementById("modalout").style.display="block";
            document.getElementById("modalout").style.opacity="0.1";
            var modal =  document.getElementById("modal");
            modal.style.display = "block";
            document.getElementById("ty").value = "add";
           
        });
    </script>
    
    <!-- ?????? ????????? -->
	<script>
        document.getElementById("upd").addEventListener("click", function () {
        	let upcnt = 0;
            
            for(let i=0; i<document.getElementsByClassName("gameCode").length; i++){
            	if(document.getElementsByClassName("checkbox")[i].checked == true){
            		upcnt++;
            	}
            	
            }
            if(upcnt < 1){
            	alert("????????? ????????? ????????? ?????????");
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
    
    <!-- ?????? ?????? ?????? -->
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
    
    <!-- ?????? ?????? ?????? ?????? -->
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
    
    <!-- ?????? ?????? ?????? ?????? -->
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
	
	<!-- ??? ?????? ?????? ?????? -->
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
	
	<!-- ?????? ?????? ?????? ?????? -->
	<script type="text/javascript">
	document.getElementById("addbtn").addEventListener("click",function(){
		console.log("??????");
		console.log(document.getElementById("inteamCode").value.trim());
		let cnt = 0;
		
		for(let i=0; i<document.querySelectorAll("#flist li input").length; i++){
			if(document.querySelectorAll("#flist li input")[i].value == ""){
				alert("?????? ????????? ?????????");
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
						alert("?????? ????????? ?????????????????????");
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
						alert("?????? ????????? ??????????????????");
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

	<!-- ?????? -->
	<script type="text/javascript">
	document.getElementById("sbtn").addEventListener("click",function(){
		let listselect = 0;
		let end = 0;
		if(<%=result.size()%15==0%>){
			end = <%=result.size()/15%>;
		}else{
			end = <%=result.size()/15%> + 1;
		}
		
		/* ???????????? ?????? */
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
			
			
			/* ????????? */
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
		            
		            
		            /* ??????????????? */
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
			
			/* ?????? */
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
			/* ?????? */
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
		
		
		
		
		
		/* ???????????? ?????? */
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
			
			
			/* ????????? */
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
		            
		            
		            /* ??????????????? */
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
			
			/* ?????? */
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
			/* ?????? */
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
		
		
		/* ????????????????????? */
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
			
			
			/* ????????? */
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
		            
		            
		            /* ??????????????? */
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
			
			/* ?????? */
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
			/* ?????? */
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
		
		
		/* ????????? ?????? */
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
			
			
			/* ????????? */
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
		            
		            
		            /* ??????????????? */
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
			
			/* ?????? */
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
			/* ?????? */
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
	
	<!-- ????????? ?????? -->
	<script type="text/javascript">
	 var input = document.getElementById("inputbox");
	 input.addEventListener("keyup", function (event) {
         if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("sbtn").click();
         }
       });
	</script>
	
	<!-- ?????? ???????????? -->
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