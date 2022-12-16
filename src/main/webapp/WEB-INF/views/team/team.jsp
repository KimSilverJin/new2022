<%-- <%@page import="javax.websocket.Session"%> --%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%
	LocalDate now = LocalDate.now();
	int year = now.getYear();
	int today = now.getDayOfMonth();
	int month = now.getMonthValue();
	String we = now.getDayOfWeek().toString();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	
	int fday = cal.getMinimum(Calendar.DAY_OF_MONTH);
	int eday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	cal.add(Calendar.DATE, -3); 
	
	List<String> week = new ArrayList<String>();
	week.add(0, "시작");
	week.add(1, "일");
	week.add(2, "월");
	week.add(3, "화");
	week.add(4, "수");
	week.add(5, "목");
	week.add(6, "금");
	week.add(7, "토");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이지풋볼</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
<script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
<style>
       #out{
       	margin: 0 auto;
       	width: 1024px;
       }
       #out * {
            /* margin: 10px; */
        	/* border: 1px solid black; */
            box-sizing: border-box;
        }

        #date {
            display: flex;
            width: 1024px;
            height: 150px;
        }

        #datelist {
            display: flex;
    		width: 100%;
        }

        #datelist button {
            width: 20px;
            background:none;
            border: none;
        }

        #div1{
            width: 980px;
            display: flex;
    		align-items: center;
    		overflow: hidden;
        }

        #day {
            list-style: none;
            margin: 0;
            padding: 0;
            white-space: nowrap;
            transition:all 0.5s;

        }
        #day::-webkit-scrollbar {
            display: none;
        } 
        #day li {
		    display: inline-block;
		    width: 75px;
		    height: 70px;
		    margin: 30px;
		    padding: 0;
		    text-align: center;
		    border-radius: 71px;
		    border: 1px solid #e1e1e1;
		    color: #c7c7c7;
        }
        .idaydiv{
        }
        .idate{
        	padding-top: 12px;
        	font-size: 20px;
        	font-weight: bold;
        }
        /* #day li > div {
        	font-weight: bold;
        } */

        #settingbutton{
		    flex: 1;
		    display: flex;
		    position: relative;
		    height: 40px;
		    margin-top: 20px;
		    font-size: 12px;
		    margin-bottom: 40px;
		    margin-left: 20px;
		    align-items: center;
		    justify-content: space-between;
    	}
    	.option_area {
    		display: flex;
    	}
    	
    	
    	
    	.local{
		    width: 75px;
		    border-radius: 30px;
		    margin-right: 10px;
		    height: 35px;
    	}
    	
    	.closediv{
		    width: 95px;
		    border-radius: 30px;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    border: 1px solid black;
		    margin-right: 10px;
		    height: 35px;
    	}
    	.gender{
		    width: 37px;
		    border-radius: 55px;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    border: 1px solid black;
		    margin-right: 10px;
		    height: 35px;
    	}
    	#level{
    		width: 75px;
		    border-radius: 30px;
		    margin-right: 10px;
		    height: 35px;
    	}
    	option {
    		text-align: center;
    	}
    	#mvar{
		    width: 95px;
		    border-radius: 30px;
		    margin-right: 10px;
		    height: 35px;
    	}
    	.listreset{
			width: 80px;
		    border-radius: 30px;
		    border: 1px solid black;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    height: 35px;
    	}
    	.matchgame{
			display: flex;
		    color: black;
		    text-decoration: none;
		    padding: 10px 0;
		    border-bottom: 1px solid #efefef;
		    height: 70px;
		    align-items: center;
		    justify-content: space-around;
    	}
    	.game_time{
		    font-size: 16px;
		    display: flex;
		    justify-content: center;
		    font-weight: 700;
    	}
    	
    	.gamename {
    		font-size: 16px;
    	}
    	.mid_div{
		    display: flex;
		    align-items: center;
		    justify-content: space-between;
		    width: 700px;
    	}
    	.close{
		    border-radius: 30px;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    background-color: white;
		    border: 1px solid #26A653;
		    width: 85px;
		    height: 40px;
		    font-size: 12px;
		    color: #26A653;
    		
    	}
    	.close > div {
    		font-weight: bold;
    	}
    	.info_div{
		    display: flex;
		    width: 200px;
    		justify-content: space-between;
		    color: #848484;
    	}

    	
    	#dpre, #dnext {
    	    display: flex;
    		justify-content: center;
    		align-items: center;
    	}
    	.select_border {
   			border: 1px solid #A9A9A9;
   			font-size: 12px;
   		}
    	.active {
		   background-color:#26A653;
	   	   color:white;
	       border:1px solid #26A653;
   		}
		.bigger {
			width: 105px;
	        height: 100px;
	        margin: 15px;
		}
		.teamR{
         display: flex;
	   
	    width: 150px;
	    justify-content: end;
	    align-items: center;
	   }
	   .teamR p{
         color : black;
         font-weight : 700;
	   }
     .matchR{
        display: flex;
	    width: 180px;
	    justify-content: end;
	    align-items: center;
     }
     .matchR p{
      color : black;
         font-weight : 700;
     }
     .teamR:hover{
     	cursor:pointer;
     	transition : all 0.2s linear;
     	transform : scale(1.2);
     	
     }
     .teamR p:hover{
     	color : #26A653;
     }
      .matchR:hover{
      	cursor:pointer;
      	transition : all 0.2s linear;
     	transform : scale(1.2);
      }
      .matchR p:hover{
      	color : #26A653;
      }
      .disable{
			pointer-events : none;
		}
		.teamR_area {
			display: flex;
			width: 26%;
			
		}
		
		.p1 {
			margin-right: 10px;
		}
    </style>
