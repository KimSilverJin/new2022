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
        .sub_menu1 {
		    background-color: #26a653;
		    color: white;
		    border-radius: 10px 10px 0px 0px;
		    font-weight: bold;
		}
        #maincontent{
            width: 100%;
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
       padding: 15px 0px;
       box-sizing: content-box;
   }
       .box_css {
	    height: 30px;
	    border: 1px solid #cfcfcf;
	    background-color: #F5F5F5;
	    color: #8E8E8E;
	    font-weight: bold;
	    text-align: center;
	    cursor: pointer;
	    width: 65px;
		    
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
   .TCRselectMenu{
      width: 10%;
       display: flex;
   }
   .TCRoption {
	display: flex;
    width: 70%;
    align-items: center;
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
        	width : 100%;
		    height: 30px;
		    background-color: #fff;
		    border: 1px solid #e5e5e5;
		    padding-left: 18px;
		    margin-right:10px;
   }

   table {
      border-collapse : collapse;
      
   }
   table thead tr{
        background-color : #D2D79F;
   }
   table tr th {
		    width: 120px;
		    height: 50px;
		    background-color: #e4e4e4;
   }
	table tbody tr {
		border-bottom: 1px dotted #c3c3c3;
	}   
   table tr td {
      height : 40px;
      text-align : center;
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
		    margin-top: 30px;
		    font-weight: bold;
		    color: #525252;	
       }
      
   .TCRbutton{
	    height: 30px;
	    justify-content: center;
	    display: flex;
	    align-items: center;
	    /* width: 68px; */
	    margin-left: 1%;
   }
   
   .TcontentCon{
       display: flex;
       justify-content: center;
       width: 100%;
       flex-direction: column;
    }
    
        .page_btn {
        	color: #525252;
        	margin: 0px 6px 0px 6px;
        	cursor: pointer;
        }
        
        .listnum {
        	margin: 0px 7px 0px 7px;
        	cursor: pointer;
        	color:#525252;
        }    
    /* ?????? */
   
   
    #modal {
            display: none;
            position: absolute;
            top: 30%;
            left: 36%;
            width: 400px;
            height: 305px;
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

        #modal * {
            /* border: 1px solid black; */
        }

        #flist {
            list-style: none;
    		margin: 0;
    		margin-top: 5px;
        }

        #flist>li {
            display: flex;
            align-items: center;
            width: 100%;
            padding-top: 5px;
        }

        #flist>li>p {
            width: 120px;
            font-size: 15px;
            height: 25px;
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
        #btnbox{
        	display: flex;
    		justify-content: center;
    		padding-top: 15px;
        }
        #btnbox * {
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
 <title>??????????????????</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
</head>
<body>
<div id="modalout"></div>
    <div id="modal">
        <h3>??????</h3>
        <form action="${pageContext.request.contextPath}/manager/update" method="post">
        <input type="hidden" name="select" value="rankAdmin">
        <input type="hidden" name="ty" value="add" id="ty">
        <input type="hidden" name="resultCode" value="-1" id="rcode">
            <ul id="flist">
                <li><p>???????????? : </p> <p id="inuserCode"></p></li>
                <li><p>?????? : </p> <p id="inuserName"></p> </li>
                <li><p>?????? : </p> <input type="text" class="inbox" name="userLevel" id="inuserLevel" autocomplete='off'> </li>
                <li><p>?????? : </p> <p id="inscore"></p> </li>
                <li><p>???????????? : </p> <input type="text" class="inbox" name="plus" id="plus" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> </li>
                <li><p>???????????? : </p> <input type="text" class="inbox" name="minus" id="minus" autocomplete='off' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> </li>
                
                
            </ul>
            <div id="btnbox">
            	<button id="addbtn">??????</button>
            	<div id="close">??????</div>
            </div>
            
        </form>
            <!-- <button id="close">??????</button> -->

</div>


