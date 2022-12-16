<%@page import="com.sample.vo.UinVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<UinVO> rankall = null;
	if(session.getAttribute("rankall") != null) {
		rankall = (List<UinVO>)session.getAttribute("rankall");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
        #contain * {
            /* border: 1px solid black; */
        }
        .menu1 {
		background-color: #f8ede3;
		}
        #contain{
            display: flex;
            flex-direction: column;
            width: 98%;
            margin: 0 auto;
            height: 98vh;
        }
        #submenu{
            display: flex;
            align-items: center;
            width: 20%;
            min-width: 200px;
            height: 50px;
            list-style: none;
            margin: 0;
            padding:5px 0 0 0;
            text-align: center;
        }
        .menu{
            width: 50%;
            height: 100%;
            min-width: 100px;
            text-decoration: none;
            color: black;
            border: 1px solid black;
            display: flex;
    		align-items: center;
    		justify-content: center;
        }
        #maincontent{
            width: 100%;
            border: 1px solid black;
        }
        
        
        
        	.TCRcontainer{
		margin-top: 1%;
	}
	.TCRHcon{
		display: flex;
	    width: 100%;
	    height: 30px;
	    justify-content: space-between;
	    margin-bottom: 1%;
	    padding: 10px 0px;
    	box-sizing: content-box;
	}
	.TCRselectMenu{
		width: 10%;
	    display: flex;
	}
	.TCRoption {
		display: flex;
		width:70%;
	}
	#Tselect{
		width: 100%;
    	border: 1px solid #000;
	}
	.TCRsearch{
    	width: 100%;
	}
	.TCRsearchArea{
		display: flex;
	    width: 50%;
	}
	#Tsearch{
		width: 100%;
    	height: 30px;
    	border: 1px solid black;
    	padding-left : 15px;
	}

	table {
		border-collapse : collapse;
		
	}
	table tr th {
		width : 120px;
		height : 50px;
		border-bottom : 2px solid #D2D79F;
		background-color : #F8EDE3;
	}
	table tr td {
		height : 40px;
		text-align : center;
		border-bottom : 2px dotted #D2D79F;
	}
	
	table tr th:nth-child(1){
		width:40px;
	}
	table tr th:nth-child(2){
		width:95px;
	}
	table tr th:nth-child(5){
		width:220px;
	}
	
		
	#allCheck{
		width: 20px;
   		height: 30px;
	}
	.chBox{
		width: 20px;
    	height: 30px;
	}
	.nev{
           display: flex;
    		justify-content: center;
    	}
		
	.TCRbutton{
		height: 30px;
	    justify-content: center;
	    display: flex;
	    align-items: center;
	   	width: 125px;
	    margin-left: 1%;
	}
	#TCRbtn{
    	color: black;
    	height: 30px;
	    background-color: #BDD2B6;
	    border: none;
	    border-radius: 10px;
	    width: 100%;
	}
	#TCRbtn:hover{
		cursor : pointer;
		background-color : #42855B;
		font-weight : 700;
		color:white;
	}
	
	.Tdeletebtn{
	    background-color: #BDD2B6;
    	border: 0px;
    	border-radius: 10px;
    	margin-bottom: 1%;
    	width: 100%;
    	height: 100%;
	}
	.Tdeletebtn:hover {
		font-weight : 700;
		background-color : #42855B;
		cursor : pointer;
		color:white;
	}
	.TcontentCon{
	    display: flex;
    	justify-content: center;
    	width: 100%;
    	flex-direction: column;
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
<title>Document</title>
</head>
<body>
<div id="modalout"></div>
    <div id="modal">
        <h3>수정</h3>
        <form action="${pageContext.request.contextPath}/ran/update" method="post">
        <input type="hidden" name="select" value="rankAdmin">
        <input type="hidden" name="ty" value="add" id="ty">
        <input type="hidden" name="resultCode" value="-1" id="rcode">
            <ul id="flist">
                <li><p>유저코드 : </p> <p id="inuserCode"></p></li>
                <li><p>이름 : </p> <p id="inuserName"></p> </li>
                <li><p>레벨 : </p> <input type="text" class="inbox" name="userLevel" id="inuserLevel" autocomplete='off'> </li>
                <li><p>점수 : </p> <p id="inscore"></p> </li>
                <li><p>점수추가 : </p> <input type="text" class="inbox" name="plus" id="plus" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> </li>
                <li><p>점수차감 : </p> <input type="text" class="inbox" name="minus" id="minus" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> </li>
                
                
            </ul>
            <button id="addbtn">등록</button>
        </form>
            <button id="close">닫기</button>

</div>


<div id="maincontent">
	<div class="TCRcontainer">
    	<div class="TCRHcon">
				<div class="TCRselectMenu">
					<select name="Tselect" id="select">
						<option value="">카테고리</option>
						<option value="userCode">유저코드</option>
						<option value="teamCode">팀코드</option>
						<option value="userName">이름</option>
						<option value="userGander">성별</option>
						<option value="userLevel">레벨</option>
						<option value="userScore">점수</option>
					</select>
				</div>
				<div class="TCRoption">
					<div class="TCRsearch">
						<input type="text" name="Tsearch" id="Tsearch" placeholder="카테고리에 맞게 단어를 검색하세요" />
					</div>
					<div class="TCRbutton">
						<button id="TCRbtn">검색</button>
					</div>
					<div class="TCRbutton">
						<button class="Tdeletebtn" id="ubtn">수정</button>
					</div>				
				</div>	
			</div>
		
		<div class="TcontentCon">
		<table>
				<thead>
					<tr>
						<th></th>
						<th>유저코드</th>
						<th>팀코드</th>
						<th>이름</th>
						<th>성별</th>
						<th>레벨</th>
						<th>점수</th>							
					</tr>
				</thead>
				
				<tbody id="tbody">
				<%
					for(int i=0; i<rankall.size(); i++){
						if(i<15){
							%>
							<tr class="ranklist" id="list<%=i%>">
							<td> <input type="checkbox" class="chBox"> </td>
							<td class="userCode"><%out.println(rankall.get(i).getUserCode()); %></td>
							<td class="teamCode"><%out.println(rankall.get(i).getTeamCode()); %></td>
							<td class="userName"><%out.println(rankall.get(i).getUserName()); %></td>
							<td class="userGender"><%out.println(rankall.get(i).getUserGender()); %></td>
							<td class="userLevel"><%out.println(rankall.get(i).getUserLevel()); %></td>
							<td class="userScore"><%out.println(rankall.get(i).getUserScore()); %></td>
							</tr>
							<%
						}else{
							%>
							<tr class="ranklist" id="list<%=i%>" style="display: none;">
							<td> <input type="checkbox" class="chBox"> </td>
							<td class="userCode"><%out.println(rankall.get(i).getUserCode()); %></td>
							<td class="teamCode"><%out.println(rankall.get(i).getTeamCode()); %></td>
							<td class="userName"><%out.println(rankall.get(i).getUserName()); %></td>
							<td class="userGender"><%out.println(rankall.get(i).getUserGender()); %></td>
							<td class="userLevel"><%out.println(rankall.get(i).getUserLevel()); %></td>
							<td class="userScore"><%out.println(rankall.get(i).getUserScore()); %></td>
							</tr>
							<%
						}
					}
				%>
				</tbody>
			</table>
		</div>
		
		<div id="nev"class="nev">
			<a id="pre"> 이전 </a>
			<%
			if(rankall.size()%15 == 0 ) {
				for(int i=1; i<=rankall.size()/15;i++){
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
			}else if(rankall.size()%15 > 0 ){
				for(int i=1; i<=rankall.size()/15 + 1;i++){
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
			<a id="next"> 다음 </a>
			</div>
			
			
			<div id="snev" style="display: none;" class="nev">
			<a id="spre"> 이전 </a>
			<%
			if(rankall.size()%15 == 0 ) {
				for(int i=1; i<=rankall.size()/15;i++){
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
			}else if(rankall.size()%15 > 0 ){
				for(int i=1; i<=rankall.size()/15 + 1;i++){
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
			<a id="snext"> 다음 </a>
			</div>

    </div>
</div>

<!-- 이전/다음 -->
	<script type="text/javascript">	
	let listselect = 0;
	let end = 0;
	if(<%=rankall.size()%15==0%>){
		end = <%=rankall.size()/15%>;
	}else{
		end = <%=rankall.size()/15%> + 1;
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
			
			for(let i=0; i<document.getElementsByClassName("ranklist").length; i++){
				document.getElementsByClassName("ranklist")[i].style.display = "none";
			}
			
			if(num+15 > document.getElementsByClassName("ranklist").length){
				for(let i=num; i<document.getElementsByClassName("ranklist").length; i++){
					document.getElementsByClassName("ranklist")[i].style.display = "";
				}
			}else{
				for(let i=num; i<num+15; i++){
					document.getElementsByClassName("ranklist")[i].style.display = "";
				}
			}
			
			
	    })
	}
	</script>

<!-- 검색 -->
	<script type="text/javascript">
	document.getElementById("TCRbtn").addEventListener("click",function(){
		let listselect = 0;
		let end = 0;
		if(<%=rankall.size()%15==0%>){
			end = <%=rankall.size()/15%>;
		}else{
			end = <%=rankall.size()/15%> + 1;
		}
		
		/* 유저코드검색 */
		if(document.getElementById("select").value == "userCode"){
			document.getElementById("nev").style.display = "none";
			document.getElementById("snev").style.display = "";
			let cnt = 0;
			for(let i=0; i<(<%=rankall.size()%>); i++){
				document.getElementById("tbody").children[i].className = "ranklist";
				var text = document.getElementsByClassName("userCode")[i].innerText;
				if(text.indexOf(document.getElementById("Tsearch").value) != -1) {
					document.getElementById("tbody").children[i].style.display = "";
					document.getElementById("tbody").children[i].className = "ranklist ucgamelist";
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
			for(let i=0; i<(<%=rankall.size()%>); i++){
				document.getElementById("tbody").children[i].className = "ranklist";
				var text = document.getElementsByClassName("teamCode")[i].innerText;
				if(text.indexOf(document.getElementById("Tsearch").value) != -1) {
					document.getElementById("tbody").children[i].style.display = "";
					document.getElementById("tbody").children[i].className = "ranklist tcgamelist";
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
		
		
		/* 이름 검색 */
		if(document.getElementById("select").value == "userName"){
			document.getElementById("nev").style.display = "none";
			document.getElementById("snev").style.display = "";
			let cnt = 0;
			for(let i=0; i<(<%=rankall.size()%>); i++){
				document.getElementById("tbody").children[i].className = "ranklist";
				var text = document.getElementsByClassName("userName")[i].innerText;
				if(text.indexOf(document.getElementById("Tsearch").value) != -1) {
					document.getElementById("tbody").children[i].style.display = "";
					document.getElementById("tbody").children[i].className = "ranklist ungamelist";
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
				document.getElementById("snev").children[i].className = "unlistnum";
				document.getElementById("snev").children[i].style.display = "";
				if(i>15){
					document.getElementById("snev").children[i].style.display = "none";
				}
			}
			
			
			/* 페이징 */
			var senum = 0;
	        var seend = num;
			for(let i=0; i<num;i++){
				document.getElementsByClassName("unlistnum")[i].addEventListener("click",function(){
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
			        	document.getElementsByClassName("ungamelist")[i].style.display = "none";		        	
			        }
			        if(snum + 15 >cnt){
			        	if(cnt-15 >= 0){
			        		for(let i = cnt -15; i<cnt; i++){
				        		document.getElementsByClassName("ungamelist")[i].style.display = "";
				        	}
			        	}else{
			        		for(let i = 0; i<cnt; i++){
				        		document.getElementsByClassName("ungamelist")[i].style.display = "";
				        	}
			        	}
			        	
			        }else{
			        	for(let i = snum; i<snum+15; i++){
			        		document.getElementsByClassName("ungamelist")[i].style.display = "";
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
		
		/* 성별 검색 */
		if(document.getElementById("select").value == "userGander"){
			document.getElementById("nev").style.display = "none";
			document.getElementById("snev").style.display = "";
			let cnt = 0;
			for(let i=0; i<(<%=rankall.size()%>); i++){
				document.getElementById("tbody").children[i].className = "ranklist";
				var text = document.getElementsByClassName("userGander")[i].innerText;
				if(text.indexOf(document.getElementById("Tsearch").value) != -1) {
					document.getElementById("tbody").children[i].style.display = "";
					document.getElementById("tbody").children[i].className = "ranklist uggamelist";
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
				document.getElementById("snev").children[i].className = "uglistnum";
				document.getElementById("snev").children[i].style.display = "";
				if(i>15){
					document.getElementById("snev").children[i].style.display = "none";
				}
			}
			
			
			/* 페이징 */
			var senum = 0;
	        var seend = num;
			for(let i=0; i<num;i++){
				document.getElementsByClassName("uglistnum")[i].addEventListener("click",function(){
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
			        	document.getElementsByClassName("uggamelist")[i].style.display = "none";		        	
			        }
			        if(snum + 15 >cnt){
			        	if(cnt-15 >= 0){
			        		for(let i = cnt -15; i<cnt; i++){
				        		document.getElementsByClassName("uggamelist")[i].style.display = "";
				        	}
			        	}else{
			        		for(let i = 0; i<cnt; i++){
				        		document.getElementsByClassName("uggamelist")[i].style.display = "";
				        	}
			        	}
			        	
			        }else{
			        	for(let i = snum; i<snum+15; i++){
			        		document.getElementsByClassName("uggamelist")[i].style.display = "";
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
		if(document.getElementById("select").value == "userLevel"){
			document.getElementById("nev").style.display = "none";
			document.getElementById("snev").style.display = "";
			let cnt = 0;
			for(let i=0; i<(<%=rankall.size()%>); i++){
				document.getElementById("tbody").children[i].className = "ranklist";
				var text = document.getElementsByClassName("userLevel")[i].innerText;
				if(text.indexOf(document.getElementById("Tsearch").value) != -1) {
					document.getElementById("tbody").children[i].style.display = "";
					document.getElementById("tbody").children[i].className = "ranklist ulgamelist";
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
				document.getElementById("snev").children[i].className = "ullistnum";
				document.getElementById("snev").children[i].style.display = "";
				if(i>15){
					document.getElementById("snev").children[i].style.display = "none";
				}
			}
			
			
			/* 페이징 */
			var senum = 0;
	        var seend = num;
			for(let i=0; i<num;i++){
				document.getElementsByClassName("ullistnum")[i].addEventListener("click",function(){
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
			        	document.getElementsByClassName("ulgamelist")[i].style.display = "none";		        	
			        }
			        if(snum + 15 >cnt){
			        	if(cnt-15 >= 0){
			        		for(let i = cnt -15; i<cnt; i++){
				        		document.getElementsByClassName("ulgamelist")[i].style.display = "";
				        	}
			        	}else{
			        		for(let i = 0; i<cnt; i++){
				        		document.getElementsByClassName("ulgamelist")[i].style.display = "";
				        	}
			        	}
			        	
			        }else{
			        	for(let i = snum; i<snum+15; i++){
			        		document.getElementsByClassName("ulgamelist")[i].style.display = "";
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
		
		/* 점수 검색 */
		if(document.getElementById("select").value == "userScore"){
			document.getElementById("nev").style.display = "none";
			document.getElementById("snev").style.display = "";
			let cnt = 0;
			for(let i=0; i<(<%=rankall.size()%>); i++){
				document.getElementById("tbody").children[i].className = "ranklist";
				var text = document.getElementsByClassName("userScore")[i].innerText;
				if(text.indexOf(document.getElementById("Tsearch").value) != -1) {
					document.getElementById("tbody").children[i].style.display = "";
					document.getElementById("tbody").children[i].className = "ranklist usgamelist";
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
				document.getElementById("snev").children[i].className = "uslistnum";
				document.getElementById("snev").children[i].style.display = "";
				if(i>15){
					document.getElementById("snev").children[i].style.display = "none";
				}
			}
			
			
			/* 페이징 */
			var senum = 0;
	        var seend = num;
			for(let i=0; i<num;i++){
				document.getElementsByClassName("uslistnum")[i].addEventListener("click",function(){
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
			        	document.getElementsByClassName("usgamelist")[i].style.display = "none";		        	
			        }
			        if(snum + 15 >cnt){
			        	if(cnt-15 >= 0){
			        		for(let i = cnt -15; i<cnt; i++){
				        		document.getElementsByClassName("usgamelist")[i].style.display = "";
				        	}
			        	}else{
			        		for(let i = 0; i<cnt; i++){
				        		document.getElementsByClassName("usgamelist")[i].style.display = "";
				        	}
			        	}
			        	
			        }else{
			        	for(let i = snum; i<snum+15; i++){
			        		document.getElementsByClassName("usgamelist")[i].style.display = "";
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
	 var input = document.getElementById("Tsearch");
	 input.addEventListener("keyup", function (event) {
         if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("TCRbtn").click();
         }
       });
	</script>

<!-- 수정 모달창 -->
	<script>
		document.getElementById("ubtn").addEventListener("click", function() {
			let ttcnt=0;
			let index = 0;
			 for(let i=0; i<<%=rankall.size()%>; i++){
				 if(document.getElementsByClassName("chBox")[i].checked == true){
					 ttcnt++;
					 index =i;
					 break;
			 	}
			 }
			 
			 if(ttcnt > 0 ){
				 
				 document.getElementById("inuserCode").innerText = document.getElementsByClassName("userCode")[index].innerText;
				 document.getElementById("inuserName").innerText = document.getElementsByClassName("userName")[index].innerText;
				 document.getElementById("inuserLevel").value = document.getElementsByClassName("userLevel")[index].innerText;
				 document.getElementById("inscore").innerText = document.getElementsByClassName("userScore")[index].innerText;
				 
				document.getElementById("modalout").style.display = "block";
				document.getElementById("modalout").style.opacity = "0.1";
				var modal = document.getElementById("modal");
				modal.style.display = "block";
			 }else{
				 alert("수정 할 유저를 선택해주세요");
			 }
			 
			

		});
	</script>
	
<!-- 추가 모달 닫기 -->
    <script type="text/javascript">
    document.getElementById("close").addEventListener("click", function () {
    	console.log("닫기");
    	for(let i=0; i<document.getElementsByClassName("userCode").length; i++){
         	document.getElementsByClassName("chBox")[i].checked = false;
		 }
    	
		 document.getElementById("inuserCode").innerText = "";
		 document.getElementById("inuserName").innerText = "";
		 document.getElementById("inuserLevel").value = "";
		 document.getElementById("inscore").innerText = "";
		 document.getElementById("plus").value = "";
		 document.getElementById("minus").value = "";
		 
		 document.getElementById("modalout").style.display = "none";
			var modal = document.getElementById("modal");
			modal.style.display = "none";
    });
    </script>

<!-- 추가 입력 -->
	<script type="text/javascript">
	 var ing = document.getElementById("plus");
	 ing.addEventListener("keyup", function (event) {
		 let intext = document.getElementById("plus").value.trim();
		 if(intext.length >= 1){
			 document.getElementById("minus").readOnly = true;
		 }else{
			 document.getElementById("minus").readOnly = false;
		 }
		
       });
	</script>
	
<!-- 차감 입력 -->
	<script type="text/javascript">
	 var ig = document.getElementById("minus");
	 ig.addEventListener("keyup", function (event) {
		 let intext = document.getElementById("minus").value.trim();
		 if(intext.length >= 1){
			 document.getElementById("plus").readOnly = true;
		 }else{
			 document.getElementById("plus").readOnly = false;
		 }
		
       });
	</script>

<!-- 수정 -->
	<script type="text/javascript">
	document.getElementById("addbtn").addEventListener("click",function(){
		console.log("zmfflr")
		let intext = document.getElementById("inuserLevel").value.trim();
		 if(intext.length < 1){
			 document.getElementById("inuserLevel").focus();
			 alert("레벨을 입력해주세요");
			 this.type="button";
		 }else{
			 document.getElementById("ty").value =  document.getElementById("inuserCode").innerText;
			 let intext = document.getElementById("plus").value.trim();
			 if(intext.length < 1){
				 document.getElementById("plus").value ="0";
			 }
			 
			 let intext2 = document.getElementById("minus").value.trim();
			 if(intext2.length < 1){
				 document.getElementById("minus").value ="0";
			 }
			 this.type="submit";
		 }
		
    });
	</script>
</body>
</html>