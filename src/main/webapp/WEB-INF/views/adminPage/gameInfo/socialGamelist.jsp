<%@page import="com.sample.vo.GameFieldInfoVO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sample.vo.GlistVO"%>
<%@page import="com.sample.vo.UserVO"%>
<%@page import="com.sample.vo.FieldReservationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	List<UserVO>userlist = null;
	List<GlistVO> gamelist = new ArrayList<GlistVO>();
	List<GameFieldInfoVO> allfield = (List<GameFieldInfoVO>)session.getAttribute("allfield");
	
	if(session.getAttribute("userlist") != null){
		userlist = (List<UserVO>)session.getAttribute("userlist");
	}
	if(session.getAttribute("gamelist") !=null) {
		List<GlistVO> allgamelist = (List<GlistVO>)session.getAttribute("gamelist");
		for(int i=0; i<allgamelist.size(); i++){
			if(allgamelist.get(i).getGameType().equals("S")){
				gamelist.add(allgamelist.get(i));
			}
		}
	}
	
	LocalTime now = LocalTime.now();
	int hour = now.getHour();
	LocalDate nday = LocalDate.now();
	
	
	LocalDate nowd = LocalDate.now();
	int year = nowd.getYear();
	int month = nowd.getMonthValue();
	
	String dateset ="";
	if(month == 12) {
		dateset = year + "-" + (01) + "-17";
	}else {
		dateset = year + "-" + (month+1) + "-17";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/js/jquery-ui.css"/>
<script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery-ui.js"></script>
<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
<title>Insert title here</title>
<style>
	.menu1 {
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
        #newgame{
        	border: 1px solid #BDD2B6;;
    		background: #BDD2B6;
    		color: white;
    		border-radius: 5px;
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
            border: 1px solid black;
        }
        
        #ui-datepicker-div{
        	background-color: white;
        }
        #flist > li {
        	display: flex;
        }
         #flist > li > p {
         	width: 100px;
         }
         .listbox{
        	list-style: none;
            margin: 0;
            padding: 0;
            /* background-color: white; */
            width: 170px;
            height: 25px;
            overflow-y: scroll;
            overflow-x: hidden;
           
        }
        #fclist{
        	display: none;
        }
        
        
        /* ?????? ?????? */
         #upmodal {
            position: absolute;
            top: 30%;
            left: 36%;
            width: 400px;
            height: 400px;
            background-color: #b7e1c6;
            padding: 10px;
            display: none;

        }

        #updiv {
            position: absolute;
            width: 90%;
            height: 90%;
            background-color: gray;
            display: none;
        }

        #upmodal * {
            border: 1px solid black;
        }
        #upul{
            list-style: none;
            margin: 0;
            padding: 0;
        }
        #upul > li{
            display: flex;
        }
        #upul > li > p{
            padding: 0;
            margin: 0;
        }
        #upul > li > input{
            background: none;
        }
</style>
</head>
<body>

