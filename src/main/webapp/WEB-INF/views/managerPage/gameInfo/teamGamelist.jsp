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
			if(allgamelist.get(i).getGameType().equals("T")){
				gamelist.add(allgamelist.get(i));
			}
		}
	}
	
	LocalTime now = LocalTime.now();
	int hour = now.getHour();
	LocalDate nday = LocalDate.now();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/js/jquery-ui.css"/>
<script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery-ui.js"></script>
<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
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
        .sub_menu2 {
		    background-color: #26a653;
		    color: white;
		    border-radius: 10px 10px 0px 0px;
		}
		.sub_menu1 {
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
        
        
        /* 수정 모달 */
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
        <h3>게임 추가</h3>
        <form method="post" id="newadd" role="form" action="${pageContext.request.contextPath}/manager/tadd">
        <input type="hidden" name="select" value="gameAdmin">
            <ul id="flist">
                <li><p>경기장코드 : </p> <input type="text" name="fieldCode" id="infieldCode" class="inbox" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
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
                    
                <li><p>경기날짜 : </p> <input type="text" name="gameDay" id="txtDate" value="" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
                <li><p>경기시간 : </p> <select name="gameTime" id="timeselect">
                						<option value="null">시간을 선택해 주세요</option>
                						<option value="08:00" id="08:00">08:00</option>
                						<option value="10:00" id="10:00">10:00</option>
                						<option value="12:00" id="12:00">12:00</option>
                						<option value="14:00" id="14:00">14:00</option>
                						<option value="16:00" id="16:00">16:00</option>
                						<option value="18:00" id="18:00">18:00</option>
                						<option value="20:00" id="20:00">20:00</option>
                					</select></li>
                <li><p>경기레벨 : </p> <select name="level" id="levelselect">
                						<option value="루키1">루키1</option>
                						<option value="루키2">루키2</option>
                						<option value="루키3">루키3</option>
                						<option value="아마추어1">아마추어1</option>
                						<option value="아마추어2">아마추어2</option>
                						<option value="아마추어3">아마추어3</option>
                						<option value="프로1">세미프로1</option>
                						<option value="프로2">세미프로2</option>
                						<option value="프로3">세미프로3</option>
                					</select></li>
                <li><p>경기성별 : </p> <select name="gameGender" id="genderselect">
                						<option value="혼성">혼성</option>
                						<option value="남성">남성</option>
                						<option value="여성">여성</option>
                					</select></li>
                <li><p>최소팀 : </p> <input type="text" name="gameMinp" id="minp" class="inbox" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
                <li><p>최대팀 : </p> <input type="text" name="gameMaxp" id="maxp" class="inbox" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
                <li><p>매니저 : </p> <input type="text" name="gameMag" id="mag" class="inbox" autocomplete='off'></li>
                <li><p>참가비 : </p> <input type="text" name="gamePay" id="pay" class="inbox" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
                
            </ul>
            <button id="addbtn">등록</button>
            </form>
            <button id="close">닫기</button>

    </div>
    
    
<div id="updiv"></div>
    <div id="upmodal">
        <form method="post" id="newadd" role="form" action="${pageContext.request.contextPath}/manager/gupdate">
            <ul id="upul">
                <li><p>경기번호 : </p><input type="text" name="gameCode" id="upcode" readonly></li>
                <li><p>경기날짜 : </p><input type="text" name="gameDay" id="upday" autocomplete="off"></li>
                <li><p>경기시간 : </p><select name="gameTime" id="uptime">
                						<option value="null">시간을 선택해 주세요</option>
                						<option value="08:00">08:00</option>
                						<option value="10:00">10:00</option>
                						<option value="12:00">12:00</option>
                						<option value="14:00">14:00</option>
                						<option value="16:00">16:00</option>
                						<option value="18:00">18:00</option>
                						<option value="20:00">20:00</option>
                					</select>
                <li><p>경기레벨 : </p><select name="level" id="uplevel">
                						<option value="Rookie1">루키1</option>
                						<option value="Rookie2">루키2</option>
                						<option value="Rookie3">루키3</option>
                						<option value="Amateur1">아마추어1</option>
                						<option value="Amateur2">아마추어2</option>
                						<option value="Amateur3">아마추어3</option>
                						<option value="Semi_pro1">세미프로1</option>
                						<option value="Semi_pro2">세미프로2</option>
                						<option value="Semi_pro3">세미프로3</option>
                					</select></li>
                <!-- <li><p>경기형태 : </p><input type="text" name="gameMacth" id="upmatch"></li> -->
                <li><p>마감여부 : </p><input type="text" name="close" id="upclose"></li>
                <li><p>최소팀 : </p><input type="text" name="gameMinp" id="upmin"></li>
                <li><p>최대팀 : </p><input type="text" name="gameMaxp" id="upmax"></li>
                <li><p>신청팀 :</p><input type="text" name="gamePnum" id="upnum" readonly></li>
                <li><p>매니저 : </p><input type="text" name="gameMag" id="upmag"></li>
            </ul>
            <button id="upsub">수정</button>
        </form>
        <button id="upcbtn">닫기</button>
    </div> 
    
    
    <!-- 필드 코드 숫자 검색 -->
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
    
    
    <!-- 달력 -->
    <script type="text/javascript">
    $.datepicker.setDefaults({
    	  dateFormat: 'yy-mm-dd',
    	  prevText: '이전 달',
    	  nextText: '다음 달',
    	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    	  showMonthAfterYear: true,
    	  yearSuffix: '년'
    	});
    
        $(function() {            
            $('#txtDate').datepicker({ minDate: 0});
        });
      </script>
      
      
    <!-- 달력 -->
    <script type="text/javascript">
    $.datepicker.setDefaults({
    	  dateFormat: 'yy-mm-dd',
    	  prevText: '이전 달',
    	  nextText: '다음 달',
    	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    	  showMonthAfterYear: true,
    	  yearSuffix: '년'
    	});
    
        $(function() {            
            $('#upday').datepicker({ minDate: 0});
        });
      </script>
    
    <!-- 시간 --> 
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

	<!-- 등록 -->
	<script type="text/javascript">
	document.getElementById("addbtn").addEventListener("click",function(){		
		console.log(">>>");
		let cnt=0;
		for(let i=0; i<document.querySelectorAll("#flist li input").length; i++){
			console.log(document.querySelectorAll("#flist li input")[i]);
			if(document.querySelectorAll("#flist li input")[i].value == ""){
				alert("값을 입력해 주세요1");
				document.querySelectorAll("#flist li input")[i].focus();
				console.log(document.querySelectorAll("#flist li input")[i]);
				cnt++;
				break;
			}
			if( document.getElementById("timeselect").value == "null"){
				alert("값을 입력해 주세요2");
				cnt++;
				document.getElementById("timeselect").focus();
				break;
			}
			if(ccnt == 0){
				alert("존재하지 않는 구장입니다");
				break;
			}
		}
		
		let dycnt=0;
		for(let i=0; i< <%=gamelist.size()%>; i++) {
			if(document.getElementsByClassName("fieldcode")[i].innerText.trim() == document.getElementById("infieldCode").value.trim()){
				if(document.getElementsByClassName("gameDay")[i].innerText.trim() == document.getElementById("txtDate").value.trim()){
					if(document.getElementsByClassName("gameTime")[i].innerText.trim() == document.getElementById("timeselect").value.trim()){
						dycnt++;
						alert("해당 시간은 예약이 마감되었습니다");
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
		<div id="searchbox1">
			<div class="searchbox1_area">		
				<select name="" id="select" class="box_css">
					<option value="null">카테고리</option>
					<option value="gameCode">경기번호</option>
					<option value="gameDay">경기날짜</option>
					<option value="gameTime">경기시간</option>
					<option value="level">경기레벨</option>
					<option value="gameMacth">매치형태</option>
					<option value="mag">매니저</option>
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
							<th>경기날짜</th>
							<th>경기시간</th>
							<th>경기레벨</th>
							<th>경기형태</th>
							<th>마감여부</th>
							<th>최소인원</th>
							<th>최대인원</th>
							<th>신청인원</th>
							<th>매니저</th>
							<th>참가비</th>
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
			</div>
			<div id="nev"  class="nev"> 
			<a id="pre" class="page_btn"> ◀ </a>
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
			<a id="next" class="page_btn"> ▶ </a>
			</div>
			
			
			<div id="snev" style="display: none;" class="nev">
			<a id="spre" class="page_btn"> ◀ </a>
			<%
			if(gamelist.size()%15 == 0 ) {
				for(int i=1; i<=gamelist.size()/15;i++){
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
			}else if(gamelist.size()%15 > 0 ){
				for(int i=1; i<=gamelist.size()/15 + 1;i++){
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
		

		
	<!-- 이전/다음 -->
	<script type="text/javascript">	
	let listselect = 0;
	let end = 0;
	if(<%=gamelist.size()%15==0%>){
		end = <%=gamelist.size()/15%>;
	}else{
		end = <%=gamelist.size()/15%> + 1;
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
		for(let i= listselect; i<listselect+15; i++){
			document.getElementsByClassName("listnum")[i].style.display = "";
		}
		
	});
	
	
	/* 다음 버튼 */
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

	<!-- 페이징 버튼 -->
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
			
			
			/* 리스트 변경 */
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
	
	<!-- 검색 -->
	<script type="text/javascript">
	document.getElementById("sbtn").addEventListener("click",function(){
		let listselect = 0;
		let end = 0;
		if(<%=gamelist.size()%15==0%>){
			end = <%=gamelist.size()/15%>;
		}else{
			end = <%=gamelist.size()/15%> + 1;
		}
		
		/* 경기번호 검색 */
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
		
		
		/* 날짜 검색 */
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
			
			
			/* 페이징 */
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
		            
		            
		            /* 리스트변경 */
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
		
		
		
		/* 시간 검색 */
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
			
			/* 페이징 */
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
		            
		            
		            /* 리스트변경 */
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
		
		
		/* 레벨 검색 */
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
			
			
			/* 페이징 */
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
		            
		            
		            /* 리스트변경 */
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
		
		/* 형태 검색 */
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
			
			/* 페이징 */
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
		            
		            
		            /* 리스트변경 */
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
		
		
		/* 매니저 검색 */
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
			
			/* 페이징 */
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
		            
		            
		            /* 리스트변경 */
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
	
	<!-- 추가 모달창 -->
	<script>
        document.getElementById("add").addEventListener("click", function () {
            document.getElementById("modalout").style.display="block";
            document.getElementById("modalout").style.opacity="0.1";
            var modal =  document.getElementById("modal");
            modal.style.display = "block";
           
        });
    </script>
    
    <!-- 모달 닫기 -->
    <script type="text/javascript">
    document.getElementById("close").addEventListener("click", function () {
        document.getElementById("modalout").style.display = "none";
        var modal =  document.getElementById("modal");
        modal.style.display = "none";
    });
    </script>
    
    <!-- 삭제 -->
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
			 alert("삭제할 경기를 선택해주세요");
		 }else{
			 if(ttcnt <1){
				 var del = confirm("정말삭제하시겠습니까?");
				 if(del){
					 location.href = "${pageContext.request.contextPath}/manager/del?"+gclist;
				 }else{
					 location.reload();
				 } 
			 }else if(ttcnt >=1){
				 alert("지난 경기는 삭제할 수 없습니다");
			 }
		 }
		 for(let i=0; i<<%=gamelist.size()%>; i++){
			 document.getElementsByClassName("checkbox")[i].checked = false;
		 }
		 
	 })
	 
	</script>

	
	
	<!-- 수정모달 -->
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
			 alert("한개만 선택 해 주세요");
		 }else if(senum<1){
			 alert("수정 할 게임을 선택해주세요");
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
	
	<!-- 수정모달 닫기 -->
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
	
	
	<!-- 수정 -->
	<script type="text/javascript">
	document.getElementById("upsub").addEventListener("click", function () {
		if(document.getElementById("uptime").value == "null"){
			alert("시간을 선택 해주세요");
			this.type = "button";
		}else{
			this.type = "submit";
		}
		
	})
	</script>
	
	
	<!-- 전체 체크박스 -->
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
	
	
	</div>
</body>
</html>