</head>
<body>
<div id="out">
<section id="date">
        <div id="datelist">
            <button id="dpre"> <img src="${pageContext.request.contextPath}/image/left_btn.svg"> </button>
                    <div id="div1">
                        <ul id="day">
                            <% for(int i= (today-3) ; i<=(today+27); i++) { 
                            	int tday = cal.get(Calendar.DATE); 
                            	int tdate = cal.get(Calendar.DAY_OF_WEEK);
                            	if(i<today) {%>
                            	<li class="<%=sdf.format(cal.getTime())%> disable" id="<%=tday%>">
                                   	<div class="idate"> <% out.print(week.get(tdate)); %> </div>
                                   	<div class="idaydiv"> <% out.print(tday); %> </div>
                                </li>
                                <%} else{ %>
                                <li class="<%=sdf.format(cal.getTime())%>" id="<%=tday%>">
                                   	<div class="idate"> <% out.print(week.get(tdate)); %> </div>
                                   	<div class="idaydiv"> <% out.print(tday); %> </div>
                                </li>                            		
	                           <%}cal.add(Calendar.DATE, 1); 
	                           } %>
                        </ul>
                    </div>
             <button id="dnext"> <img src="${pageContext.request.contextPath}/image/right_btn.svg"> </button>
        </div>
</section>

<!--날짜 움직이기  -->
<script>
            var set = <%=today%>

            let pscrollleft1 = document.querySelector("#div1 ul").scrollLeft;
            
            document.getElementById("dpre").addEventListener("click", function () {
            	pscrollleft1 = pscrollleft1 - 983;
                if (pscrollleft1 <=0 ) {
               	 document.querySelector("#div1 ul").style.transform = 'translate(' + 0 + 'px)';
               	pscrollleft1 =0;
               } else {
                   document.querySelector("#div1 ul").style.transform = 'translate(' + -(pscrollleft1) + 'px)';
               }

            });

            document.getElementById("dnext").addEventListener("click", function () {
            	pscrollleft1 = pscrollleft1 + 983;
                if (pscrollleft1 >= 2949) {
                	 document.querySelector("#div1 ul").style.transform = 'translate(' + -(3360) + 'px)';
                	 pscrollleft1 = 3360;
                } else {
                    document.querySelector("#div1 ul").style.transform = 'translate(' + -(pscrollleft1) + 'px)';
                }
            });
</script>

<!--처음로딩시  -->
<script type="text/javascript">
	window.onload = function(e) {
		var yeardata = <%=year%>;
        var monthdata = <%=month%>;
        var daydata = <%=today%>;
        
		document.getElementById("<%=today%>").style.backgroundColor="#26A653";
        document.getElementById("<%=today%>").style.color="#fff";
        document.getElementById("<%=today%>").style.border="1px solid #26A653";
        document.getElementById("<%=today%>").style.transform = "scale(1.3)";
        
        
        
        if(<%=today%> < 10){
        	datdata = '0'+<%=today%>;
        }else{
        	datdata = <%=today%>;
        }
        var day = <%=year%> + "-" +<%=month%> +"-" +datdata;
        console.log(<%=today%>);
        console.log(datdata);
        console.log(day);
        dayday = day;
	      
	      let data = {place:"null" ,close:"null",xgender:"null",ygender:"null",day:day};
	      
	      fetch("${pageContext.request.contextPath}/team/tlistall",{
	         method : "POST", // PUT, PATCH, DELETE
	         headers : {
	            "Content-Type" : "application/json"},
	         body : JSON.stringify(data)
	      }).then(response => response.json()) 
	      
	      .then(data => {
	         const result = document.getElementById("result");
	         document.getElementById("result").innerHTML = " ";
	         
	         for ( let name in data) {
	            const div_out = document.createElement("a");
	              div_out.className = "matchgame";
	              div_out.id = data[name].gameCode;
	              div_out.href="${pageContext.request.contextPath}/team/tinfo?num="+data[name].gameCode;
	              
	              
	              let middiv = document.createElement("div");/*가운데  */
	              middiv.className = "mid_div";
	              let infodiv = document.createElement("div"); /*아래  */
	              infodiv.className = "info_div";
	              let tdiv = document.createElement("div");
	              tdiv.className = "game_time";
	              let ndiv = document.createElement("div");
	              ndiv.className = "gamename";
	              let gdiv = document.createElement("div");
	              gdiv.className = "gender_div";
	              let mdiv = document.createElement("div");
	              mdiv.className = "match_div";
	              let ldiv = document.createElement("div");
	              ldiv.className = "level_div";
	              let bdiv  = document.createElement("div");
	              bdiv.className = "close";
	              
	              /* 경기시간 */
	              tdiv.innerText = data[name].gameTime;
	              /* 경기이름 */
	              ndiv.innerText = data[name].fieldName;
	              /* 경기 성별 */
	              gdiv.innerText = data[name].gameGender;
	              /* 경기매치 */
	              mdiv.innerText = data[name].gameMacth;
	              /* 경기레벨 */
	              ldiv.innerText = data[name].level;
	              
	              
	              var pnum = data[name].gamePnum;/*신청인원  */
	              var minp = data[name].gameMinp;/*최소인원  */
	              var maxp = data[name].gameMaxp;/*최대인원  */
	              
	              var textdiv = document.createElement("div");
	              
	              if(data[name].gameMacth == '5vs5'){
	            	  if(pnum == 2){
	            		  textdiv.innerText = " 마감 ";
		            	  bdiv.append(textdiv);
		            	  bdiv.style.border = "0px";
		            	  bdiv.style.color = "#BBBBBB";
	            	  }else{
	            		  textdiv.innerText = " 신청하기 ";
		            	  bdiv.append(textdiv);
		            	  bdiv.style.backgroundColor = "white";
	            	  }
	            	  
	              }else{
	            	  if(pnum == 2){
	            		  textdiv.innerText = " 마감 ";
		            	  bdiv.append(textdiv);
		            	  bdiv.style.border = "0px";
		            	  bdiv.style.color = "#BBBBBB";
		              }else{
		            	  textdiv.innerText = " 신청하기 ";
		            	  bdiv.append(textdiv);
		            	  bdiv.style.backgroundColor = "white";
		              }
	            	  
	              }
	              
	              
	              
	              
	              
	             
	              div_out.append(tdiv);
	              middiv.append(ndiv);
	              infodiv.append(mdiv);
	              infodiv.append(ldiv);
	              infodiv.append(gdiv);
	              middiv.append(infodiv);
	              div_out.append(middiv);
	              div_out.append(bdiv);
	              result.append(div_out);
	         }
	         
	      }).catch(error => {
	         console.log("error");
	      });
	};
</script>