<div id="modalout"></div>
    <div id="modal">
        <h3>?????? ??????</h3>
        <form method="post" id="newadd" role="form" action="${pageContext.request.contextPath}/game/sadd">
        <input type="hidden" name="select" value="gameAdmin">
            <ul id="flist">
                <li><p>??????????????? : </p> <input type="text" name="fieldCode" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="infieldCode" class="inbox" autocomplete='off'></li>
                <li><p id="pbox" style="display: none;"> </p><ul id="fclist" class="listbox">
                    	<%
                    	for(int i=0; i<allfield.size(); i++) {
                			%>
                			<li id="fnum<%=i %>" class="fnumlist"><%out.println(allfield.get(i).getFieldCode());%></li>
                			<%
                		}
                    	%>
                    </ul>
                    </li>
                    
                <li><p>???????????? : </p> <input type="text" name="gameDay" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="txtDate" value="" autocomplete='off'></li>
                <li><p>???????????? : </p> <select name="gameTime" id="timeselect">
                						<option value="null">????????? ????????? ?????????</option>
                						<option value="08:00" id="08:00">08:00</option>
                						<option value="10:00" id="10:00">10:00</option>
                						<option value="12:00" id="12:00">12:00</option>
                						<option value="14:00" id="14:00">14:00</option>
                						<option value="16:00" id="16:00">16:00</option>
                						<option value="18:00" id="18:00">18:00</option>
                						<option value="20:00" id="20:00">20:00</option>
                					</select></li>
                <li><p>???????????? : </p> <select name="level" id="levelselect">
                						<option value="??????1">??????1</option>
                						<option value="??????2">??????2</option>
                						<option value="??????3">??????3</option>
                						<option value="????????????1">????????????1</option>
                						<option value="????????????2">????????????2</option>
                						<option value="????????????3">????????????3</option>
                						<option value="????????????1">????????????1</option>
                						<option value="????????????2">????????????2</option>
                						<option value="????????????3">????????????3</option>
                					</select></li>
                <li><p>???????????? : </p> <select name="gameGender" id="genderselect">
                						<option value="??????">??????</option>
                						<option value="??????">??????</option>
                						<option value="??????">??????</option>
                					</select></li>
                <!-- <li><p>???????????? : </p> <select id="matchselect">
                						<option value="5vs5">5vs5</option>
                						<option value="6vs6">6vs6</option>
                					</select></li> -->
                <li><p>???????????? : </p> <input type="text" name="gameMinp" id="minp" class="inbox" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
                <li><p>???????????? : </p> <input type="text" name="gameMaxp" id="maxp" class="inbox" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
                <li><p>????????? : </p> <input type="text" name="gameMag" id="mag" class="inbox" autocomplete='off'></li>
                <li><p>????????? : </p> <input type="text" name="gamePay" id="pay" class="inbox" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
                
            </ul>
            <button id="addbtn">??????</button>
            </form>
            <button id="close">??????</button>

    </div>
    
    
