<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
<meta charset="EUC-KR">

 <style>
        #out {
       	 	padding-top: 20px;
            margin: 0 auto;
            width: 100%;
        }
        #out *{
            /* border: 1px solid black; */
        }
        .rankdiv{
            display: flex;
            align-items: center;
            height: 100px;
    		width: 89%;
    		margin: 0 auto;
    		margin-bottom: 20px;
            padding: 20px 20px;
            border: 3px solid #00000014;
            border-radius: 25px;
        }
        .rankdiv > div {
            height: 70px;
           
        }
        .numdiv{
            width: 10%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 21px;
            
        }
        .numdiv > div{
            padding: 0px 6px;
            /* border-bottom: 4px solid #798777; */
        }
        .innerdiv{
       		width:90%;
            display: flex;
            justify-content: space-around;
        }
        .innerdiv > div {
        }
        .namediv{
            width: 150px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 15px;
        }
        .scorediv{
            width: 150px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 15px;
        }
        .windiv{
        	width: 150px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 15px;
        }
        .losediv{
        	width: 150px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 15px;
        }
        .lediv{
        	width: 150px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 15px;
            padding-right: 20px;
        }
        .rank_num {
        	width:50px;
        	height: 50px;
        
        }

    </style>
</head>
<body>
<div id="out">
<%int num=1; %>
	<c:forEach var="rank" items="${rank}" > 
		<div id="rank<%=num%>" class="rankdiv">
			<div class="numdiv"><div class="rank_num_div"><%=num%></div></div>
			<div class="innerdiv">
				<div class="namediv">${rank.userName}</div>
				<div class="scorediv">${rank.userScore} 점</div>
				<div class="windiv">승</div>
				<div class="losediv">패</div>
				<div class="lediv" id="${rank.userCode}"></div>
				<div class="ucdiv" style="display: none;">${rank.userCode}</div>
			</div>
			<%num++; %>
		</div>
 	</c:forEach>
 	
 	<!-- 레벨 가져오기 -->
 	<script type="text/javascript">
 	window.onload = function(e) {
		for(let i=0; i< <%=num%>-1; i++) {
			var userCode = document.getElementsByClassName("ucdiv")[i].innerText;
			console.log(userCode);
			var data = {userCode:userCode};
			let icon = document.getElementsByClassName("licon")[i];
			fetch("${pageContext.request.contextPath}/rank/selevel",{
		         method : "POST", // PUT, PATCH, DELETE
		         headers : {
		            "Content-Type" : "application/json"},
		         body : JSON.stringify(data)
		      }).then(response => response.json()) 
		      
		      .then(data => {
		    	  let level = data.userLevel
		    	  let lv = level.substring(0,level.length-1);
		    	  
		    	  //document.getElementsByClassName("lediv")[i].innerText = data.userLevel;
		    	  if(lv == '프로'){
		    		  document.getElementsByClassName("lediv")[i].innerHTML = "<img src='${pageContext.request.contextPath}/image/rank-p.png' width='30' height='30'>" +　data.userLevel;
		    	  }else if (lv == '아마추어') {
		    		  document.getElementsByClassName("lediv")[i].innerHTML = "<img src='${pageContext.request.contextPath}/image/rank-a.png' width='30' height='30'>" +　data.userLevel;
		    	  }else if(lv == '루키'){
		    		  document.getElementsByClassName("lediv")[i].innerHTML = "<img src='${pageContext.request.contextPath}/image/rank-r.png' width='30' height='30'>" +　data.userLevel;
		    	  }else{
		    		  document.getElementsByClassName("lediv")[i].innerHTML = "<iconify-icon icon='emojione-monotone:letter-n' style='color: #26a653;' width='30' height='30'></iconify-icon>　";
		    	  }
		         
		      }).catch(error => {
		         console.log("error");
		      });
		}
		
		
		/* 승 가져오기 */
		for(let i=0; i< <%=num%>-1; i++) {
			var userCode = document.getElementsByClassName("ucdiv")[i].innerText;
			console.log(userCode);
			var data = {userCode:userCode};
			fetch("${pageContext.request.contextPath}/rank/result",{
		         method : "POST", // PUT, PATCH, DELETE
		         headers : {
		            "Content-Type" : "application/json"},
		         body : JSON.stringify(data)
		      }).then(response => response.json()) 
		      
		      .then(data => {
		    	  document.getElementsByClassName("windiv")[i].innerText = data + "승";
		         
		      }).catch(error => {
		         console.log("error");
		      });
		}
		
		/* 패 가져오기 */
		for(let i=0; i< <%=num%>-1; i++) {
			var userCode = document.getElementsByClassName("ucdiv")[i].innerText;
			console.log(userCode);
			var data = {userCode:userCode};
			fetch("${pageContext.request.contextPath}/rank/lose",{
		         method : "POST", // PUT, PATCH, DELETE
		         headers : {
		            "Content-Type" : "application/json"},
		         body : JSON.stringify(data)
		      }).then(response => response.json()) 
		      
		      .then(data => {
		    	  document.getElementsByClassName("losediv")[i].innerText = data + "패";
		         
		      }).catch(error => {
		         console.log("error");
		      });
		}
	}
				
	</script>
		
	<!-- 1위 테두리 변경 -->
	<script type="text/javascript">
		document.getElementById("rank1").style.backgroundColor = "rgba(253, 242, 204, 0.66)";
		document.getElementById("rank1").style.borderColor = "rgb(249 234 182)";
		document.getElementById("rank1").style.height = "170px";
		document.getElementById("rank1").style.width = "99%";
		var imgTag = document.createElement("img");
		imgTag.src = "${pageContext.request.contextPath}/image/medal1.png";
		var div = document.getElementsByClassName("rank_num_div")[0];
		div.innerText ="";
		imgTag.style.width = "50px";
		imgTag.style.height = "50px";
		div.append(imgTag);
		document.getElementsByClassName("numdiv")[0].style.fontSize = "30px";
		document.getElementsByClassName("numdiv")[0].style.fontWeight = "600";
		document.getElementsByClassName("namediv")[0].style.fontSize = "23px";
		document.getElementsByClassName("scorediv")[0].style.fontSize = "23px";
		document.getElementsByClassName("windiv")[0].style.fontSize = "23px";
		document.getElementsByClassName("losediv")[0].style.fontSize = "23px";
		document.getElementsByClassName("lediv")[0].style.fontSize = "19px";
		document.getElementsByClassName("lediv")[0].style.padding = "10px";
	</script>
	
	<!-- 2위 테두리 변경 -->
	<script type="text/javascript">
		document.getElementById("rank2").style.backgroundColor = "rgba(233, 233, 233, 0.58)";
		document.getElementById("rank2").style.borderColor = "rgb(233 233 233)";
		document.getElementById("rank2").style.height = "150px";
		document.getElementById("rank2").style.width = "95%";
		var imgTag = document.createElement("img");
		imgTag.src = "${pageContext.request.contextPath}/image/medal2.png";
		var div = document.getElementsByClassName("rank_num_div")[1];
		div.innerText ="";
		imgTag.style.width = "46px";
		imgTag.style.height = "46px";
		div.append(imgTag);
		document.getElementsByClassName("numdiv")[1].style.fontSize = "28px";
		document.getElementsByClassName("numdiv")[1].style.fontWeight = "400";
		document.getElementsByClassName("namediv")[1].style.fontSize = "18px";
		document.getElementsByClassName("scorediv")[1].style.fontSize = "18px";
		document.getElementsByClassName("windiv")[1].style.fontSize = "18px";
		document.getElementsByClassName("losediv")[1].style.fontSize = "18px";
		document.getElementsByClassName("lediv")[1].style.fontSize = "16px";
		
	</script>
	
	<!-- 3위 테두리 변경 -->
	<script type="text/javascript">
		document.getElementById("rank3").style.backgroundColor = "rgba(150, 99, 53, 0.39)";
		document.getElementById("rank3").style.borderColor = "rgb(169 86 8 / 14%)";
		document.getElementById("rank3").style.height = "100px";
		document.getElementById("rank3").style.width = "91%";
		var imgTag = document.createElement("img");
		imgTag.src = "${pageContext.request.contextPath}/image/medal3.png";
		var div = document.getElementsByClassName("rank_num_div")[2];
		div.innerText ="";
		imgTag.style.width = "43px";
		imgTag.style.height = "43px";
		div.append(imgTag);
	</script>

</div>
</body>
</html>