<!--날짜  -->
<script type="text/javascript">
var dayday = null;
var daydata = <%=today%>;
for (var i = 0; i < document.getElementById("day").childElementCount; i++) {
	document.getElementById("day").children[i].addEventListener("click", function (e) {
		let tnum =0;
    	for(var j = 0; j < document.getElementById("day").childElementCount; j++){
    		document.getElementById("day").children[j].style.backgroundColor="#fff";
    		document.getElementById("day").children[j].style.color='#C7C7C7';
    		document.getElementById("day").children[j].style.border="1px solid #A9A9A9";
    		document.getElementById("day").children[j].style.transition = "all 0.2s linear";
            document.getElementById("day").children[j].style.transform = "scale(1.0)";
            if(document.getElementById("day").children[j].id == this.id) {
            	tnum = j;
            }
    	};
    	
    	if(tnum<=3){
    		document.querySelector("#div1 ul").style.transform = 'translate(' + 0 + 'px)';
    		pscrollleft1 = 0;
    		
    	}else {
    		if((tnum-3) *140 >= 3360){
    			document.querySelector("#div1 ul").style.transform = 'translate(' + -3360 + 'px)';
    			pscrollleft1 = 3360;
    			
    		}else{
    			document.querySelector("#div1 ul").style.transform = 'translate(' + -(tnum-3) *140 + 'px)';
    			pscrollleft1 = (tnum-3) *140;
    		}
    	}
    	this.style.backgroundColor="#26A653";
    	this.style.color="#fff";
    	this.style.border="1px solid #26A653";
    	this.style.transition = "all 0.2 linear";
        this.style.transform = "scale(1.3)";

        var day = this.className;
        dayday = day;
        var local = document.getElementById("local").value;
        var clo = document.getElementById("close").checked;
        var xgen = document.getElementById("xgender").checked;
        var ygen = document.getElementById("ygender").checked;
        if(local == "null"){
           local = null;
        }
        var level = document.getElementById("level").value;
        if(level == null){
            level = null;
         }
        var mvar = document.getElementById("mvar").value;
        if(mvar == null){
      	  mvar = null;
         }
        
        
        let data = {place:local, close:clo, xgender:xgen, ygender:ygen, day:day, level:level,mver:mvar};
        
        fetch("${pageContext.request.contextPath}/team/tlist",{
           method : "POST", // PUT, PATCH, DELETE
           headers : {
              "Content-Type" : "application/json"},
           body : JSON.stringify(data)
        }).then(response => response.json()) 
        
        .then(data => {
           const result = document.getElementById("result");
           document.getElementById("result").innerHTML = " ";
           for ( let name in data) {
        	   const div_out = document.createElement("a");
	              div_out.className = "matchgame";
	              div_out.id = data[name].gameCode;
	              div_out.href="${pageContext.request.contextPath}/team/tinfo?num="+data[name].gameCode;
	              
	              let middiv = document.createElement("div");/*가운데  */
	              middiv.className = "mid_div";
	              let infodiv = document.createElement("div"); /*아래  */
	              infodiv.className = "info_div";
	              let tdiv = document.createElement("div");
	              tdiv.className = "game_time";
	              let ndiv = document.createElement("div");
	              ndiv.className = "gamename";
	              let gdiv = document.createElement("div");
	              gdiv.className = "gender_div";
	              let mdiv = document.createElement("div");
	              mdiv.className = "match_div";
	              let ldiv = document.createElement("div");
	              ldiv.className = "level_div";
	              let bdiv  = document.createElement("div");
	              bdiv.className = "close";
	              
	              /* 경기시간 */
	              tdiv.innerText = data[name].gameTime;
	              /* 경기이름 */
	              ndiv.innerText = data[name].fieldName;
	              /* 경기 성별 */
	              gdiv.innerText = data[name].gameGender;
	              /* 경기매치 */
	              mdiv.innerText = data[name].gameMacth;
	              /* 경기레벨 */
	              ldiv.innerText = data[name].level;
	              
	              var pnum = data[name].gamePnum;/*신청인원  */
	              var minp = data[name].gameMinp;/*최소인원  */
	              var maxp = data[name].gameMaxp;/*최대인원  */
	              
	              
				  var textdiv = document.createElement("div");
	              
	              if(data[name].gameMacth == '5vs5'){
	            	  if(pnum == 2){
	            		  textdiv.innerText = " 마감 ";
		            	  bdiv.append(textdiv);
		            	  bdiv.style.border = "0px";
		            	  bdiv.style.color = "#BBBBBB";
	            	  }else{
	            		  textdiv.innerText = " 신청하기 ";
		            	  bdiv.append(textdiv);
		            	  bdiv.style.backgroundColor = "white";
	            	  }
	            	  
	              }else{
	            	  if(pnum == 2){
	            		  textdiv.innerText = " 마감 ";
		            	  bdiv.append(textdiv);
		            	  bdiv.style.border = "0px";
		            	  bdiv.style.color = "#BBBBBB";
		              }else{
		            	  textdiv.innerText = " 신청하기 ";
		            	  bdiv.append(textdiv);
		            	  bdiv.style.backgroundColor = "white";
		              }
	            	  
	              }
	             
	              div_out.append(tdiv);
	              middiv.append(ndiv);
	              infodiv.append(mdiv);
	              infodiv.append(ldiv);
	              infodiv.append(gdiv);
	              middiv.append(infodiv);
	              div_out.append(middiv);
	              div_out.append(bdiv);
	              result.append(div_out);
           }
       		
        }).catch(error => {
           console.log("error");
        });
		
        
       
    });
}
</script>

  
   <div id="settingbutton"> 
   		<div class="option_area">
		   <select name="" id="local" class="select_border local">
		      <option id="null" value="null">지역</option>
		      <option id="서울" value="서울">서울</option>
		      <option id="인천" value="인천">인천</option>
		      <option id="경기" value="경기">경기도</option>
		      <option id="강원" value="강원">강원도</option>
		      <option id="경상" value="경상">경상도</option>
		      <option id="전라" value="전라">전라도</option>
		      <option id="충청" value="충청">충청도</option>
		      <option id="제주" value="제주">제주도</option>
		   </select>
	
		   
		   <select name="" id="mvar" class="select_border mvar">
			   <option id="null" value="null">매치형태</option>
			   <option id="5" value="5vs5">5vs5</option>
			   <option id="6" value="6vs6">6vs6</option>
		   </select>
			
		   <select name="" id="level" class="select_border level">
			   <option id="null" value="null">레벨</option>
			   <option id="Rookie" value="루키">루키</option>
			   <option id="Amateur" value="아마추어">아마추어</option>
			   <option id="Semi_pro" value="프로">세미프로</option>
		   </select>
			
		  <label for="close" id="closediv" class="select_border closediv">마감 가리기</label> <input type="checkbox" name="close" id="close" style="display: none";>
		
		   <label for="ygender" class="select_border gender" id="sla"> 남 </label> <input type="checkbox" name="ygender" id="ygender" style="display: none";> 
		   <label for="xgender" class="select_border gender" id="du"> 여 </label> <input type="checkbox" name="xgender" id="xgender" style="display: none";>
		   
		   <div id="listreset" class="select_border listreset">
		   		RESET
		   </div>
	   </div>
	   <div class="teamR_area">
		   <div class="teamR">
				<span class="p1"><iconify-icon icon="fluent:people-team-add-24-filled" style="color: #26a563;" width="30" height="30"></iconify-icon></span><p>팀 등록</p>
		   </div>
		   <div class="matchR">
				<span class="p1" id="posting"><iconify-icon icon="fluent:pen-24-filled" style="color: #26a563;" width="30" height="30"></iconify-icon></span><p>팀 매치 등록</p>
		   </div>
	   </div>
   
   </div>
   
   <!-- 팀매치 작성 -->
   <script type="text/javascript">
   document.querySelector(".matchR").addEventListener("click",function(){

		$.ajax({
			url : "${pageContext.request.contextPath}/loginPage/logincheck",
			type : "GET",
			contentType:"application/json; charset=utf-8",
			dataType : "json",
			data : JSON.stringify(),
			success : function(data){

				if(data==false){
					Swal.fire({
					   title: '글쓰기를 위해 로그인 해주세요!',
					   text: '로그인 페이지로 이동하시겠습니까?',
					   icon: 'warning',
					   
					   
					   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
					   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
					   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
					   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
					   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
					   
	 					   
					   reverseButtons: false, // 버튼 순서 거꾸로
					   
					}).then(result => {
					   // 만약 Promise리턴을 받으면,
					   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					   
						  location.href="${pageContext.request.contextPath}/loginPage/login";
					   	  	
					   }
					});
				} else {
					
					location.href="${pageContext.request.contextPath}/team/posting";
					
				}
					
			}
		});
	});
   </script>
   
   <!-- 팀등록 -->
   <script type="text/javascript">
        document.querySelector(".teamR").addEventListener("click",function(){

			$.ajax({
	 			url : "${pageContext.request.contextPath}/loginPage/logincheck",
	 			type : "GET",
	 			contentType:"application/json; charset=utf-8",
	 			dataType : "json",
	 			data : JSON.stringify(),
	 			success : function(data){
	 
	 				if(data==false){
	 					Swal.fire({
	 					   title: '팀등록을 위해 로그인 해주세요!',
	 					   text: '로그인 페이지로 이동하시겠습니까?',
	 					   icon: 'warning',
	 					   
	 					   
	 					   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
	 					   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
	 					   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
	 					   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
	 					   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
	 					   
		 					   
	 					   reverseButtons: false, // 버튼 순서 거꾸로
	 					   
	 					}).then(result => {
	 					   // 만약 Promise리턴을 받으면,
	 					   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
	 					   
	 						  location.href="${pageContext.request.contextPath}/loginPage/login";
	 					   	  	
	 					   }
	 					});
	 				} else {
	 					console.log(${userVO.teamCode});
	 					if('${userVO.teamCode}' == 0 ){
	 						
	 						location.href="${pageContext.request.contextPath}/team/register";
	 					}else{
	 						alert("가입한 팀이 있습니다.");
	 						return;
	 					}
	 						
	 				}
				}
	 		});
		});
        </script>

   <div id="result">
    
   </div>
   <!-- 지역 설정  -->
   <script type="text/javascript">
   // 맨 처음 선택된 local 값을 받아옴
   var re = document.getElementById("local").value;
   
   document.getElementById("local").addEventListener("change",function(e){
	   if(document.getElementById("local").value == "null"){
	    	  document.getElementById("local").classList.remove("active");
	      }else{
	    	  document.getElementById("local").classList.add("active"); 
	      }
	   
	   // 마감 여부 선택 돼있는지 체크가 돼있으면 트루 , 아니면 펄스
      var clo = document.getElementById("close").checked;
	   // 남자
      var ygen = document.getElementById("ygender").checked;
	   // 여자
      var xgen = document.getElementById("xgender").checked;
	   // 맨 처음 선택된 애가 null이면  
       if(re == null){
    	   var ac = document.getElementById("local").value;
         
       }else{
          var ac = document.getElementById("local").value;
       }
	   
       var level = document.getElementById("level").value;
       if(level == null){
           level = null;
        }
       var mvar = document.getElementById("mvar").value;
       if(mvar == null){
     	  mvar = null;
        }
      
      
      let data = {place:ac ,close:clo,xgender:xgen,ygender:ygen,day:dayday, level:level,mver:mvar};
      
      fetch("${pageContext.request.contextPath}/team/tlist",{
         method : "POST", // PUT, PATCH, DELETE
         headers : {
            "Content-Type" : "application/json"},
         body : JSON.stringify(data)
      }).then(response => response.json()) 
      
      .then(data => {
         const result = document.getElementById("result");
         document.getElementById("result").innerHTML = " ";
         
         for ( let name in data) {
        	 const div_out = document.createElement("a");
             div_out.className = "matchgame";
             div_out.id = data[name].gameCode;
             div_out.href="${pageContext.request.contextPath}/team/tinfo?num="+data[name].gameCode;
             
             let middiv = document.createElement("div");/*가운데  */
             middiv.className = "mid_div";
             let infodiv = document.createElement("div"); /*아래  */
             infodiv.className = "info_div";
             let tdiv = document.createElement("div");
             tdiv.className = "game_time";
             let ndiv = document.createElement("div");
             ndiv.className = "gamename";
             let gdiv = document.createElement("div");
             gdiv.className = "gender_div";
             let mdiv = document.createElement("div");
             mdiv.className = "match_div";
             let ldiv = document.createElement("div");
             ldiv.className = "level_div";
             let bdiv  = document.createElement("div");
             bdiv.className = "close";
             
             /* 경기시간 */
             tdiv.innerText = data[name].gameTime;
             /* 경기이름 */
             ndiv.innerText = data[name].fieldName;
             /* 경기 성별 */
             gdiv.innerText = data[name].gameGender;
             /* 경기매치 */
             mdiv.innerText = data[name].gameMacth;
             /* 경기레벨 */
             ldiv.innerText = data[name].level;
             
             
             var pnum = data[name].gamePnum;/*신청인원  */
             var minp = data[name].gameMinp;/*최소인원  */
             var maxp = data[name].gameMaxp;/*최대인원  */
             
             
             var textdiv = document.createElement("div");
             
             if(data[name].gameMacth == '5vs5'){
           	  if(pnum == 2){
           		  textdiv.innerText = " 마감 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.border = "0px";
	            	  bdiv.style.color = "#BBBBBB";
           	  }else{
           		  textdiv.innerText = " 신청하기 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.backgroundColor = "white";
           	  }
           	  
             }else{
           	  if(pnum == 2){
           		  textdiv.innerText = " 마감 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.border = "0px";
	            	  bdiv.style.color = "#BBBBBB";
	              }else{
	            	  textdiv.innerText = " 신청하기 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.backgroundColor = "white";
	              }
           	  
             }
            
             div_out.append(tdiv);
             middiv.append(ndiv);
             infodiv.append(mdiv);
             infodiv.append(ldiv);
             infodiv.append(gdiv);
             middiv.append(infodiv);
             div_out.append(middiv);
             div_out.append(bdiv);
             result.append(div_out);
         }
         
      }).catch(error => {
         console.log("error");
      });
   });
   </script>
   <!--마감  -->
   <script type="text/javascript">
   
   var close = document.getElementById("close").checked;
   
   document.getElementById("close").addEventListener("change",function(e){
	   document.getElementById("closediv").classList.toggle("active");
	   
	  
	  var ygen = document.getElementById("ygender").checked;
      var xgen = document.getElementById("xgender").checked;
      var local = document.getElementById("local").value;
      if(local == null){
         local = null;
      }
      var level = document.getElementById("level").value;
      if(level == null){
          level = null;
       }
      var mvar = document.getElementById("mvar").value;
      if(mvar == null){
    	  mvar = null;
       }
      
      var ac = this.checked;
      
      document.getElementById("close").checked = ac;
      
      let data = {place:local ,close:ac,xgender:xgen,ygender:ygen,day:dayday, level:level,mver:mvar};
      
      fetch("${pageContext.request.contextPath}/team/tlist",{
         method : "POST", // PUT, PATCH, DELETE
         headers : {
            "Content-Type" : "application/json"},
         body : JSON.stringify(data)
      }).then(response => response.json()) 
      
      .then(data => {
         const result = document.getElementById("result");
         document.getElementById("result").innerHTML = " ";
         
         for ( let name in data) {
        	 const div_out = document.createElement("a");
             div_out.className = "matchgame";
             div_out.id = data[name].gameCode;
             div_out.href="${pageContext.request.contextPath}/team/tinfo?num="+data[name].gameCode;
             
             let middiv = document.createElement("div");/*가운데  */
             middiv.className = "mid_div";
             let infodiv = document.createElement("div"); /*아래  */
             infodiv.className = "info_div";
             let tdiv = document.createElement("div");
             tdiv.className = "game_time";
             let ndiv = document.createElement("div");
             ndiv.className = "gamename";
             let gdiv = document.createElement("div");
             gdiv.className = "gender_div";
             let mdiv = document.createElement("div");
             mdiv.className = "match_div";
             let ldiv = document.createElement("div");
             ldiv.className = "level_div";
             let bdiv  = document.createElement("div");
             bdiv.className = "close";
             
             /* 경기시간 */
             tdiv.innerText = data[name].gameTime;
             /* 경기이름 */
             ndiv.innerText = data[name].fieldName;
             /* 경기 성별 */
             gdiv.innerText = data[name].gameGender;
             /* 경기매치 */
             mdiv.innerText = data[name].gameMacth;
             /* 경기레벨 */
             ldiv.innerText = data[name].level;
             
             var pnum = data[name].gamePnum;/*신청인원  */
             var minp = data[name].gameMinp;/*최소인원  */
             var maxp = data[name].gameMaxp;/*최대인원  */
             
             var textdiv = document.createElement("div");
             
             if(data[name].gameMacth == '5vs5'){
           	  if(pnum == 2){
           		  textdiv.innerText = " 마감 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.border = "0px";
	            	  bdiv.style.color = "#BBBBBB";
           	  }else{
           		  textdiv.innerText = " 신청하기 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.backgroundColor = "white";
           	  }
           	  
             }else{
           	  if(pnum == 2){
           		  textdiv.innerText = " 마감 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.border = "0px";
	            	  bdiv.style.color = "#BBBBBB";
	              }else{
	            	  textdiv.innerText = " 신청하기 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.backgroundColor = "white";
	              }
           	  
             }
             
            
             div_out.append(tdiv);
             middiv.append(ndiv);
             infodiv.append(mdiv);
             infodiv.append(ldiv);
             infodiv.append(gdiv);
             middiv.append(infodiv);
             div_out.append(middiv);
             div_out.append(bdiv);
             result.append(div_out);
         }
         
      }).catch(error => {
         console.log("error");
      });
      
   });
   </script>
   <!--성별  남-->
   <script type="text/javascript">
   
   var ygen = document.getElementById("ygender").checked;
   
   document.getElementById("ygender").addEventListener("change",function(e){
	  document.getElementById("sla").classList.toggle("active");
	   
	  var local = document.getElementById("local").value;
      var clo = document.getElementById("close").checked;
      var xgen = document.getElementById("xgender").checked;
      if(local == null){
         local = null;
      }
      var level = document.getElementById("level").value;
      if(level == null){
          level = null;
       }
      var mvar = document.getElementById("mvar").value;
      if(mvar == null){
    	  mvar = null;
       }
      
      var ac = this.checked;
      
      document.getElementById("ygender").checked = ac;
      
      let data = {place:local, close:clo, xgender:xgen, ygender:ac, day:dayday, level:level,mver:mvar};
      
      fetch("${pageContext.request.contextPath}/team/tlist",{
         method : "POST", // PUT, PATCH, DELETE
         headers : {
            "Content-Type" : "application/json"},
         body : JSON.stringify(data)
      }).then(response => response.json()) 
      
      .then(data => {
         const result = document.getElementById("result");
         document.getElementById("result").innerHTML = " ";
         
         
         for ( let name in data) {
        	 const div_out = document.createElement("a");
             div_out.className = "matchgame";
             div_out.id = data[name].gameCode;
             div_out.href="${pageContext.request.contextPath}/team/tinfo?num="+data[name].gameCode;
             
             let middiv = document.createElement("div");/*가운데  */
             middiv.className = "mid_div";
             let infodiv = document.createElement("div"); /*아래  */
             infodiv.className = "info_div";
             let tdiv = document.createElement("div");
             tdiv.className = "game_time";
             let ndiv = document.createElement("div");
             ndiv.className = "gamename";
             let gdiv = document.createElement("div");
             gdiv.className = "gender_div";
             let mdiv = document.createElement("div");
             mdiv.className = "match_div";
             let ldiv = document.createElement("div");
             ldiv.className = "level_div";
             let bdiv  = document.createElement("div");
             bdiv.className = "close";
             
             /* 경기시간 */
             tdiv.innerText = data[name].gameTime;
             /* 경기이름 */
             ndiv.innerText = data[name].fieldName;
             /* 경기 성별 */
             gdiv.innerText = data[name].gameGender;
             /* 경기매치 */
             mdiv.innerText = data[name].gameMacth;
             /* 경기레벨 */
             ldiv.innerText = data[name].level;
             
             var pnum = data[name].gamePnum;/*신청인원  */
             var minp = data[name].gameMinp;/*최소인원  */
             var maxp = data[name].gameMaxp;/*최대인원  */
             
             
             var textdiv = document.createElement("div");
             
             if(data[name].gameMacth == '5vs5'){
           	  if(pnum == 2){
           		  textdiv.innerText = " 마감 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.border = "0px";
	            	  bdiv.style.color = "#BBBBBB";
           	  }else{
           		  textdiv.innerText = " 신청하기 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.backgroundColor = "white";
           	  }
           	  
             }else{
           	  if(pnum == 2){
           		  textdiv.innerText = " 마감 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.border = "0px";
	            	  bdiv.style.color = "#BBBBBB";
	              }else{
	            	  textdiv.innerText = " 신청하기 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.backgroundColor = "white";
	              }
           	  
             }
            
             div_out.append(tdiv);
             middiv.append(ndiv);
             infodiv.append(mdiv);
             infodiv.append(ldiv);
             infodiv.append(gdiv);
             middiv.append(infodiv);
             div_out.append(middiv);
             div_out.append(bdiv);
             result.append(div_out);
         }
         
      }).catch(error => {
         console.log("error");
      });
      
      
   });
   </script>
   <!--성별  여-->
   <script type="text/javascript">
   
   var xgen = document.getElementById("xgender").checked;
   
   document.getElementById("xgender").addEventListener("change",function(e){
	  document.getElementById("du").classList.toggle("active");
	  
	  var local = document.getElementById("local").value;
      var clo = document.getElementById("close").checked;
      var ygen = document.getElementById("ygender").checked;
      if(local == null){
         local = null;
      }
      var level = document.getElementById("level").value;
      if(level == null){
          level = null;
       }
      var mvar = document.getElementById("mvar").value;
      if(mvar == null){
    	  mvar = null;
       }
      
      var ac = this.checked;
      
      document.getElementById("xgender").checked = ac;
      
      let data = {place:local, close:clo, xgender:ac, ygender:ygen, day:dayday, level:level,mver:mvar};
      
      fetch("${pageContext.request.contextPath}/team/tlist",{
         method : "POST", // PUT, PATCH, DELETE
         headers : {
            "Content-Type" : "application/json"},
         body : JSON.stringify(data)
      }).then(response => response.json()) 
      
      .then(data => {
         const result = document.getElementById("result");
         document.getElementById("result").innerHTML = " ";
         for ( let name in data) {
        	 const div_out = document.createElement("a");
             div_out.className = "matchgame";
             div_out.id = data[name].gameCode;
             div_out.href="${pageContext.request.contextPath}/team/tinfo?num="+data[name].gameCode;
            
             let middiv = document.createElement("div");/*가운데  */
             middiv.className = "mid_div";
             let infodiv = document.createElement("div"); /*아래  */
             infodiv.className = "info_div";
             let tdiv = document.createElement("div");
             tdiv.className = "game_time";
             let ndiv = document.createElement("div");
             ndiv.className = "gamename";
             let gdiv = document.createElement("div");
             gdiv.className = "gender_div";
             let mdiv = document.createElement("div");
             mdiv.className = "match_div";
             let ldiv = document.createElement("div");
             ldiv.className = "level_div";
             let bdiv  = document.createElement("div");
             bdiv.className = "close";
             
             /* 경기시간 */
             tdiv.innerText = data[name].gameTime;
             /* 경기이름 */
             ndiv.innerText = data[name].fieldName;
             /* 경기 성별 */
             gdiv.innerText = data[name].gameGender;
             /* 경기매치 */
             mdiv.innerText = data[name].gameMacth;
             /* 경기레벨 */
             ldiv.innerText = data[name].level;
            
             var pnum = data[name].gamePnum;/*신청인원  */
             var minp = data[name].gameMinp;/*최소인원  */
             var maxp = data[name].gameMaxp;/*최대인원  */
             
             var textdiv = document.createElement("div");
             
             if(data[name].gameMacth == '5vs5'){
           	  if(pnum == 2){
           		  textdiv.innerText = " 마감 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.border = "0px";
	            	  bdiv.style.color = "#BBBBBB";
           	  }else{
           		  textdiv.innerText = " 신청하기 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.backgroundColor = "white";
           	  }
           	  
             }else{
           	  if(pnum == 2){
           		  textdiv.innerText = " 마감 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.border = "0px";
	            	  bdiv.style.color = "#BBBBBB";
	              }else{
	            	  textdiv.innerText = " 신청하기 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.backgroundColor = "white";
	              }
           	  
             }
            
             div_out.append(tdiv);
             middiv.append(ndiv);
             infodiv.append(mdiv);
             infodiv.append(ldiv);
             infodiv.append(gdiv);
             middiv.append(infodiv);
             div_out.append(middiv);
             div_out.append(bdiv);
             result.append(div_out);
         }
         
      }).catch(error => {
         console.log("error");
      });
      
      
   });
   </script>
   <!--레벨  -->
   <script type="text/javascript">
   var re = document.getElementById("level").value;
   
   document.getElementById("level").addEventListener("change",function(e){
	  var clo = document.getElementById("close").checked;
      var ygen = document.getElementById("ygender").checked;
      var xgen = document.getElementById("xgender").checked;
      var local = document.getElementById("local").value;
      
      if(document.getElementById("level").value == "null"){
    	  document.getElementById("level").classList.remove("active");
      }else{
    	  document.getElementById("level").classList.add("active"); 
      }
      
      if(local == "null"){
          local = null;
       }
      var mvar = document.getElementById("mvar").value;
      if(mvar == null){
    	  mvar = null;
       }
      if(re == null){
    	   var ac = document.getElementById("level").value;
         
       }else{
          var ac = document.getElementById("level").value;
       } 
      
      
      let data = {place:local ,close:clo,xgender:xgen,ygender:ygen,day:dayday,level:ac,mver:mvar};
      
      fetch("${pageContext.request.contextPath}/team/tlist",{
         method : "POST", // PUT, PATCH, DELETE
         headers : {
            "Content-Type" : "application/json"},
         body : JSON.stringify(data)
      }).then(response => response.json()) 
      
      .then(data => {
         const result = document.getElementById("result");
         document.getElementById("result").innerHTML = " ";
         
         for ( let name in data) {
        	 const div_out = document.createElement("a");
             div_out.className = "matchgame";
             div_out.id = data[name].gameCode;
             div_out.href="${pageContext.request.contextPath}/team/tinfo?num="+data[name].gameCode;
             
             let middiv = document.createElement("div");/*가운데  */
             middiv.className = "mid_div";
             let infodiv = document.createElement("div"); /*아래  */
             infodiv.className = "info_div";
             let tdiv = document.createElement("div");
             tdiv.className = "game_time";
             let ndiv = document.createElement("div");
             ndiv.className = "gamename";
             let gdiv = document.createElement("div");
             gdiv.className = "gender_div";
             let mdiv = document.createElement("div");
             mdiv.className = "match_div";
             let ldiv = document.createElement("div");
             ldiv.className = "level_div";
             let bdiv  = document.createElement("div");
             bdiv.className = "close";
             
             /* 경기시간 */
             tdiv.innerText = data[name].gameTime;
             /* 경기이름 */
             ndiv.innerText = data[name].fieldName;
             /* 경기 성별 */
             gdiv.innerText = data[name].gameGender;
             /* 경기매치 */
             mdiv.innerText = data[name].gameMacth;
             /* 경기레벨 */
             ldiv.innerText = data[name].level;
             
             var pnum = data[name].gamePnum;/*신청인원  */
             var minp = data[name].gameMinp;/*최소인원  */
             var maxp = data[name].gameMaxp;/*최대인원  */
             
             var textdiv = document.createElement("div");
             
             if(data[name].gameMacth == '5vs5'){
           	  if(pnum == 2){
           		  textdiv.innerText = " 마감 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.border = "0px";
	            	  bdiv.style.color = "#BBBBBB";
           	  }else{
           		  textdiv.innerText = " 신청하기 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.backgroundColor = "white";
           	  }
           	  
             }else{
           	  if(pnum == 2){
           		  textdiv.innerText = " 마감 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.border = "0px";
	            	  bdiv.style.color = "#BBBBBB";
	              }else{
	            	  textdiv.innerText = " 신청하기 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.backgroundColor = "white";
	              }
           	  
             }
             
             div_out.append(tdiv);
             middiv.append(ndiv);
             infodiv.append(mdiv);
             infodiv.append(ldiv);
             infodiv.append(gdiv);
             middiv.append(infodiv);
             div_out.append(middiv);
             div_out.append(bdiv);
             result.append(div_out);
         }
         
      }).catch(error => {
         console.log("error");
      });
   });
   </script>
   
  <!--매치형태  -->
  <script type="text/javascript">
  var re = document.getElementById("mvar").value;
  
  document.getElementById("mvar").addEventListener("change",function(e){
	 
	  if(document.getElementById("mvar").value == "null"){
    	  document.getElementById("mvar").classList.remove("active");
      }else{
    	  document.getElementById("mvar").classList.add("active"); 
      }
	  
	 var clo = document.getElementById("close").checked;
     var ygen = document.getElementById("ygender").checked;
     var xgen = document.getElementById("xgender").checked;
     var local = document.getElementById("local").value;
     if(local == "null"){
         local = null;
      }
     var level = document.getElementById("level").value;
     if(level == null){
         level = null;
      }
     
      if(re == null){
   	   var ac = document.getElementById("mvar").value;
        
      }else{
         var ac = document.getElementById("mvar").value;
      } 
     
     
     let data = {place:local ,close:clo,xgender:xgen,ygender:ygen,day:dayday,level:level,mver:ac};
     
     fetch("${pageContext.request.contextPath}/team/tlist",{
        method : "POST", // PUT, PATCH, DELETE
        headers : {
           "Content-Type" : "application/json"},
        body : JSON.stringify(data)
     }).then(response => response.json()) 
     
     .then(data => {
        const result = document.getElementById("result");
        document.getElementById("result").innerHTML = " ";
        
        for ( let name in data) {
       	 const div_out = document.createElement("a");
            div_out.className = "matchgame";
            div_out.id = data[name].gameCode;
            div_out.href="${pageContext.request.contextPath}/team/tinfo?num="+data[name].gameCode;
            
            let middiv = document.createElement("div");/*가운데  */
            middiv.className = "mid_div";
            let infodiv = document.createElement("div"); /*아래  */
            infodiv.className = "info_div";
            let tdiv = document.createElement("div");
            tdiv.className = "game_time";
            let ndiv = document.createElement("div");
            ndiv.className = "gamename";
            let gdiv = document.createElement("div");
            gdiv.className = "gender_div";
            let mdiv = document.createElement("div");
            mdiv.className = "match_div";
            let ldiv = document.createElement("div");
            ldiv.className = "level_div";
            let bdiv  = document.createElement("div");
            bdiv.className = "close";
            
            /* 경기시간 */
            tdiv.innerText = data[name].gameTime;
            /* 경기이름 */
            ndiv.innerText = data[name].fieldName;
            /* 경기 성별 */
            gdiv.innerText = data[name].gameGender;
            /* 경기매치 */
            mdiv.innerText = data[name].gameMacth;
            /* 경기레벨 */
            ldiv.innerText = data[name].level;
            
            var pnum = data[name].gamePnum;/*신청인원  */
            var minp = data[name].gameMinp;/*최소인원  */
            var maxp = data[name].gameMaxp;/*최대인원  */
            
            var textdiv = document.createElement("div");
            
            if(data[name].gameMacth == '5vs5'){
          	  if(pnum == 2){
          		  textdiv.innerText = " 마감 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.border = "0px";
	            	  bdiv.style.color = "#BBBBBB";
          	  }else{
          		  textdiv.innerText = " 신청하기 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.backgroundColor = "white";
          	  }
          	  
            }else{
          	  if(pnum == 2){
          		  textdiv.innerText = " 마감 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.border = "0px";
	            	  bdiv.style.color = "#BBBBBB";
	              }else{
	            	  textdiv.innerText = " 신청하기 ";
	            	  bdiv.append(textdiv);
	            	  bdiv.style.backgroundColor = "white";
	              }
          	  
            }
           
           
            div_out.append(tdiv);
            middiv.append(ndiv);
            infodiv.append(mdiv);
            infodiv.append(ldiv);
            infodiv.append(gdiv);
            middiv.append(infodiv);
            div_out.append(middiv);
            div_out.append(bdiv);
            result.append(div_out);
        }
        
     }).catch(error => {
        console.log("error");
     });
  });
  </script>

   <!--초기화  -->
   <script type="text/javascript">
   document.getElementById("listreset").addEventListener("click",function(e){
	      document.getElementById("local").value = null;
	      document.getElementById("close").checked = false;
	      document.getElementById("ygender").checked = false;
	      document.getElementById("xgender").checked = false;
	      document.getElementById("level").value = null;
	      document.getElementById("mvar").value = null;
	      
	      document.getElementById("local").classList.remove("active");
	      document.getElementById("closediv").classList.remove("active");
	      document.getElementById("sla").classList.remove("active");
	      document.getElementById("du").classList.remove("active");
	      document.getElementById("level").classList.remove("active");
	      document.getElementById("mvar").classList.remove("active");
	   
	      let data = {day:dayday};
	      	   
	      
	      fetch("${pageContext.request.contextPath}/team/tlistall",{
	         method : "POST", // PUT, PATCH, DELETE
	         headers : {
	            "Content-Type" : "application/json"},
	         body : JSON.stringify(data)
	      }).then(response => response.json()) 
	      
	      .then(data => {
	         const result = document.getElementById("result");
	         document.getElementById("result").innerHTML = " ";
	         for ( let name in data) {
	        	 const div_out = document.createElement("a");
	             div_out.className = "matchgame";
	             div_out.id = data[name].gameCode;
	             div_out.href="${pageContext.request.contextPath}/team/tinfo?num="+data[name].gameCode;
	            
	             let middiv = document.createElement("div");/*가운데  */
	              middiv.className = "mid_div";
	              let infodiv = document.createElement("div"); /*아래  */
	              infodiv.className = "info_div";
	              let tdiv = document.createElement("div");
	              tdiv.className = "game_time";
	              let ndiv = document.createElement("div");
	              ndiv.className = "gamename";
	              let gdiv = document.createElement("div");
	              gdiv.className = "gender_div";
	              let mdiv = document.createElement("div");
	              mdiv.className = "match_div";
	              let ldiv = document.createElement("div");
	              ldiv.className = "level_div";
	              let bdiv  = document.createElement("div");
	              bdiv.className = "close";
	              
	              /* 경기시간 */
	              tdiv.innerText = data[name].gameTime;
	              /* 경기이름 */
	              ndiv.innerText = data[name].fieldName;
	              /* 경기 성별 */
	              gdiv.innerText = data[name].gameGender;
	              /* 경기매치 */
	              mdiv.innerText = data[name].gameMacth;
	              /* 경기레벨 */
	              ldiv.innerText = data[name].level;
	             
	              var pnum = data[name].gamePnum;/*신청인원  */
	              var minp = data[name].gameMinp;/*최소인원  */
	              var maxp = data[name].gameMaxp;/*최대인원  */
	              
				  var textdiv = document.createElement("div");
	              
	              if(data[name].gameMacth == '5vs5'){
	            	  if(pnum == 2){
	            		  textdiv.innerText = " 마감 ";
		            	  bdiv.append(textdiv);
		            	  bdiv.style.border = "0px";
		            	  bdiv.style.color = "#BBBBBB";
	            	  }else{
	            		  textdiv.innerText = " 신청하기 ";
		            	  bdiv.append(textdiv);
		            	  bdiv.style.backgroundColor = "white";
	            	  }
	            	  
	              }else{
	            	  if(pnum == 2){
	            		  textdiv.innerText = " 마감 ";
		            	  bdiv.append(textdiv);
		            	  bdiv.style.border = "0px";
		            	  bdiv.style.color = "#BBBBBB";
		              }else{
		            	  textdiv.innerText = " 신청하기 ";
		            	  bdiv.append(textdiv);
		            	  bdiv.style.backgroundColor = "white";
		              }
	            	  
	              }
	              
	            
	             div_out.append(tdiv);
	             middiv.append(ndiv);
	             infodiv.append(mdiv);
	             infodiv.append(ldiv);
	             infodiv.append(gdiv);
	             middiv.append(infodiv);
	             div_out.append(middiv);
	             div_out.append(bdiv);
	             result.append(div_out);
	         }
	         
	      }).catch(error => {
	         console.log("error");
	      });
	      
	      
	   });
   </script>
  
  </div>
</body>
</html>