<div id="updiv"></div>
    <div id="upmodal">
        <form method="post" id="newadd" role="form" action="${pageContext.request.contextPath}/game/update">
            <ul id="upul">
                <li><p>???????????? : </p><input type="text" name="gameCode" id="upcode" readonly></li>
                <li><p>???????????? : </p><input type="text" name="gameDay" id="upday" autocomplete="off"></li>
                <li><p>???????????? : </p><select name="gameTime" id="uptime">
                						<option value="null">????????? ????????? ?????????</option>
                						<option value="08:00">08:00</option>
                						<option value="10:00">10:00</option>
                						<option value="12:00">12:00</option>
                						<option value="14:00">14:00</option>
                						<option value="16:00">16:00</option>
                						<option value="18:00">18:00</option>
                						<option value="20:00">20:00</option>
                					</select>
                <li><p>???????????? : </p><select name="level" id="uplevel">
                						<option value="??????1">??????1</option>
                						<option value="??????2">??????2</option>
                						<option value="??????3">??????3</option>
                						<option value="????????????1">????????????1</option>
                						<option value="????????????2">????????????2</option>
                						<option value="????????????3">????????????3</option>
                						<option value="????????????1">????????????1</option>
                						<option value="????????????2">????????????2</option>
                						<option value="????????????3">????????????3</option>
                					</select></li>
                <!-- <li><p>???????????? : </p><input type="text" name="gameMacth" id="upmatch"></li> -->
                <li><p>???????????? : </p><input type="text" name="close" id="upclose"></li>
                <li><p>???????????? : </p><input type="text" name="gameMinp" id="upmin"></li>
                <li><p>???????????? : </p><input type="text" name="gameMaxp" id="upmax"></li>
                <li><p>???????????? :</p><input type="text" name="gamePnum" id="upnum" readonly></li>
                <li><p>????????? : </p><input type="text" name="gameMag" id="upmag"></li>
            </ul>
            <button id="upsub">??????</button>
        </form>
        <button id="upcbtn">??????</button>
    </div> 
    
    
    <!-- ?????? ?????? ?????? ?????? -->
	<script type="text/javascript">
	 var ing = document.getElementById("infieldCode");
	 let ccnt =0;
	 ing.addEventListener("keyup", function (event) {
		 for(let i =0; i< <%=allfield.size()%>; i++){document.getElementById("fnum"+i).style.display = "none";}
		 
		 
		 for(let i =0; i< <%=allfield.size()%>; i++){
			 let intext = document.getElementById("infieldCode").value.trim();
			 let ortext = document.getElementsByClassName("fnumlist")[i].innerText.trim();
			 document.getElementById("fclist").style.display = "none";
			 document.getElementById("pbox").style.display = "none";
			 if(intext.length >= 2 ){
				 if(ortext.indexOf(intext) != -1){
					 document.getElementById("fnum"+i).style.display = "block";
					 document.getElementById("fnum"+i).style.backgroundColor = "#fff";
					 document.getElementById("fclist").style.display = "block";
					 document.getElementById("pbox").style.display = "block";
				 }
				 if(intext == ortext){
					 ccnt++;

				 }
			 }
			 
		 }
       });
	</script>
    
    
    <!-- ?????? -->
    <script type="text/javascript">
    $.datepicker.setDefaults({
    	  dateFormat: 'yy-mm-dd',
    	  prevText: '?????? ???',
    	  nextText: '?????? ???',
    	  monthNames: ['1???', '2???', '3???', '4???', '5???', '6???', '7???', '8???', '9???', '10???', '11???', '12???'],
    	  monthNamesShort: ['1???', '2???', '3???', '4???', '5???', '6???', '7???', '8???', '9???', '10???', '11???', '12???'],
    	  dayNames: ['???', '???', '???', '???', '???', '???', '???'],
    	  dayNamesShort: ['???', '???', '???', '???', '???', '???', '???'],
    	  dayNamesMin: ['???', '???', '???', '???', '???', '???', '???'],
    	  showMonthAfterYear: true,
    	  yearSuffix: '???'
    	});
    
        $(function() {            
            $('#txtDate').datepicker({ minDate: 0});
        });
      </script>
      
      
    <!-- ?????? -->
    <script type="text/javascript">
    $.datepicker.setDefaults({
    	  dateFormat: 'yy-mm-dd',
    	  prevText: '?????? ???',
    	  nextText: '?????? ???',
    	  monthNames: ['1???', '2???', '3???', '4???', '5???', '6???', '7???', '8???', '9???', '10???', '11???', '12???'],
    	  monthNamesShort: ['1???', '2???', '3???', '4???', '5???', '6???', '7???', '8???', '9???', '10???', '11???', '12???'],
    	  dayNames: ['???', '???', '???', '???', '???', '???', '???'],
    	  dayNamesShort: ['???', '???', '???', '???', '???', '???', '???'],
    	  dayNamesMin: ['???', '???', '???', '???', '???', '???', '???'],
    	  showMonthAfterYear: true,
    	  yearSuffix: '???'
    	});
    
        $(function() {            
            $('#upday').datepicker({ minDate: 0});
        });
      </script>
    
    <!-- ?????? --> 
    <script type="text/javascript">
    document.getElementById("timeselect").addEventListener("click",function(){
    	if('<%=nday%>' ==  document.getElementById("txtDate").value){
    		for(let i=0; i<document.getElementById("timeselect").children.length;i++){
        		if(document.getElementById("timeselect").children[i].innerText <= '<%=hour%>:00'){
        			document.getElementById("timeselect").children[i].style.display = "none";
        		}
        	}
    	}
		
    })
    </script>

	<!-- ?????? -->
	<script type="text/javascript">
	document.getElementById("addbtn").addEventListener("click",function(){		
		let cnt=0;
		for(let i=0; i<document.querySelectorAll("#flist li input").length; i++){
			if(document.querySelectorAll("#flist li input")[i].value == ""){
				alert("?????? ????????? ?????????");
				document.querySelectorAll("#flist li input")[i].focus();
				cnt++;
				break;
			}
			if( document.getElementById("timeselect").value == "null"){
				alert("?????? ????????? ?????????");
				cnt++;
				document.getElementById("timeselect").focus();
				break;
			}
			if(ccnt == 0){
				alert("???????????? ?????? ???????????????");
				break;
			}
		}
		
		let dycnt=0;
		for(let i=0; i< <%=gamelist.size()%>; i++) {
			if(document.getElementsByClassName("fieldcode")[i].innerText.trim() == document.getElementById("infieldCode").value.trim()){
				if(document.getElementsByClassName("gameDay")[i].innerText.trim() == document.getElementById("txtDate").value.trim()){
					if(document.getElementsByClassName("gameTime")[i].innerText.trim() == document.getElementById("timeselect").value.trim()){
						dycnt++;
						alert("?????? ????????? ????????? ?????????????????????");
					}
				}
			}
		}
		
		
		if(cnt == 0 && dycnt==0){
			this.type="submit";
		}else{
			this.type="button";
		}
		
    })
	</script>



