<%@page import="com.sample.vo.GlistVO"%>
<%@page import="com.sample.vo.UserVO"%>
<%@page import="com.sample.vo.FieldReservationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	List<FieldReservationVO> cgamelist = null;
	List<UserVO>userlist = null;
	List<GlistVO> gamelist = null;
	
	if(session.getAttribute("cgamelist") != null){
		cgamelist = (List<FieldReservationVO>)session.getAttribute("cgamelist");
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
        .menu3 {
			background-color: #f8ede3;
		}
	
</style>
</head>
<body>
	<div id="out">
		<div id="searchbox">
			<select name="" id="select">
				<option value="subname">?????????</option>
				<option value="gamecode">????????????</option>
				<option value="gday">????????????</option>
				<option value="fieldname">????????????</option>
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
				<div>??? <%=cgamelist.size() %>???</div>
				
			</div>
			<div id="list">
				<table>
					<thead>
						<tr>
							<th>????????????</th>
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
							for(int i=0; i< cgamelist.size(); i++){
								%>
								<tr class="gamelist" id="list<%=i %>">
									<td class="gameCode">
										<%out.print(cgamelist.get(i).getGameCode()); %>
									</td>
									<td class="rvCode">
										<%out.print(cgamelist.get(i).getRvCode()); %>
									</td>
									<td class="rvType">
										<%
											if(cgamelist.get(i).getRvType().equals("S")){
												out.print("????????????");
											}else{
												out.print("?????????");
											}
										
										 %>
									</td>
									<td class="userName">
										<%
											for(int j=0; j< userlist.size(); j++) {
												if(cgamelist.get(i).getUserCode() == userlist.get(j).getUserCode()){
													out.print(userlist.get(j).getUserName());
												}
											}
										%>
									</td>
									<td class="userCode">
										<%out.print(cgamelist.get(i).getUserCode()); %>
									</td>
									<td class="GameDay">
										<%out.print(cgamelist.get(i).getGameDay()); %>
									</td>
									<td class="fieldName">
										<%out.print(cgamelist.get(i).getFieldName()); %>
									</td>
									<td class="fieldType">
										<%out.print(cgamelist.get(i).getFieldType()); %>
									</td>
									<td class="GameGender">
										<%
											for(int j=0; j< gamelist.size(); j++){
												if(cgamelist.get(i).getGameCode() == gamelist.get(j).getGameCode()){
													out.print(gamelist.get(j).getGameGender());
												}
											}
										%>
									</td>
									<td class="GamePnum">
										<%
											for(int j=0; j< gamelist.size(); j++){
												if(cgamelist.get(i).getGameCode() == gamelist.get(j).getGameCode()){
													out.print(gamelist.get(j).getGamePnum());
												}
											}
										%>
									</td>
									<td class="GameMag">
										<%
											for(int j=0; j< gamelist.size(); j++){
												if(cgamelist.get(i).getGameCode() == gamelist.get(j).getGameCode()){
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
			if((cgamelist.size()/15)>=1){
				for(int i=1; i<=cgamelist.size()/15+1; i++){
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
	for(let k=0; k< <%=cgamelist.size()%>; k++){
    	document.getElementById("tablelist").children[k].style.display = "none";
    }
	if(<%=cgamelist.size()%> <15) {
		for(let k=0; k<<%=cgamelist.size()%>; k++){
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
		for(let i=0; i<document.getElementById("nev").children.length; i++){
			let j = i*15;
			
			document.getElementById("nev").children[i].addEventListener("click",function(){
	            for(let k=0; k< <%=cgamelist.size()%>; k++){
	            	document.getElementById("tablelist").children[k].style.display = "none";
	            }
	            
	            if(i==<%=cgamelist.size()/15%>){
	            	for(let k=j; k<<%=cgamelist.size()%>; k++){
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
		console.log("??????");
		/* ???????????? */
		if(document.getElementById("select").value == "null"){
			
			let cnt = 0;
			for(let i=0; i<(<%=cgamelist.size()%>); i++){
				document.getElementById("tablelist").children[i].style.display = "";
				cnt++;
			}
			
			let num = Math.round((cnt / 15))+1;
			console.log(num);
			for(let i=num; i<<%=cgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		
		/* ????????? ?????? */
		if(document.getElementById("select").value == "subname"){
			
			let cnt = 0;
			for(let i=0; i<(<%=cgamelist.size()%>); i++){
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
			for(let i=num; i<<%=cgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		
		/* ???????????? ?????? */
		if(document.getElementById("select").value == "gamecode"){
			let cnt = 0;
			for(let i=0; i<(<%=cgamelist.size()%>); i++){
				var text = document.getElementsByClassName("gameCode")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=cgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		
		/* ???????????? ?????? */
		if(document.getElementById("select").value == "gday"){
			let cnt = 0;
			for(let i=0; i<(<%=cgamelist.size()%>); i++){
				var text = document.getElementsByClassName("GameDay")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=cgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		/* ???????????? ?????? */
		if(document.getElementById("select").value == "fieldname"){
			let cnt = 0;
			for(let i=0; i<(<%=cgamelist.size()%>); i++){
				var text = document.getElementsByClassName("fieldName")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=cgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		/* ???????????? ?????? */
		if(document.getElementById("select").value == "fieldtype"){
			let cnt = 0;
			for(let i=0; i<(<%=cgamelist.size()%>); i++){
				var text = document.getElementsByClassName("fieldType")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=cgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		
		
		/* ????????? ?????? */
		if(document.getElementById("select").value == "mag"){
			let cnt = 0;
			for(let i=0; i<(<%=cgamelist.size()%>); i++){
				var text = document.getElementsByClassName("GameMag")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value)!= -1) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=cgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
		}
		
		
		
		/* ???????????? ?????? */
		if(document.getElementById("select").value == "gender"){
			let cnt = 0;
			for(let i=0; i<(<%=cgamelist.size()%>); i++){
				var text = document.getElementsByClassName("GameGender")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tablelist").children[i].style.display = "";
					cnt++;
				}else{
					document.getElementById("tablelist").children[i].style.display = "none";
				}
			}
			
			let num = Math.round((cnt / 15))+1;
			for(let i=num; i<<%=cgamelist.size()/15+1%>; i++){
				document.getElementById("nev").children[i].style.display = "none";
			}
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



</body>
</html>