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
	UserVO myvo = (UserVO)session.getAttribute("sessionVO");
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
	
	int pagenum = 0;
	if(session.getAttribute("pagenum") != null){
		pagenum = (Integer)session.getAttribute("pagenum");
	}
	String serch = null;
	if(session.getAttribute("serch") != null){
		serch = (String)session.getAttribute("serch");
	}
	String select = null;
	if(session.getAttribute("select") != null){
		select = (String)session.getAttribute("select");
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
        	text-decoration: none;
        	color:black;
        }

	
	
	/* 모달 */
	
	
	  #modal {
            display: none;
            position: absolute;
            top: 30%;
            left: 36%;
            width: 400px;
            height: 350px;
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
        
        #ui-datepicker-div{
        	background-color: white;
        }
        #flist > li {
        	display: flex;
        	padding-top: 5px;
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
            display: none;
            position: absolute;
            top: 30%;
            left: 36%;
            width: 400px;
            height: 350px;
            background-color: #fff;
            border-radius:25px;
            padding: 20px;
            box-shadow: 5px 5px 10px 10px #ddd;

        }

        #updiv {
            position: absolute;
            width: 1024px;
          	height: 100%;
            background-color: gray;
            display: none;
        }
        #upul{
            list-style: none;
        }
        #upul > li{
            display: flex;
        	padding-top: 5px;
        }
        #upul > li > p{
        	width: 100px;
            padding: 0;
            margin: 0;
        }
        #upul > li > input{
            background: none;
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
        <h3>게임 추가</h3>
        <form method="post" id="newadd" role="form" action="${pageContext.request.contextPath}/manager/sadd">
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
                						<option value="세미프로1">세미프로1</option>
                						<option value="세미프로2">세미프로2</option>
                						<option value="세미프로3">세미프로3</option>
                					</select></li>
                <li><p>경기성별 : </p> <select name="gameGender" id="genderselect">
                						<option value="혼성">혼성</option>
                						<option value="남성">남성</option>
                						<option value="여성">여성</option>
                					</select></li>
                <!-- <li><p>경기형태 : </p> <select id="matchselect">
                						<option value="5vs5">5vs5</option>
                						<option value="6vs6">6vs6</option>
                					</select></li> -->
                <li><p>최소인원 : </p> <input type="text" name="gameMinp" id="minp" class="inbox" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
                <li><p>최대인원 : </p> <input type="text" name="gameMaxp" id="maxp" class="inbox" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
                <li><p>매니저 : </p> <input type="text" name="gameMag" id="mag" class="inbox" autocomplete='off'></li>
                <li><p>참가비 : </p> <input type="text" name="gamePay" id="pay" class="inbox" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
                
            </ul>
            <div id="btnbox2">
            	<button id="addbtn">등록</button>
            	<div id="close">닫기</div>
            </div>
            </form>

    </div>
    
    
