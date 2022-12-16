<%-- <%@page import="javax.websocket.Session"%> --%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalTime"%>
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
	LocalTime nowTime = LocalTime.now();
	int hour = nowTime.getHour();
	
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
 <title>구장예약</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
<style>
       #out{
       	margin: 0 auto;
       	width: 1024px;
       }
       #out * {
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
		    cursor: pointer;
        }
        .idaydiv{
        }
        .idate{
        	padding-top: 12px;
        	font-size: 20px;
        	font-weight: bold;
        }

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
    	}
    	
    	.local{
    		width: 100px;
    		border-radius: 30px;
    		margin-right: 10px;
    	}
    	
    	.type_input {
    		border-radius: 30px;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    background-color: white;
		    width: 110px;
    		height: 40px;
    	}
    	.size{
    		width: 100px;
    		border-radius: 30px;
    	}
    	option {
    		text-align: center;
    	}
    	.listreset{
    		width: 100px;
    		border-radius: 30px;
    		border: 1px solid black;
    		display: flex;
    		justify-content: center;
    		align-items: center;
    
    		
    	}
    	.matchgame{
			display: flex;
		    color: black;
		    text-decoration: none;
		    padding: 10px 0;
		    border-bottom: 1px solid #efefef;
		    height: 80px;
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
    		font-size: 20px;
    	}
    	.mid_div{
		    display: flex;
		    align-items: center;
		    justify-content: space-between;
		    width: 700px;
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
   			height:100%;
   			margin-right: 10px;
   			cursor: pointer;
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
		
		.rental_area {
          display:flex;
       	}
       	.time {
          display : inline-block;
          width:140px;
          height:50px;
          display: flex;
          justify-content: center;
          align-items: center;
       	}
		
		.rental_span_able {
          background-color: rgb(212 247 225);
		  cursor: pointer;
		  text-decoration: none;
		  color: black;
		  border-radius: 11px;
		  border: 0px !important;
       }
       .rental_span_disable {
          text-decoration: none;
		  color: #A9A9A9;
		  border-radius: 11px;
		  border: 0px !important;
       }
       
		#result {
			display: flex;
	    	flex-direction: column;
		}
		.result_content {
			display: flex;
		    color: black;
		    text-decoration: none;
		    padding: 25px 20px;
		    border-bottom: 1px solid #efefef;
		    justify-content: space-around;
		    flex-direction: column;
		}
		.title_area {
	
		    display: flex;
		    justify-content: space-between;
		    flex-direction: column;
		}
		
	
		.size_span {
			font-size:13px;
			margin-bottom: 20px;
	    	display: flex;
		}
		
		.field_title {
			margin-bottom: 10px;
	    	display: flex;
	    	cursor: pointer;
		}
		
		input:focus, select:focus, option:focus, textarea:focus, button:focus{
		outline: none;
		}
		
	 	.disable{
			pointer-events : none;
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


<!--날짜데이터 삽입  -->
<script>
            var set = <%=today%>

            document.querySelector("#div1 ul").scrollLeft = 0;
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
   <div id="result">
   		<div class="result_content">
   		<div class="title_area"><h3 class="field_title">${field.fieldName}</h3><span class="size_span">크기 ${field.fieldType}</span></div>
   			<div class="rental_area">
	   			<a class="time rental_span_able">8:00 - 10:00</a>
	   			<a class="time rental_span_able">10:00 - 12:00</a>
	   			<a class="time rental_span_able">12:00 - 14:00</a>
	   			<a class="time rental_span_able">14:00 - 16:00</a>
	   			<a class="time rental_span_able">16:00 - 18:00</a>
	   			<a class="time rental_span_able">18:00 - 20:00</a>
	   			<a class="time rental_span_able">20:00 - 22:00</a>
	   			<a class="time rental_span_able">22:00 - 24:00</a>
   			</div>
   		</div>
   </div>
   
<script type="text/javascript">
<!--  처음 로딩시  -->
	window.onload = function() {
		document.getElementById("<%=today%>").style.backgroundColor="#26A653";
        document.getElementById("<%=today%>").style.color="#fff";
        document.getElementById("<%=today%>").style.border="1px solid #26A653";
        document.getElementById("<%=today%>").style.transform = "scale(1.3)";
		var date = 0;
        if(<%=today%> < 10){
        	// 값 비교를 위한 문자처리
        	date = "0"+<%=today%>;
        }else {
        	date = <%=today%>;
        }
        
		var day = <%=year%> + "-" +<%=month%> +"-" +date;
		today = day;

		let fieldCode = ${field.fieldCode};
        let data = {day:day,code:fieldCode};
        
        
         
         fetch("${pageContext.request.contextPath}/rental/rvListSelect",{
            method : "POST",
            headers : {
               "Content-Type" : "application/json"},
            body : JSON.stringify(data)
         }).then(response => response.json())
         .then(list => {
        	if(list.length > 0){
	            const result = document.getElementById("result");
	               result.innerHTML = " ";
	            
	            for (let data of list) {
		            const content_area = document.createElement("div"); // 가장 바깥
		            content_area.className = "result_content";
		            const title_div = document.createElement("div"); // 구장명 표기
		            title_div.className = "title_area";
		            const h3 = document.createElement("h3");
		            h3.className = "field_title";
		            h3.addEventListener("click",function() {
		            	location.href = "${pageContext.request.contextPath}/rental/rentalDetail?fieldCode="+data.fieldCode;
		            });
		            const match_type = document.createElement("span");
		            match_type.className = "size_span";
		            h3.innerHTML = data.fieldName;
		            match_type.innerHTML = "크기 "+data.gameMacth;
		            
		            title_div.append(h3);
		            title_div.append(match_type);
		            content_area.append(title_div);
		            result.append(content_area);
		
		            const rental_area = document.createElement("div");
		            rental_area.className = "rental_area";
				
					// 전체배열
					var timeset = ["08","10","12","14","16","18","20","22"];
					// db에서 불러온 배열
					var game_time = (data.gameTime).split(',');
	
					for(let i=0; i<timeset.length; i++){
						// true 혹은 false 반환
						let rental_div = document.createElement("a");
						let time = parseInt(timeset[i]);
	
						if(game_time.includes(timeset[i]) || timeset[i] <= '<%=hour%>' ){
	
							rental_div.className = "time rental_span_disable";
							rental_div.innerHTML = time+":00 - "+(time+2)+":00";
						}else{
							rental_div.className = "time rental_span_able";
	
							rental_div.href = "${pageContext.request.contextPath}/rental/paymentInter?pageurl=redirect:/rental/rentalPayment&fieldCode="+data.fieldCode+"&gameDay="+day+"&gameTime="+time;
							rental_div.innerHTML = time+":00 - "+(time+2)+":00";
						}
						rental_area.append(rental_div);
					}
	            	content_area.append(rental_area);
	            }
	        }
        		
        		
         }).catch(error => {
            console.log("무슨에러냐면! : " + error);
         });
   };
   
   <!-- 날짜 -->
   let today = null;
   let day_div = document.getElementById("day");
   let div1_ul = document.querySelector("#div1 ul");
   for (var i = 0; i < day_div.childElementCount; i++) {
	   day_div.children[i].addEventListener("click", function (e) {
			
        	 	let tnum = 0;
        	 	// 초기화 시키는 로직
        		for(var j = 0; j < document.getElementById("day").childElementCount; j++){
        			day_div.children[j].style.backgroundColor="#fff";
        			day_div.children[j].style.color='#C7C7C7';
        			day_div.children[j].style.border="1px solid #A9A9A9";
        			day_div.children[j].style.transition = "all 0.2s linear";
        			day_div.children[j].style.transform = "scale(1.0)";
                    if(day_div.children[j].id == this.id) {
                    	tnum = j;
                    }
        		};
        		
            	if(tnum<=3){
            		div1_ul.style.transform = 'translate(' + 0 + 'px)';
            		pscrollleft1 = 0;
            		
            	}else {
            		if((tnum-3) *140 >= 3360){
            			div1_ul.style.transform = 'translate(' + -3360 + 'px)';
            			pscrollleft1 = 3360;
            			
            		}else{
            			div1_ul.style.transform = 'translate(' + -(tnum-3) *140 + 'px)';
            			pscrollleft1 = (tnum-3) *140;
            		}
            	}
        // 선택한 날짜 css 바꿔줌
    	this.style.backgroundColor="#26A653";
    	this.style.color="#fff";
    	this.style.border="1px solid #26A653";
    	this.style.transition = "all 0.2 linear";
        this.style.transform = "scale(1.3)";
      

       
       var day = this.className;
       today = day;
       
	   let fieldCode = ${field.fieldCode};
       let data = {day:day,code:fieldCode};
       
       fetch("${pageContext.request.contextPath}/rental/rvListSelect",{
          method : "POST", // PUT, PATCH, DELETE
          headers : {
             "Content-Type" : "application/json"},
          body : JSON.stringify(data)
       }).then(response => response.json())
       .then(list => {
    	   
       	if(list.length > 0){
	           const result = document.getElementById("result");
	           result.innerHTML = " ";
	        
	           for (let data of list) {
		            const content_area = document.createElement("div"); // 가장 바깥
		            content_area.className = "result_content";
		            const title_div = document.createElement("div"); // 구장명 표기
		            title_div.className = "title_area";
		            const h3 = document.createElement("h3");
		            h3.className = "field_title";
		            h3.addEventListener("click",function() {
		            	location.href = "${pageContext.request.contextPath}/rental/rentalDetail?fieldCode="+data.fieldCode;
		            });
		            const match_type = document.createElement("span");
		            match_type.className = "size_span";
		            h3.innerHTML = data.fieldName;
		            match_type.innerHTML = "크기 "+data.gameMacth;
		            
		            title_div.append(h3);
		            title_div.append(match_type);
		            content_area.append(title_div);
		            result.append(content_area);
		
		            const rental_area = document.createElement("div");
		            rental_area.className = "rental_area";
				
					// 전체배열
					var timeset = ["08","10","12","14","16","18","20","22"];
					// db에서 불러온 배열
					var game_time = (data.gameTime).split(',');
	
					for(let i=0; i<timeset.length; i++){
						// true 혹은 false 반환
						let rental_div = document.createElement("a");
						let time = parseInt(timeset[i]);
	
						if(game_time.includes(timeset[i])){
							rental_div.className = "time rental_span_disable";
							rental_div.innerHTML = parseInt(timeset[i])+":00 - "+(parseInt(timeset[i])+2)+":00"; 
						}else{
							rental_div.className = "time rental_span_able";
							rental_div.href = "${pageContext.request.contextPath}/rental/paymentInter?pageurl=redirect:/rental/rentalPayment&fieldCode="+data.fieldCode+"&gameDay="+day+"&gameTime="+time;
							rental_div.innerHTML = parseInt(timeset[i])+":00 - "+(parseInt(timeset[i])+2)+":00"; 
						}
						
						if(this.id == <%=today%>){
							if(timeset[i] <= '<%=hour%>'){
								rental_div.className = "time rental_span_disable";
							}
						}
						rental_area.append(rental_div);
					}
	        	content_area.append(rental_area);
	        }
       	}
     }).catch(error => {
        console.log("무슨에러냐면! : " + error);
     });
      
       
      
   });
      
   };

   
   </script>
  
  
  
  

  </div>
</body>
</html>