<div id="maincontent">
   <div class="TCRcontainer">
       <div class="TCRHcon">
            <div class="TCRselectMenu">
               <select name="Tselect" id="select">
                  <option value="">????????????</option>
                  <option value="userCode">????????????</option>
                  <option value="teamCode">?????????</option>
                  <option value="userName">??????</option>
                  <option value="userGander">??????</option>
                  <option value="userLevel">??????</option>
                  <option value="userScore">??????</option>
               </select>
            </div>
            <div class="TCRoption">
               <div class="TCRsearch">
                  <input type="text" name="Tsearch" id="Tsearch" box_css placeholder="??????????????? ?????? ????????? ???????????????" />
               </div>
               <div class="TCRbutton">
                  <button id="TCRbtn" class="box_css">??????</button>
               </div>
               <div class="TCRbutton">
                  <button class="Tdeletebtn box_css" id="ubtn">??????</button>
               </div>            
            </div>   
         </div>
      
      <div class="TcontentCon">
      <table>
            <thead>
               <tr>
                  <th></th>
                  <th>????????????</th>
                  <th>?????????</th>
                  <th>??????</th>
                  <th>??????</th>
                  <th>??????</th>
                  <th>??????</th>                     
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
		<a id="pre" class="page_btn"> ??? </a>
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
		<a id="next" class="page_btn"> ??? </a>
         </div>
         
         
         <div id="snev" style="display: none;" class="nev">
		<a id="spre" class="page_btn"> ??? </a>
         <%
         if(rankall.size()%15 == 0 ) {
            for(int i=1; i<=rankall.size()/15;i++){
               if(i>15) {
                  %>
                  <a id="num<%=i%>" style="display: none;" class="listnum"> <% out.print(i); %></a>
                  <%
               }else{
                  %>
                  <a id="num<%=i%>" class="listnum"> <% out.print(i); %> </a>
                  <%
               }
            }
         }else if(rankall.size()%15 > 0 ){
            for(int i=1; i<=rankall.size()/15 + 1;i++){
               if(i>15) {
                  %>
                  <a id="num<%=i%>" style="display: none;" class="listnum"> <% out.print(i); %></a>
                  <%
               }else{
                  %>
                  <a id="num<%=i%>" class="listnum"> <% out.print(i); %> </a>
                  <%
               }
            }
            
         }else{
         %>
            <a> 1 </a>
         <%
         }
            
         %>
		<a id="snext" class="page_btn"> ??? </a>
         </div>

    </div>
</div>

<!-- ??????/?????? -->
   <script type="text/javascript">   
   let listselect = 0;
   let end = 0;
   if(<%=rankall.size()%15==0%>){
      end = <%=rankall.size()/15%>;
   }else{
      end = <%=rankall.size()/15%> + 1;
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

<!-- ?????? -->
   <script type="text/javascript">
   document.getElementById("TCRbtn").addEventListener("click",function(){
      let listselect = 0;
      let end = 0;
      if(<%=rankall.size()%15==0%>){
         end = <%=rankall.size()/15%>;
      }else{
         end = <%=rankall.size()/15%> + 1;
      }
      
      /* ?????????????????? */
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
      
      
      /* ?????? ?????? */
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
         
         
         /* ????????? */
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
                  
                  
                  /* ??????????????? */
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
         
         
         /* ????????? */
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
                  
                  
                  /* ??????????????? */
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
         
         
         /* ????????? */
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
                  
                  
                  /* ??????????????? */
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
         
         
         /* ????????? */
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
                  
                  
                  /* ??????????????? */
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
    var input = document.getElementById("Tsearch");
    input.addEventListener("keyup", function (event) {
         if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("TCRbtn").click();
         }
       });
   </script>

<!-- ?????? ????????? -->
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
             alert("?????? ??? ????????? ??????????????????");
          }
          
         

      });
   </script>
   
<!-- ?????? ?????? ?????? -->
    <script type="text/javascript">
    document.getElementById("close").addEventListener("click", function () {
       console.log("??????");
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

<!-- ?????? ?????? -->
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
   
<!-- ?????? ?????? -->
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

<!-- ?????? -->
   <script type="text/javascript">
   document.getElementById("addbtn").addEventListener("click",function(){
      console.log("zmfflr")
      let intext = document.getElementById("inuserLevel").value.trim();
       if(intext.length < 1){
          document.getElementById("inuserLevel").focus();
          alert("????????? ??????????????????");
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