<div id="out">
		<div id="searchbox">
			<select name="" id="select">
				<option value="null">????????????</option>
				<option value="gameCode">????????????</option>
				<option value="gameDay">????????????</option>
				<option value="gameTime">????????????</option>
				<option value="level">????????????</option>
				<option value="gameMacth">????????????</option>
				<option value="mag">?????????</option>
			</select>


			<div id="saerch">
				<input type="text" name="" id="inputbox" placeholder="???????????? ???????????????">
				<button id="sbtn">??????</button>
			</div>
		</div>

		<div id="result">
			<div id="upside">
				<div>??? <%=gamelist.size() %>???</div>
				<div id="btnbox">
					<button id="newgame">????????? ?????? ?????? ??????</button>
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
							<th>????????????</th>
							<th>????????????</th>
							<th>????????????</th>
							<th>????????????</th>
							<th>????????????</th>
							<th>????????????</th>
							<th>????????????</th>
							<th>?????????</th>
							<th>?????????</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<%
							for(int i=0; i<gamelist.size(); i++){
								if(i<15){
							%>
							<tr class="gamelist" id="game<%=i%>">
							<td><input type="checkbox" name="" id="Cbox" class="checkbox"></td>
							<td class="gameCode"><%out.println(gamelist.get(i).getGameCode()); %></td>
							<td class="gameDay"><%out.println(gamelist.get(i).getGameDay()); %></td>
							<td class="gameTime"><%out.println(gamelist.get(i).getGameTime()+":00");%></td>
							<td class="level"><%out.println(gamelist.get(i).getLevel()); %></td>
							<td class="gameMacth"><%out.println(gamelist.get(i).getGameMacth()); %></td>
							<td class="close"><%out.println(gamelist.get(i).getClose()); %></td>
							<td class="gameMinp"><%out.println(gamelist.get(i).getGameMinp()); %></td>
							<td class="gameMaxp"><%out.println(gamelist.get(i).getGameMaxp()); %></td>
							<td class="gamePnum"><%out.println(gamelist.get(i).getGamePnum()); %></td>
							<td class="gameMag"><%out.println(gamelist.get(i).getGameMag()); %></td>
							<td class="gamePay"><%out.println(gamelist.get(i).getGamePay()); %></td>
							<td class="fieldcode" style="display: none;"><%out.println(gamelist.get(i).getFieldCode()); %></td>
							</tr>
							<%
								}
								else{%>
							<tr class="gamelist" id="game<%=i%>" style="display: none;">
							<td><input type="checkbox" name="" id="Cbox" class="checkbox"></td>
							<td class="gameCode"><%out.println(gamelist.get(i).getGameCode()); %></td>
							<td class="gameDay"><%out.println(gamelist.get(i).getGameDay()); %></td>
							<td class="gameTime"><%out.println(gamelist.get(i).getGameTime()+":00");%></td>
							<td class="level"><%out.println(gamelist.get(i).getLevel()); %></td>
							<td class="gameMacth"><%out.println(gamelist.get(i).getGameMacth()); %></td>
							<td class="close"><%out.println(gamelist.get(i).getClose()); %></td>
							<td class="gameMinp"><%out.println(gamelist.get(i).getGameMinp()); %></td>
							<td class="gameMaxp"><%out.println(gamelist.get(i).getGameMaxp()); %></td>
							<td class="gamePnum"><%out.println(gamelist.get(i).getGamePnum()); %></td>
							<td class="gameMag"><%out.println(gamelist.get(i).getGameMag()); %></td>
							<td class="gamePay"><%out.println(gamelist.get(i).getGamePay()); %></td>
							<td class="fieldcode" style="display: none;"><%out.println(gamelist.get(i).getFieldCode()); %></td>
							</tr>
							<%	
								}
							}
						%>
					</tbody>
					
				</table>
			</div>
			<div id="nev"  class="nev"> 
			<a id="pre"> ?????? </a>
			<%
			if(gamelist.size()%15 == 0 ) {
				for(int i=1; i<=gamelist.size()/15;i++){
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
			}else if(gamelist.size()%15 > 0 ){
				for(int i=1; i<=gamelist.size()/15 + 1;i++){
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
			if(gamelist.size()%15 == 0 ) {
				for(int i=1; i<=gamelist.size()/15;i++){
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
			}else if(gamelist.size()%15 > 0 ){
				for(int i=1; i<=gamelist.size()/15 + 1;i++){
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
		

		
	<!-- ??????/?????? -->
	<script type="text/javascript">	
	let listselect = 0;
	let end = 0;
	if(<%=gamelist.size()%15==0%>){
		end = <%=gamelist.size()/15%>;
	}else{
		end = <%=gamelist.size()/15%> + 1;
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
		for(let i= listselect; i<listselect+15; i++){
			document.getElementsByClassName("listnum")[i].style.display = "";
		}
		
	});
	
	
	/* ?????? ?????? */
	document.getElementById("next").addEventListener("click",function(){
		
		if(listselect + 15 >=(end-15)){
			listselect = end-15;
		}else{
			listselect = listselect + 15;
		}
		
		for(let i=0; i< document.getElementsByClassName("listnum").length; i++) {
			document.getElementsByClassName("listnum")[i].style.display = "none";
		}
		for(let i= listselect; i<listselect+15; i++){
			document.getElementsByClassName("listnum")[i].style.display = "";
		}
		
	});
	
	</script>

	
	<!-- ????????? ?????? -->
	<script type="text/javascript">
	for(let i=0; i< document.getElementsByClassName("listnum").length; i++) {
		document.getElementsByClassName("listnum")[i].addEventListener("click",function(){
			if (this.innerText > (end-8)){
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
			
			for(let i=num; i<num+15; i++){
				document.getElementsByClassName("gamelist")[i].style.display = "";
			}
			
			
			
	    })
	}
	</script>
	
	<!-- ?????? -->
	<script type="text/javascript">
	document.getElementById("sbtn").addEventListener("click",function(){
		let listselect = 0;
		let end = 0;
		if(<%=gamelist.size()%15==0%>){
			end = <%=gamelist.size()/15%>;
		}else{
			end = <%=gamelist.size()/15%> + 1;
		}
		
		/* ???????????? ?????? */
		if(document.getElementById("select").value == "gameCode"){
			document.getElementById("nev").style.display = "none";
			document.getElementById("snev").style.display = "";
			let cnt = 0;
			for(let i=0; i<(<%=gamelist.size()%>); i++){
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
		
		
		/* ?????? ?????? */
		if(document.getElementById("select").value == "gameDay"){
			document.getElementById("nev").style.display = "none";
			document.getElementById("snev").style.display = "";
			let cnt = 0;
			for(let i=0; i<(<%=gamelist.size()%>); i++){
				document.getElementById("tbody").children[i].className = "gamelist";
				var text = document.getElementsByClassName("gameDay")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tbody").children[i].style.display = "";
					document.getElementById("tbody").children[i].className = "gamelist drgamelist";
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
				document.getElementById("snev").children[i].className = "drlistnum";
				document.getElementById("snev").children[i].style.display = "";
				if(i>15){
					document.getElementById("snev").children[i].style.display = "none";
				}
			}
			
			
			/* ????????? */
			var senum = 0;
	        var seend = num;
			for(let i=0; i<num;i++){
				document.getElementsByClassName("drlistnum")[i].addEventListener("click",function(){
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
			        	document.getElementsByClassName("drgamelist")[i].style.display = "none";		        	
			        }
			        if(snum + 15 >cnt){
			        	if(cnt-15 >= 0){
			        		for(let i = cnt -15; i<cnt; i++){
				        		document.getElementsByClassName("drgamelist")[i].style.display = "";
				        	}
			        	}else{
			        		for(let i = 0; i<cnt; i++){
				        		document.getElementsByClassName("drgamelist")[i].style.display = "";
				        	}
			        	}
			        	
			        }else{
			        	for(let i = snum; i<snum+15; i++){
			        		document.getElementsByClassName("drgamelist")[i].style.display = "";
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
		
		
		
		/* ?????? ?????? */
		if(document.getElementById("select").value == "gameTime"){
			document.getElementById("nev").style.display = "none";
			document.getElementById("snev").style.display = "";
			let cnt = 0;
			for(let i=0; i<(<%=gamelist.size()%>); i++){
				document.getElementById("tbody").children[i].className = "gamelist";
				var text = document.getElementsByClassName("gameTime")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tbody").children[i].style.display = "";
					document.getElementById("tbody").children[i].className = "gamelist trgamelist";
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
				document.getElementById("snev").children[i].className = "listnum trlistnum";
				document.getElementById("snev").children[i].style.display = "";
				if(i>15){
					document.getElementById("snev").children[i].style.display = "none";
				}
			}
			
			/* ????????? */
			var senum = 0;
	        var seend = num;
			for(let i=0; i<num;i++){
				document.getElementsByClassName("trlistnum")[i].addEventListener("click",function(){
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
			        	document.getElementsByClassName("trgamelist")[i].style.display = "none";		        	
			        }
			        if(snum + 15 >cnt){
			        	if(cnt-15 >= 0){
			        		for(let i = cnt -15; i<cnt; i++){
				        		document.getElementsByClassName("trgamelist")[i].style.display = "";
				        	}
			        	}else{
			        		for(let i = 0; i<cnt; i++){
				        		document.getElementsByClassName("trgamelist")[i].style.display = "";
				        	}
			        	}
			        	
			        }else{
			        	for(let i = snum; i<snum+15; i++){
			        		document.getElementsByClassName("trgamelist")[i].style.display = "";
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
		
		
		/* ?????? ?????? */
		if(document.getElementById("select").value == "level"){
			document.getElementById("nev").style.display = "none";
			document.getElementById("snev").style.display = "";
			let cnt = 0;
			for(let i=0; i<(<%=gamelist.size()%>); i++){
				document.getElementById("tbody").children[i].className = "gamelist";
				var text = document.getElementsByClassName("level")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tbody").children[i].style.display = "";
					document.getElementById("tbody").children[i].className = "gamelist lrgamelist";
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
				document.getElementById("snev").children[i].className = "listnum lrlistnum";
				document.getElementById("snev").children[i].style.display = "";
				if(i>15){
					document.getElementById("snev").children[i].style.display = "none";
				}
			}
			
			
			/* ????????? */
			var senum = 0;
	        var seend = num;
			for(let i=0; i<num;i++){
				document.getElementsByClassName("lrlistnum")[i].addEventListener("click",function(){
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
			        	document.getElementsByClassName("lrgamelist")[i].style.display = "none";		        	
			        }
			        if(snum + 15 >cnt){
			        	if(cnt-15 >= 0){
			        		for(let i = cnt -15; i<cnt; i++){
				        		document.getElementsByClassName("lrgamelist")[i].style.display = "";
				        	}
			        	}else{
			        		for(let i = 0; i<cnt; i++){
				        		document.getElementsByClassName("lrgamelist")[i].style.display = "";
				        	}
			        	}
			        	
			        }else{
			        	for(let i = snum; i<snum+15; i++){
			        		document.getElementsByClassName("lrgamelist")[i].style.display = "";
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
		
		/* ?????? ?????? */
		if(document.getElementById("select").value == "gameMacth"){
			document.getElementById("nev").style.display = "none";
			document.getElementById("snev").style.display = "";
			let cnt = 0;
			for(let i=0; i<(<%=gamelist.size()%>); i++){
				document.getElementById("tbody").children[i].className = "gamelist";
				var text = document.getElementsByClassName("gameMacth")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tbody").children[i].style.display = "";
					document.getElementById("tbody").children[i].className = "gamelist mrgamelist";
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
				document.getElementById("snev").children[i].className = "listnum mrlistnum";
				document.getElementById("snev").children[i].style.display = "";
				if(i>15){
					document.getElementById("snev").children[i].style.display = "none";
				}
			}
			
			/* ????????? */
			var senum = 0;
	        var seend = num;
			for(let i=0; i<num;i++){
				document.getElementsByClassName("mrlistnum")[i].addEventListener("click",function(){
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
			        	document.getElementsByClassName("mrgamelist")[i].style.display = "none";		        	
			        }
			        if(snum + 15 >cnt){
			        	if(cnt-15 >= 0){
			        		for(let i = cnt -15; i<cnt; i++){
				        		document.getElementsByClassName("mrgamelist")[i].style.display = "";
				        	}
			        	}else{
			        		for(let i = 0; i<cnt; i++){
				        		document.getElementsByClassName("mrgamelist")[i].style.display = "";
				        	}
			        	}
			        	
			        }else{
			        	for(let i = snum; i<snum+15; i++){
			        		document.getElementsByClassName("mrgamelist")[i].style.display = "";
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
		if(document.getElementById("select").value == "mag"){
			document.getElementById("nev").style.display = "none";
			document.getElementById("snev").style.display = "";
			let cnt = 0;
			for(let i=0; i<(<%=gamelist.size()%>); i++){
				var text = document.getElementsByClassName("gameMag")[i].innerText;
				if(text.indexOf(document.getElementById("inputbox").value) != -1) {
					document.getElementById("tbody").children[i].style.display = "";
					document.getElementById("tbody").children[i].className = "gamelist argamelist";
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
				document.getElementById("snev").children[i].className = "listnum arlistnum";
				document.getElementById("snev").children[i].style.display = "";
				if(i>15){
					document.getElementById("snev").children[i].style.display = "none";
				}
			}
			
			/* ????????? */
			var senum = 0;
	        var seend = num;
			for(let i=0; i<num;i++){
				document.getElementsByClassName("arlistnum")[i].addEventListener("click",function(){
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
			        	document.getElementsByClassName("argamelist")[i].style.display = "none";		        	
			        }
			        if(snum + 15 >cnt){
			        	if(cnt-15 >= 0){
			        		for(let i = cnt -15; i<cnt; i++){
				        		document.getElementsByClassName("argamelist")[i].style.display = "";
				        	}
			        	}else{
			        		for(let i = 0; i<cnt; i++){
				        		document.getElementsByClassName("argamelist")[i].style.display = "";
				        	}
			        	}
			        	
			        }else{
			        	for(let i = snum; i<snum+15; i++){
			        		document.getElementsByClassName("argamelist")[i].style.display = "";
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

	<!-- ?????? ????????? -->
	<script>
        document.getElementById("add").addEventListener("click", function () {
            document.getElementById("modalout").style.display="block";
            document.getElementById("modalout").style.opacity="0.1";
            var modal =  document.getElementById("modal");
            modal.style.display = "block";
           
        });
    </script>
    
    <!-- ?????? ?????? -->
    <script type="text/javascript">
    document.getElementById("close").addEventListener("click", function () {
        document.getElementById("modalout").style.display = "none";
        var modal =  document.getElementById("modal");
        modal.style.display = "none";
    });
    </script>
    
    <!-- ?????? -->
	<script type="text/javascript">
	 document.getElementById("del").addEventListener("click", function () {
		 console.log("dhkdghkfds");
		 var gclist = "gameCode=0";
		 let ttcnt=0;
		 let delcnt=0;
		 for(let i=0; i<<%=gamelist.size()%>; i++){
			 if(document.getElementsByClassName("checkbox")[i].checked == true){
				 console.log(i);
				 delcnt++;
				 if(document.getElementsByClassName("gameDay")[i].innerText == '<%=nday%>'){
					 if(document.getElementsByClassName("gameTime")[i].innerText <= '<%=hour%>:00')
						ttcnt++;
					 }else if(document.getElementsByClassName("gameDay")[i].innerText <= '<%=nday%>'){
						 ttcnt++;
				 }else{
					 gclist = gclist + "&gameCode=" + document.getElementsByClassName("gameCode")[i].innerText;
				 }
		 	}
		 }
			 
		 if(delcnt == 0){
			 alert("????????? ????????? ??????????????????");
		 }else{
			 if(ttcnt <1){
				 var del = confirm("???????????????????????????????");
				 if(del){
					 location.href = "${pageContext.request.contextPath}/game/del?"+gclist;
				 }else{
					 location.reload();
				 } 
			 }else if(ttcnt >=1){
				 alert("?????? ????????? ????????? ??? ????????????");
			 }
		 }
		 for(let i=0; i<<%=gamelist.size()%>; i++){
			 document.getElementsByClassName("checkbox")[i].checked = false;
		 }
		 
	 })
	 
	</script>
  
	<!-- ???????????? -->
	<script type="text/javascript">
	document.getElementById("upd").addEventListener("click", function () {
		
		let senum = 0;
		let sgcode = 0;
		 for(let i=0; i<<%=gamelist.size()%>; i++){
			 if(document.getElementsByClassName("checkbox")[i].checked == true){
				 senum++;
				 //sgcode=document.getElementsByClassName("gameCode")[i].innerText;
				 sgcode=i;
				 }
			 }
		 
		 if(senum >1){
			 alert("????????? ?????? ??? ?????????");
		 }else if(senum<1){
			 alert("?????? ??? ????????? ??????????????????");
		 }
		 else{
			 document.getElementById("updiv").style.display="block";
			 document.getElementById("updiv").style.opacity="0.1";
			 document.getElementById("upmodal").style.display="block";
			 
			 console.log(document.getElementsByClassName("gameCode")[sgcode].innerText);
			 document.getElementById("upcode").value = document.getElementsByClassName("gameCode")[sgcode].innerText;
			 document.getElementById("upday").value = document.getElementsByClassName("gameDay")[sgcode].innerText;
			 /* var ckckck = document.getElementsByClassName("gameTime")[sgcode].innerText;
			 console.log(ckckck);
			 document.getElementById(ckckck).selected = true; */
			 /* document.getElementById("uplevel").value = document.getElementsByClassName("level")[sgcode].innerText; */
			/*  document.getElementById("upmatch").value = document.getElementsByClassName("gameMacth")[sgcode].innerText; */
			 document.getElementById("upclose").value = document.getElementsByClassName("close")[sgcode].innerText;
			 document.getElementById("upmin").value = document.getElementsByClassName("gameMinp")[sgcode].innerText;
			 document.getElementById("upmax").value = document.getElementsByClassName("gameMaxp")[sgcode].innerText;
			 document.getElementById("upnum").value = document.getElementsByClassName("gamePnum")[sgcode].innerText;
			 document.getElementById("upmag").value = document.getElementsByClassName("gameMag")[sgcode].innerText;
			
			 	 
		 }
		 
		 
	 })	
	</script>
	
	<!-- ???????????? ?????? -->
	<script type="text/javascript">
	document.getElementById("upcbtn").addEventListener("click", function () {
		for(let i=0; i<document.getElementsByClassName("gameCode").length; i++){
         	document.getElementsByClassName("checkbox")[i].checked = false;
		 }
		console.log("ddddd");
		document.getElementById("updiv").style.display = "none";
		document.getElementById("upmodal").style.display = "none";
	});
	</script>
	
	<!-- ?????? -->
	<script type="text/javascript">
	document.getElementById("upsub").addEventListener("click", function () {
		if(document.getElementById("uptime").value == "null"){
			alert("????????? ?????? ????????????");
			this.type = "button";
		}else{
			this.type = "submit";
		}
		
	})
	</script>
	
	<!-- ?????? ???????????? -->
	<script type="text/javascript">
	document.getElementById("Cbox").addEventListener("click", function () {
		if(this.checked == true){
			for(var i=0; i< <%=gamelist.size()%>; i++){
				document.getElementsByClassName("checkbox")[i].checked = true;
			}
		}else {
			for(var i=0; i< <%=gamelist.size()%>; i++){
				document.getElementsByClassName("checkbox")[i].checked = false;
			}
		}
       
    });
	</script>
	
	<!-- ?????? -->
	<script type="text/javascript">
	document.getElementById("newgame").addEventListener("click", function () {
	let dcnt =0;
	for(let i=0; i<(<%=gamelist.size()%>); i++){
		if(document.getElementsByClassName("gameDay")[i].innerText.trim() == '<%=dateset%>'){
			alert("?????? ?????? ???????????????");
			dcnt++;
			break;
		}
	}
	
	if(dcnt == 0){
		var newgame = confirm("??????????????? ????????? ??????????????? ???????????????.\n ???????????? ???????????? ?????? ???????????? ???????????????");
		 if(newgame){
			 location.href = "${pageContext.request.contextPath}/game/newgame";
		 }else{
			 location.reload();
		 } 
	}
	 
	});
	</script>
	
	</div>
</body>
</html>