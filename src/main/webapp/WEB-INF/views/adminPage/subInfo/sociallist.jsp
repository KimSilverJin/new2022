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
<title>Insert title here</title>
<style>
	
	
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
        	list-style: none;
            margin: 0;
            padding: 0;
            /* background-color: white; */
            width: 170px;
            height: 100px;
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
        
        .menu1 {
			background-color: #f8ede3;
		}
</style>
</head>
<body>
	<div id="modalout"></div>
    <div id="modal">
        <h3>????????? ??????</h3>
            <ul id="flist">
                <li><p>???????????? : </p> <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="" id="ingameCode" class="inbox"></li>
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
                    
                <li><p>??????????????? : </p> <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="" id="inuserCode" class="inbox"></li>
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
            <button id="addbtn">??????</button>
            <button id="close">??????</button>

    </div>
    
    
    <!-- ?????? ?????? ?????? ?????? -->
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
	
	<!-- ?????? ?????? ?????? ?????? -->
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
	
	
    <!-- ?????? -->
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
        			alert("?????? ???????????? ????????? ?????????");
        			cnt++;
        			break;
        		}
        	} 
    		
    		var max = false;
    		if(cnt == 0 ){
    			console.log("??????"+pnum);
    			console.log("??????"+document.getElementsByClassName("GameMaxp")[index].innerText.trim());
    			if(pnum + 1 > document.getElementsByClassName("GameMaxp")[index].innerText.trim()){
        			var confirmflag = confirm("?????? ????????? ??? ??????????????? ?????? ???????????????????");
        			 if(confirmflag){
        				 location.href = "${pageContext.request.contextPath}/sub/sadd?userCode="+inuserCode+"&gameCode="+ingameCode;
        	           }
        		}else{
        			location.href = "${pageContext.request.contextPath}/sub/sadd?userCode="+inuserCode+"&gameCode="+ingameCode;
        		}
    		}
        	
		}else {
			alert("??????????????? ?????????????????? ??????????????????");
		}
    	
    });
    
    </script>
    
    
    <!-- ?????? ?????? -->
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
		<div id="searchbox">
			<select name="" id="select">
				<option value="null">????????????</option>
				<option value="subname">?????????</option>
				<option value="gamecode">????????????</option>
				<option value="gday">????????????</option>
				<option value="fieldname">????????????</option>
				<option value="fieldtype">????????????</option>
				<option value="gender">??????</option>
				<option value="mag">?????????</option>
			</select>


			<div id="saerch">
				<input type="text" name="" id="inputbox" placeholder="???????????? ???????????????">
				<button id="sbtn">??????</button>
			</div>
		</div>

		<div id="result">
			<div id="upside">
				<div>??? <%=sgamelist.size() %>???</div>
				<div id="btnbox">
					<button id="add">??????</button>
					<button id="del">??????</button>
				</div>
			</div>
			<div id="list">
				<table>
					<thead>
						<tr>
							<th><input type="checkbox" name="" id="Cbox"></th>
							<th>????????????</th>
							<th>????????????</th>
							<th>?????????</th>
							<th>???????????????</th>
							<th>????????????</th>
							<th>?????????</th>
							<th>????????????</th>
							<th>????????????</th>
							<th>????????????</th>
							<th>?????????</th>
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
				<a href="#" id="<%=i%>"> <%out.print(i); %> </a>
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
	
	<!-- ?????? ????????? -->
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
	
	<!-- ????????? ????????? -->
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

	<!-- ?????? -->
	<script type="text/javascript">
		document.getElementById("sbtn").addEventListener("click",function(){
		console.log(document.getElementById("select").value);
		
		
		/* ???????????? */
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
		
		/* ????????? ?????? */
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
		
		
		
		/* ???????????? ?????? */
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
		
		
		
		/* ???????????? ?????? */
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
		
		
		/* ???????????? ?????? */
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
		
		
		
		/* ???????????? ?????? */
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
		
		
		/* ????????? ?????? */
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
		
		
		
		/* ???????????? ?????? */
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
	
	
	<!-- ????????? ?????? -->
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
	

	<!-- ?????? -->
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
			 
			 var del = confirm("???????????????????????????????");
			 if(del){
				 location.href = "${pageContext.request.contextPath}/sub/sdel?"+cklist+"&"+uclist+"&"+gclist;
			 }else{
				 location.reload();
			 }
			 
	     });
	</script>


	<!-- ?????? ????????? -->
	<script>
        document.getElementById("add").addEventListener("click", function () {
            document.getElementById("modalout").style.display="block";
            document.getElementById("modalout").style.opacity="0.1";
            var modal =  document.getElementById("modal");
            modal.style.display = "block";
           
        });
    </script>

	<!-- ?????? ???????????? -->
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