<div id="updiv"></div>
    <div id="upmodal">
    <h3>게임 수정</h3>
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
                						<option value="루키1">루키1</option>
                						<option value="루키2">루키2</option>
                						<option value="루키3">루키3</option>
                						<option value="아마추어1">아마추어1</option>
                						<option value="아마추어2">아마추어2</option>
                						<option value="아마추어3">아마추어3</option>
                						<option value="세미프로1">세미프로1</option>
                						<option value="세미프로2">세미프로2</option>
                						<option value="세미프로3">세미프로3</option>
                					</select></li>
                <!-- <li><p>경기형태 : </p><input type="text" name="gameMacth" id="upmatch"></li> -->
                <li><p>마감여부 : </p><input type="text" name="close" id="upclose"></li>
                <li><p>최소인원 : </p><input type="text" name="gameMinp" id="upmin"></li>
                <li><p>최대인원 : </p><input type="text" name="gameMaxp" id="upmax"></li>
                <li><p>신청인원 :</p><input type="text" name="gamePnum" id="upnum" readonly></li>
                <li><p>매니저 : </p><input type="text" name="gameMag" id="upmag"></li>
            </ul>
            <div id="btnbox2">
            	<button id="upsub">등록</button>
            	<div id="upcbtn">닫기</div>
            </div>
        </form>
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
		let cnt=0;
		for(let i=0; i<document.querySelectorAll("#flist li input").length; i++){
			if(document.querySelectorAll("#flist li input")[i].value == ""){
				alert("값을 입력해 주세요");
				document.querySelectorAll("#flist li input")[i].focus();
				cnt++;
				break;
			}
			if( document.getElementById("timeselect").value == "null"){
				alert("값을 입력해 주세요");
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
					<option value="null" id="nullop">카테고리</option>
					<option value="gameCode" id="gameCodeop">경기번호</option>
					<option value="gameDay" id="gameDayop">경기날짜</option>
					<option value="gameTime" id="gameTimeop">경기시간</option>
					<option value="level" id="levelop">경기레벨</option>
					<option value="gameMacth" id="gameMacthop">매치형태</option>
					<option value="mag" id="magop">매니저</option>
				</select>
				<div id="btnbox">
					<button id="newgame" class="box_css">다음달 경기 일괄 생성</button>
					<button id="add" class="box_css">추가</button>
					<button id="del" class="box_css">삭제</button>
					<button id="upd" class="box_css">수정</button>
				</div>
			</div>
			<div id="saerch">
				<input type="text" name="" id="inputbox" placeholder="검색어를 입력하세요">
				<button id="sbtn" class="box_css">검색</button>
			</div>
			<script type="text/javascript">
			
				if('<%=serch%>' != 'null'){
					document.getElementById("inputbox").value = '<%=serch%>';
				}
				if('<%=select%>' != 'null'){
					var ch = '<%=select%>'+"op";
					console.log(ch);
					console.log(document.getElementById(ch));
					document.getElementById(ch).selected="true";
				}
			</script>
		</div>

		<div id="result">
			<div id="upside">
				<div id="sumlist">총 <%=gamelist.size() %>건</div>
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
						
					</tbody>
					
				</table>				
			</div>
			<div></div>
			
		</div>
	
	<!-- 초기 리스트 -->
	<script type="text/javascript">
	let num = 0;
	if('<%=pagenum%>' <= 1){
		num = 0
	}else{
		num = (<%=pagenum%> - 1) * 15;
	}
	
	/* 초기 리스트 */
	window.onload = function(e) {
		/* 초기 리스트 */
		let params = {gameCode : null, gameDay : null, gameTime : null , gameMag : null , level : null, gameMacth : null,num:num};
		let gacd = document.getElementById("inputbox").value;
		if(document.getElementById("select").value == "gameCode"){
			console.log("게임코드");
			 
			params = {gameCode : gacd, gameDay : null, gameTime:null , gameMag : null , level : null, gameMacth : null,num:num};
		}else if(document.getElementById("select").value == "gameDay"){
			params = {gameCode : null, gameDay : gacd, gameTime:null , gameMag : null , level : null, gameMacth : null,num:num};
		}else if(document.getElementById("select").value == "gameTime"){
			params = {gameCode : null, gameDay : null, gameTime: gacd , gameMag : null , level : null, gameMacth : null,num:num};
		}else if(document.getElementById("select").value == "level"){
			params = {gameCode : null, gameDay : null, gameTime : null , gameMag : null , level : gacd, gameMacth : null,num:num};
		}else if(document.getElementById("select").value == "gameMacth"){
			params = {gameCode : null, gameDay : null, gameTime : null , gameMag : null , level : null, gameMacth : gacd, num:num};
		}else if(document.getElementById("select").value == "mag"){
			params = {gameCode : null, gameDay : null, gameTime : null , gameMag : gacd , level : null, gameMacth : null,num:num};
		}
		$.ajax({
		      url:"${pageContext.request.contextPath}/manager/sociallist",
		      type:"POST",
		      contentType:"application/json; charset=utf-8",
		      dataType : "json",
		      data:JSON.stringify(params), 
		      success: function(data) {
		    	  for ( let name in data){
		    		  let ntr =  document.createElement("tr");
		    		  ntr.className = "trbox";
		    		  ntr.id = "tr"+name;
		    		  		    		  
		    		  let tbc =  document.createElement("td");
		    		  let nin = document.createElement("input");
		    		  tbc.append(nin);
		    		  nin.type = "checkbox";
		    		  nin.className="checkbox";
		    		  
		    		  
		    		  ntr.append(tbc);
		    		  
		    		  
		    		  let ngc =  document.createElement("td");
		    		  ngc.className = "gameCode";
		    		  ngc.id = "gc"+name;
		    		  ngc.innerText = data[name].gameCode;
		    		  ntr.append(ngc);
		    		  
		    		  let ngd =  document.createElement("td");
		    		  ngd.className = "gameDay";
		    		  ngd.id = "gd"+name;
		    		  ngd.innerText = data[name].gameDay;
		    		  ntr.append(ngd);
		    		  
		    		  let ngt = document.createElement("td");
		    		  ngt.className = "gameTime";
		    		  ngt.id = "gt"+name;
		    		  ngt.innerText = data[name].gameTime;
		    		  ntr.append(ngt);
		    		  
		    		  let ngl = document.createElement("td");
		    		  ngl.className = "gameLevel";
		    		  ngl.id = "gl"+name;
		    		  ngl.innerText = data[name].level;
		    		  ntr.append(ngl);
		    		  
		    		  let nge = document.createElement("td");
		    		  nge.className = "gameType";
		    		  nge.id = "ge"+name;
		    		  nge.innerText = data[name].gameMacth;
		    		  ntr.append(nge);
		    		  
		    		  let ngo = document.createElement("td");
		    		  ngo.className = "gameClose";
		    		  ngo.id = "go"+name;
		    		  if(data[name].close == "true"){
		    			  ngo.innerText = "신청가능";
		    		  }else{
		    			  ngo.innerText = "마감";
		    		  }
		    		  ntr.append(ngo);
		    		  
		    		  let ngn = document.createElement("td");
		    		  ngn.className = "numMin";
		    		  ngn.id = "gn"+name;
		    		  ngn.innerText = data[name].gameMinp;
		    		  ntr.append(ngn);
		    		  
		    		  let ngx = document.createElement("td");
		    		  ngx.className = "numMax";
		    		  ngx.id = "gx"+name;
		    		  ngx.innerText = data[name].gameMaxp;
		    		  ntr.append(ngx);
		    		  
		    		  let ngp = document.createElement("td");
		    		  ngp.className = "numP";
		    		  ngp.id = "gp"+name;
		    		  ngp.innerText = data[name].gamePnum;
		    		  ntr.append(ngp);
		    		  
		    		  let ngm = document.createElement("td");
		    		  ngm.className = "gameMag";
		    		  ngm.id = "gm"+name;
		    		  ngm.innerText = data[name].gameMag;
		    		  ntr.append(ngm);
		    		  
		    		  let ngy = document.createElement("td");
		    		  ngy.className = "gamePay";
		    		  ngy.id = "gy"+name;
		    		  ngy.innerText = data[name].gamePay;
		    		  ntr.append(ngy);
		    		  		    		  
		    		  document.getElementById("tbody").append(ntr);
		    		  	    		  
		    	  }
		    	  
		      },
		      error: function() {
		          alert("에러 발생");
		      }
		  })
		  
		  /* 초기페이지 */
		  let params2 = {gameCode : null, gameDay : null, gameTime : null , gameMag : null , level : null, gameMacth : null,num:0};
	
		
		if(document.getElementById("select").value == "gameCode"){
			console.log("게임코드");
			 
			params2 = {gameCode : gacd, gameDay : null, gameTime:null , gameMag : null , level : null, gameMacth : null,num:0};
		}else if(document.getElementById("select").value == "gameDay"){
			params2 = {gameCode : null, gameDay : gacd, gameTime:null , gameMag : null , level : null, gameMacth : null,num:0};
		}else if(document.getElementById("select").value == "gameTime"){
			params2 = {gameCode : null, gameDay : null, gameTime: gacd , gameMag : null , level : null, gameMacth : null,num:0};
		}else if(document.getElementById("select").value == "level"){
			params2 = {gameCode : null, gameDay : null, gameTime : null , gameMag : null , level : gacd, gameMacth : null,num:0};
		}else if(document.getElementById("select").value == "gameMacth"){
			params2 = {gameCode : null, gameDay : null, gameTime : null , gameMag : null , level : null, gameMacth : gacd, num:0};
		}else if(document.getElementById("select").value == "mag"){
			params2 = {gameCode : null, gameDay : null, gameTime : null , gameMag : gacd , level : null, gameMacth : null,num:0};
		}
		  var pagenum = 0;
		  let setnum = <%=pagenum%>;
			$.ajax({
		      url:"${pageContext.request.contextPath}/manager/sociallistcnt",
		      type:"POST",
		      contentType:"application/json; charset=utf-8",
		      dataType : "json",
		      data:JSON.stringify(params2), 
		      success: function(data2) {
		    	  let nev =  document.createElement("div");
	    		  nev.id ="nev";
	    		  nev.className="nev";
	    		  
	    		  let pre =  document.createElement("a");
	    		  pre.innerText = " ◀ ";
	    		  pre.id ="pre";
	    		  pre.className="page_btn";
	    		  nev.append(pre);
	    		  console.log(data2);
	    		  var numcnt = data2;
	    		  
	    		 
	    		  if(numcnt / 15 == 0) {
	    			  pagenum = numcnt / 15;
	    		  }else {
	    			  pagenum = Math.floor((numcnt / 15)) + 1;
	    		  }
	    		  
		    	  for(var i=1; i<=pagenum; i++){
		    		  let listnum =  document.createElement("a");
		    		  listnum.innerText = i;
		    		  listnum.href = "${pageContext.request.contextPath}/manager/returnpage?num="+i+"&serch="+document.getElementById("inputbox").value+"&select="+document.getElementById("select").value;
		    		  listnum.id ="listnum"+i;
		    		  listnum.id ="listnum"+i;
		    		  listnum.className="listnum";
		    		  listnum.style.display = "none";
		    		  nev.append(listnum);
		    		  if(<%=pagenum%> == 0){
		    			  if(i==1){
		    				  listnum.style.color="blue";
		    			  }
		    			  if(i<=15){
		    				  listnum.style.display = "";
		    			  }
		    			  
		    		  }
		    		  
		    		  if(<%=pagenum%>+7 >= pagenum){
		    			  console.log("zmek");
		    			  if(i>pagenum-15 && i<=<%=pagenum%>+7){
			    			  listnum.style.display = "";
			    		  }
		    		  }else if(<%=pagenum%>>=8){
		    			  console.log("rlqhs");
		    			  if(i>=<%=pagenum%>-7 && i<=<%=pagenum%>+7){
			    			  listnum.style.display = "";
			    		  }
		    		  }else{
		    			  console.log("dmdpd");
		    			  if(i<=15){
		    				  listnum.style.display = "";
		    			  }
		    		  }
		    		  if(i==<%=pagenum%>){
		    			  listnum.style.color="blue";
		    		  }
		    		  
		    	  }
		    	  
		    	  let next =  document.createElement("a");
		    	  next.innerText =" ▶ "
		    	  next.id ="next";
		    	  next.className="page_btn";
	    		  nev.append(next);
	    		  
	    		  document.getElementById("result").append(nev);
	    		  
	    		  console.log(<%=pagenum%>);
	    		  
	    		  
	    			// 이전 
					$('#pre').on("click", function(){
						console.log("이전");
						 console.log(setnum);
						 console.log(pagenum);
						
						 for(var i=1; i<=pagenum; i++){
							 let listid = "#listnum"+i;
							 $(listid).css('display', 'none');
						 }
						 
						 if(setnum - 15 <=8){
							 console.log("if");
							 console.log(setnum);
							 setnum = 8;
							 for(var i=1; i<=15; i++){
								 console.log(i);
								 let listid = "#listnum"+i;
								 $(listid).css('display', '');
							 }
						 }else{
							 console.log("else");
							 console.log(setnum);
							 setnum = setnum-15;
							 for(var i=setnum-7; i<=setnum+7; i++){
								 console.log(i);
								 let listid = "#listnum"+i;
								 $(listid).css('display', '');
							 }
						 }
						
		        	});
	    		  
	    		  
	    			// 다음 
					$('#next').on("click", function(){
						console.log("다음");
						
						
						 for(var i=1; i<=pagenum; i++){
							 let listid = "#listnum"+i;
							 $(listid).css('display', 'none');							
						 }
						 
						 console.log(setnum);
						 console.log(pagenum);
						 
						 if(setnum+7 >=pagenum){
							 console.log("if");
							 console.log(setnum);
							 setnum = pagenum-7;
							 console.log(setnum);
							 for(var i=setnum-7; i<=pagenum; i++){
								 console.log(i);
								 let listid = "#listnum"+i;
								 $(listid).css('display','');
							 }
						 }else if(setnum == 0){
							 setnum = 23;
							 for(var i=setnum-7; i<=setnum+7; i++){
								 let listid = "#listnum"+i;
								 $(listid).css('display','');
							 }
							 
						 }else{
							 console.log("else");
							 setnum = setnum+15;
							 for(var i=setnum-7; i<=setnum+7; i++){
								 console.log(i);
								 let listid = "#listnum"+i;
								 $(listid).css('display','');
							 }
							 
						 }
		        	});
	    		  
		    	  
		      },
		      error: function() {
		          alert("에러 발생");
		      }
		  })
	}
	</script>
	
	<!-- 검색 -->
	<script type="text/javascript">
	document.getElementById("sbtn").addEventListener("click",function(){
		<%pagenum = 0;%>
		let gacn = document.getElementById("inputbox").value;
		console.log("검색")
		console.log(gacn);
		let params = {gameCode : null, gameDay : null, gameTime : null , gameMag : null , level : null, gameMacth : null,num:num};
		
		if(document.getElementById("select").value == "gameCode"){
			console.log("게임코드");
			params = {gameCode : gacn, gameDay : null, gameTime:null , gameMag : null , level : null, gameMacth : null,num:num};
		}else if(document.getElementById("select").value == "gameDay"){
			params = {gameCode : null, gameDay : gacn, gameTime:null , gameMag : null , level : null, gameMacth : null,num:num};
		}else if(document.getElementById("select").value == "gameTime"){
			params = {gameCode : null, gameDay : null, gameTime: gacn , gameMag : null , level : null, gameMacth : null,num:num};
		}else if(document.getElementById("select").value == "level"){
			params = {gameCode : null, gameDay : null, gameTime : null , gameMag : null , level : gacn, gameMacth : null,num:num};
		}else if(document.getElementById("select").value == "gameMacth"){
			params = {gameCode : null, gameDay : null, gameTime : null , gameMag : null , level : null, gameMacth : gacn, num:num};
		}else if(document.getElementById("select").value == "mag"){
			params = {gameCode : null, gameDay : null, gameTime : null , gameMag : gacn , level : null, gameMacth : null,num:num};
		}
		
		
		
		$.ajax({
		      url:"${pageContext.request.contextPath}/manager/sociallist",
		      type:"POST",
		      contentType:"application/json; charset=utf-8",
		      dataType : "json",
		      data:JSON.stringify(params), 
		      success: function(data) {
		    	  document.getElementById("tbody").innerHTML="";
		    	  for ( let name in data){
		    		  let ntr =  document.createElement("tr");
		    		  ntr.className = "trbox";
		    		  ntr.id = "tr"+name;
		    		  		    		  
		    		  let tbc =  document.createElement("td");
		    		  let nin = document.createElement("input");
		    		  tbc.append(nin);
		    		  nin.type = "checkbox";
		    		  nin.className="checkbox";
		    		  
		    		  
		    		  ntr.append(tbc);
		    		  
		    		  
		    		  let ngc =  document.createElement("td");
		    		  ngc.className = "gameCode";
		    		  ngc.id = "gc"+name;
		    		  ngc.innerText = data[name].gameCode;
		    		  ntr.append(ngc);
		    		  
		    		  let ngd =  document.createElement("td");
		    		  ngd.className = "gameDay";
		    		  ngd.id = "gd"+name;
		    		  ngd.innerText = data[name].gameDay;
		    		  ntr.append(ngd);
		    		  
		    		  let ngt = document.createElement("td");
		    		  ngt.className = "gameTime";
		    		  ngt.id = "gt"+name;
		    		  ngt.innerText = data[name].gameTime;
		    		  ntr.append(ngt);
		    		  
		    		  let ngl = document.createElement("td");
		    		  ngl.className = "gameLevel";
		    		  ngl.id = "gl"+name;
		    		  ngl.innerText = data[name].level;
		    		  ntr.append(ngl);
		    		  
		    		  let nge = document.createElement("td");
		    		  nge.className = "gameType";
		    		  nge.id = "ge"+name;
		    		  nge.innerText = data[name].gameMacth;
		    		  ntr.append(nge);
		    		  
		    		  let ngo = document.createElement("td");
		    		  ngo.className = "gameClose";
		    		  ngo.id = "go"+name;
		    		  if(data[name].close == "true"){
		    			  ngo.innerText = "신청가능";
		    		  }else{
		    			  ngo.innerText = "마감";
		    		  }
		    		  ntr.append(ngo);
		    		  
		    		  let ngn = document.createElement("td");
		    		  ngn.className = "numMin";
		    		  ngn.id = "gn"+name;
		    		  ngn.innerText = data[name].gameMinp;
		    		  ntr.append(ngn);
		    		  
		    		  let ngx = document.createElement("td");
		    		  ngx.className = "numMax";
		    		  ngx.id = "gx"+name;
		    		  ngx.innerText = data[name].gameMaxp;
		    		  ntr.append(ngx);
		    		  
		    		  let ngp = document.createElement("td");
		    		  ngp.className = "numP";
		    		  ngp.id = "gp"+name;
		    		  ngp.innerText = data[name].gamePnum;
		    		  ntr.append(ngp);
		    		  
		    		  let ngm = document.createElement("td");
		    		  ngm.className = "gameMag";
		    		  ngm.id = "gm"+name;
		    		  ngm.innerText = data[name].gameMag;
		    		  ntr.append(ngm);
		    		  
		    		  let ngy = document.createElement("td");
		    		  ngy.className = "gamePay";
		    		  ngy.id = "gy"+name;
		    		  ngy.innerText = data[name].gamePay;
		    		  ntr.append(ngy);
		    		  		    		  
		    		  document.getElementById("tbody").append(ntr);
		    		  	    		  
		    	  }
		    	  
		      },
		      error: function() {
		          alert("에러 발생");
		      }
		  })
		  
		  /* 검색페이지 */
		  var pagenum = 0;
		  let setnum = <%=pagenum%>;
		  
		  let params2 = {gameCode : null, gameDay : null, gameTime : null , gameMag : null , level : null, gameMacth : null,num:0};
			
			if(document.getElementById("select").value == "gameCode"){
				console.log("게임코드");
				 
				params2 = {gameCode : gacn, gameDay : null, gameTime:null , gameMag : null , level : null, gameMacth : null,num:0};
			}else if(document.getElementById("select").value == "gameDay"){
				params2 = {gameCode : null, gameDay : gacn, gameTime:null , gameMag : null , level : null, gameMacth : null,num:0};
			}else if(document.getElementById("select").value == "gameTime"){
				params2 = {gameCode : null, gameDay : null, gameTime: gacn , gameMag : null , level : null, gameMacth : null,num:0};
			}else if(document.getElementById("select").value == "level"){
				params2 = {gameCode : null, gameDay : null, gameTime : null , gameMag : null , level : gacn, gameMacth : null,num:0};
			}else if(document.getElementById("select").value == "gameMacth"){
				params2 = {gameCode : null, gameDay : null, gameTime : null , gameMag : null , level : null, gameMacth : gacn, num:0};
			}else if(document.getElementById("select").value == "mag"){
				params2 = {gameCode : null, gameDay : null, gameTime : null , gameMag : gacn , level : null, gameMacth : null,num:0};
			}
			$.ajax({
		      url:"${pageContext.request.contextPath}/manager/sociallistcnt",
		      type:"POST",
		      contentType:"application/json; charset=utf-8",
		      dataType : "json",
		      data:JSON.stringify(params2), 
		      success: function(data2) {
		    	  document.getElementById("nev").remove();
		    	  let nev =  document.createElement("div");
	    		  nev.id ="nev";
	    		  nev.className="nev";
	    		  
	    		  let pre =  document.createElement("a");
	    		  pre.innerText = " ◀ ";
	    		  pre.id ="pre";
	    		  pre.className="page_btn";
	    		  nev.append(pre);
	    		  console.log(data2);
	    		  var numcnt = data2;
	    		  
	    		 
	    		  if(numcnt / 15 == 0) {
	    			  pagenum = numcnt / 15;
	    		  }else {
	    			  pagenum = Math.floor((numcnt / 15)) + 1;
	    		  }
	    		  
		    	  for(var i=1; i<=pagenum; i++){
		    		  let listnum =  document.createElement("a");
		    		  listnum.innerText = i;
		    		  let sser = document.getElementById("inputbox").value;
		    		  listnum.href = "${pageContext.request.contextPath}/manager/returnpage?num="+i+"&serch="+document.getElementById("inputbox").value+"&select="+document.getElementById("select").value;
		    		  listnum.id ="listnum"+i;
		    		  listnum.className="listnum";
		    		  listnum.style.display = "none";
		    		  nev.append(listnum);
		    		  if(<%=pagenum%> == 0){
		    			  if(i==1){
		    				  listnum.style.color="blue";
		    			  }
		    			  if(i<=15){
		    				  listnum.style.display = "";
		    			  }
		    			  
		    		  }
		    		  
		    		  if(<%=pagenum%>+7 >= pagenum){
		    			  console.log("zmek");
		    			  if(i>pagenum-15 && i<=<%=pagenum%>+7){
			    			  listnum.style.display = "";
			    		  }
		    		  }else if(<%=pagenum%>>=8){
		    			  console.log("rlqhs");
		    			  if(i>=<%=pagenum%>-7 && i<=<%=pagenum%>+7){
			    			  listnum.style.display = "";
			    		  }
		    		  }else{
		    			  console.log("dmdpd");
		    			  if(i<=15){
		    				  listnum.style.display = "";
		    			  }
		    		  }
		    		  if(i==<%=pagenum%>){
		    			  listnum.style.color="blue";
		    		  }
		    		  
		    	  }
		    	  
		    	  let next =  document.createElement("a");
		    	  next.innerText =" ▶ "
		    	  next.id ="next";
		    	  next.className="page_btn";
	    		  nev.append(next);
	    		  
	    		  document.getElementById("result").append(nev);
	    		  
	    		  console.log(<%=pagenum%>);
	    		  
	    		  
	    			// 이전 
					$('#pre').on("click", function(){
						console.log("이전");
						 console.log(setnum);
						 console.log(pagenum);
						
						 for(var i=1; i<=pagenum; i++){
							 let listid = "#listnum"+i;
							 $(listid).css('display', 'none');
						 }
						 
						 if(setnum - 15 <=8){
							 console.log("if");
							 console.log(setnum);
							 setnum = 8;
							 for(var i=1; i<=15; i++){
								 console.log(i);
								 let listid = "#listnum"+i;
								 $(listid).css('display', '');
							 }
						 }else{
							 console.log("else");
							 console.log(setnum);
							 setnum = setnum-15;
							 for(var i=setnum-7; i<=setnum+7; i++){
								 console.log(i);
								 let listid = "#listnum"+i;
								 $(listid).css('display', '');
							 }
						 }
						
		        	});
	    		  
	    		  
	    			// 다음 
					$('#next').on("click", function(){
						console.log("다음");
						
						
						 for(var i=1; i<=pagenum; i++){
							 let listid = "#listnum"+i;
							 $(listid).css('display', 'none');							
						 }
						 
						 console.log(setnum);
						 console.log(pagenum);
						 
						 if(setnum+7 >=pagenum){
							 console.log("if");
							 console.log(setnum);
							 setnum = pagenum-7;
							 console.log(setnum);
							 for(var i=setnum-7; i<=pagenum; i++){
								 console.log(i);
								 let listid = "#listnum"+i;
								 $(listid).css('display','');
							 }
						 }else if(setnum == 0){
							 setnum = 23;
							 for(var i=setnum-7; i<=setnum+7; i++){
								 let listid = "#listnum"+i;
								 $(listid).css('display','');
							 }
							 
						 }else{
							 console.log("else");
							 setnum = setnum+15;
							 for(var i=setnum-7; i<=setnum+7; i++){
								 console.log(i);
								 let listid = "#listnum"+i;
								 $(listid).css('display','');
							 }
							 
						 }
		        	});
	    		  
		    	  
		      },
		      error: function() {
		          alert("에러 발생");
		      }
		  })
	})
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
		 for(let i=0; i< document.getElementsByClassName("checkbox").length; i++){
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
		 for(let i=0; i< document.getElementsByClassName("checkbox").length; i++){
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
			 document.getElementById("upclose").value = document.getElementsByClassName("gameClose")[sgcode].innerText;
			 document.getElementById("upmin").value = document.getElementsByClassName("numMin")[sgcode].innerText;
			 document.getElementById("upmax").value = document.getElementsByClassName("numMax")[sgcode].innerText;
			 document.getElementById("upnum").value = document.getElementsByClassName("numP")[sgcode].innerText;
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
	
	<!-- 일괄 -->
	<script type="text/javascript">
	document.getElementById("newgame").addEventListener("click", function () {
	let dcnt =0;
	for(let i=0; i<(<%=gamelist.size()%>); i++){
		if(document.getElementsByClassName("gameDay")[i].innerText.trim() == '<%=dateset%>' && document.getElementsByClassName("gameMag")[i].innerText.trim() == '<%=myvo.getUserName()%>'){
			alert("이미 등록 하셨습니다");
			dcnt++;
			break;
		}
	}
	
	if(dcnt == 0){
		var newgame = confirm("경기성별과 레벨은 기본값으로 생성됩니다.\n 매니저는 경기장별 대표 매니저로 설정됩니다");
		 if(newgame){
			 location.href = "${pageContext.request.contextPath}/manager/newgame";
		 }else{
			 location.reload();
		 } 
	}
	 
	});
	</script>
	
	</div>
</body>
</html>