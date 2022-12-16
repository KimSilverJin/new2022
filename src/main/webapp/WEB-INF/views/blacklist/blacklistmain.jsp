<%@page import="com.sample.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%
	request.setCharacterEncoding("utf-8");
	
	String authority = null;
	if(session.getAttribute("sessionVO") != null) {
		UserVO uvo = (UserVO)session.getAttribute("sessionVO");
		authority = uvo.getUserAuthority();
		
	}else {
		authority = "일반회원";
		
	}
	String alert = request.getParameter("alert");
	System.out.println(alert);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이지풋볼</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/ez_icon.svg">
<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
<script src="https://kit.fontawesome.com/3a7191171a.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
    * {
        box-sizing: border-box;
        margin: 0px;
      
    }
    .head{
    display: flex;
    justify-content: center;
    flex-direction: column;
    margin-bottom: 5%;
    padding-left: 8%;
    }
    
    h1{
    font-family: 'Gowun Dodum', sans-serif
    }
    
    h2{
    font-family: 'Gowun Dodum', sans-serif
    }
    
    #div1 {
	margin: 0 auto;
	width: 50%;
	margin-top: 5%;
	
}


.sideicon:hover{
	 cursor: pointer;
}

th,td{
font-family: 'Gowun Dodum', sans-serif;
}

td{
	
	height : 90px;
}

.sideicon{
  		    display: flex;
    /* position: fixed; */
    right: 100px;
  width: 160px;
    /* height: 120px; */
    bottom: 100px;
    background: #FFFFFF;
    border-radius: 60px;
    /* justify-content: center; */
    align-items: center;
    margin-left: 25%;

}
td > a{
	color : black;
	text-decoration : none;
	font-family: 'Gowun Dodum', sans-serif;
}
    
    .container {
        width: 100%;
        margin: 0 auto;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .header_container {
        width: 100%;
        height: 56px;
        display: flex;
        justify-content: center;
    }

    .header_area {
        width: 1024px;
        height: 100%;
        padding-top: 20px;
    }

    .header_content {
        display: flex;
        height: 100%;
        justify-content: space-between;
    }
    .header_left {
        width:95px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .main_logo{
         background: url("${pageContext.request.contextPath}/image/ez_logo1.svg") no-repeat center;
         background-size: 95px 35px;
    	cursor: pointer;
    }
    .ez_icon {
        width: 65px;
        height:35px;
    }
    
      .search_input_area {
      	 position: relative;
      }

      .search_input {
         width: 375px;
         height: 35px;
         background-color: white;
         border: 1px solid #e5e5e5;
         border-radius: 10px;
      }
      
      .glass {
      	 font-size: 20px;
	     position: absolute;
	     right: 13px;
	     top: 8px;
	     color: #464a54;
      }
    .header_right {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .big_menu_container {
        width: 100%;
        height: 70px;
        display: flex;
        justify-content: center;
	    margin-bottom: 13px;
	    margin-top: 13px;
	    align-items: center;
        
    }
    .big_menu_area {
        max-width: 1024px;
        width: 1024px;
	    margin-bottom: 13px;
	    margin-top: 20px;
    }

    .big_menu_content {
        height: 100%;
        justify-content: flex-start;
        align-items: center;
    }

    .big_menu_content a {
		font-size: 17px;
	    text-decoration: none;
	    color: black;
	    align-items: center;
	    display: flex;
	    width: 85px;
	    justify-content: center;
    }
    
    .menu1,.menu2,.menu3,.menu4,.menu5,.menu6 {
        width: 100px;
        justify-content: center;
        display: inline-block;
    }
    .menu6_a {
        font-weight: bold;
        padding-bottom:5px;
        border-bottom: 3px solid #26A653;
    }
    .menu2_a {
    	width: 80px !important;
    }
    .menu4 {
    	width: 82px;
    }
    .menu4_a {
    	width:70px !important;
    }
    .menu6 {
    	margin-left: 10px;
    }    
    

    .banner_container {
        max-width: 1024px;
        width:1024px;
        display: flex;
        justify-content: center;
/*         background-color: #fafafa; */
        overflow: hidden;
    }
    .banner_content_area {
        display: flex;
        justify-content: center;
        align-items: center;
        white-space: nowrap;
        width: 100%;
        height: 100%;
        transition: all 0.5s;
    }
    .banner_content {
        width: 100%;
        height: 100%;

    }
    .banner_image {
        width: 100%;
        height: 90%;
        border-radius: 35px;
        padding: 15px;
    }


    .match_list_container {
	    width: 100%;
	    height: 100%;
	    display: flex;
	    justify-content: center;
    }

    .match_menu_area {
        width: 1024px;
        max-width: 1024px;
        height:100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .match_menu_content {
        width: 100%;
        height:100%;
	    flex-direction: column;
	    display: flex;
	    align-items: center;
    }

    

    .bottom_banner {
        width:100%;
        background-color: #26A653;
    	margin-top: 100px;
    	display: flex;
    	justify-content: center;
    	align-items: center;
    	margin-top: 100px;
    }

        footer {
            width: 100%;
          
            height: 423px;
            display: flex;
            justify-content: space-evenly;   
            padding: 30px;
            background-color: #2a2a2a;
        }
        .footer_subcon{
            max-width: 1024px;
        }
        .footer_left {
            width:100%;
            
        }
        .footer_left .footer_nav{
            display: flex;

        }
        .footer_nav ul {
            list-style-type: none;
            line-height: 200%;
        }
        .footer_nav ul h3 {
            color : rgba(255, 255, 255, 0.649);
        }
        .footer_nav ul li{
            color :rgba(255, 255, 255, 0.348)
        }
        .footer_right {
            width:30%;
            padding-top: 14px;

        }
        .footer_com{
            line-height: 150%;
        }
        .footer_com h2{
            color : rgba(255, 255, 255, 0.649);
            border-bottom: 3px solid #26A653;
            width: 32%;
        }
        .footer_com p{
            color :rgba(255, 255, 255, 0.348);
        }
        .managermove a{
            color : white;
            text-decoration: none;
        }

    .login_icon {
        margin-left:15px;
    }
    .etc_icon {
        margin-left:10px;
    }


         .page_container {
         position: relative;
         display: grid;
         height: 100%;
         max-height: 100%;
         cursor: default;
         max-width: 1200px;
         margin: 0 auto;
         }

         .pagination_controller {
         display: flex;
         flex-direction: row;
         align-items: center;
         justify-content: space-between;
         padding: 0 1rem;
         width: 135px;
         height: 36px;
         font-size: .875rem;
         color: #fff;
         border-radius: 20px;
         background-color: rgba(0, 0, 0, .5);

         }

         .index_num {
         margin-right: auto;
         }

         .control_wrapper {
         display: flex;
         align-items: center;
         justify-content: space-between;
         width: 50px;
         }

         .control_previous_button,
         .control_play_pause_button,
         .control_next_button {
         padding: 0;
         background: none;
         border: 0;
         color: #fff;
         cursor: pointer;
         }

         .control_play_pause_button {
         display: flex;
         align-items: center;
         max-height: 10px;

         }

         .fa-pause {
         display: block;
         font-size: 12px;
         }

         .fa-play {
         display: none;
         }
         
    .header_icon {
	    text-decoration: none;
	    color: #4e4e4e;
	    font-size: 27px;
	    margin-left: 15px;
    }    
         
main {
	grid-area: main;
}

table {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	border-spacing: 0;
	margin-left: 5%;
    width: 90%;
    height : 20%;
 	border-bottom: 1px solid black;
}

table td, table th {
	border-top: 1px solid black;
	padding: 8px;
	white-space: no-wrap;
	overflow: hidden;
	text-overflow: ellipsis;
}


table tr:hover {
	background-color: #ddd;
}

table th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #565555;
	color: white;
}       	
           
      
  .pageInfo{
    list-style: none;
    display: flex;
    margin: 50px;
    justify-content: center;    
  }
  
  .pageInfo li{
     float: left;
    font-size: 20px;
    margin-left: 18px;
    padding: 7px;
    font-weight: 500;
  }
  
  .active{
      background-color: #cdd5ec;
  }
  
 a:link {color:black; text-decoration: none;}
 a:visited {color:black; text-decoration: none;}
 
 .pageInfo_area{
 	display : "flex";
 }
 
 .ta{
 	
 }
	
	.ta1{	
		    padding-left: 3%;
	}
	
	.ta2{
		text-align: end;
		 padding-right: 3%;
	}
	
	.span2{
		display : block;
		font-weight: bold;
		
	}
	
	.span1{
	display : block;
	font-size : 20px;
	
	}
	
	.span3{
		font-weight: bold;
		
	}
	
	.span4{
	
		
	}
	
	.asd{
		display: flex;
	}
	
	#btn2{
		margin-left: 5%;
	}
</style>
</head>
<body>
<div class="container">

    <div class="header_container">
        <div class="header_area">
            <div class="header_content">
               <div class="header_left main_logo">

               </div>
               <div class="header_right login_btn etc_btn">
                  <div class="search_input_area">
  		  			  <jsp:include page="../search/search.jsp"></jsp:include>
<!--                   <input type="text" class="search_input"> -->
	                  <iconify-icon class="glass" icon="fa6-solid:magnifying-glass"></iconify-icon>
                  </div>
                  <div class="adminMove">
                  	<% if(authority.equals("관리자")){ %>
                  		<a class="header_icon admin_btn" href="${pageContext.request.contextPath}/admin/admin"><iconify-icon icon="clarity:administrator-solid"></iconify-icon></a>
				  	<%}else if(authority.equals("매니저")){%>
				  		<a class="header_icon manager_btn" href="${pageContext.request.contextPath}/manager/manager"><iconify-icon icon="clarity:administrator-solid"></iconify-icon></a>
				  	<%} %>
                  </div>
                  
                  <div class="login_icon">
                     <a href="${pageContext.request.contextPath}/loginPage/login">
<!--                      <iconify-icon icon="akar-icons:person"></iconify-icon> -->
                        <svg width="25" height="28" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                           <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M12 2C9.23858 2 7 4.23858 7 7C7 9.76142 9.23858 12 12 12C14.7614 12 17 9.76142 17 7C17 4.23858 14.7614 2 12 2ZM9 7C9 5.34315 10.3431 4 12 4C13.6569 4 15 5.34315 15 7C15 8.65685 13.6569 10 12 10C10.3431 10 9 8.65685 9 7Z"
                              fill="#464A54" />
                           <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M12 13.5C7.5502 13.5 5.07689 15.0054 3.93312 16.0093C3.22723 16.6288 3 17.4996 3 18.2447C3 20.3187 4.68132 22 6.75534 22H17.2447C19.3187 22 21 20.3187 21 18.2447C21 17.4996 20.7728 16.6288 20.0669 16.0093C18.9231 15.0054 16.4498 13.5 12 13.5ZM5.25244 17.5124C6.03934 16.8217 8.04626 15.5 12 15.5C15.9537 15.5 17.9607 16.8217 18.7476 17.5124C18.8856 17.6335 19 17.8668 19 18.2447C19 19.2141 18.2141 20 17.2447 20H6.75534C5.78589 20 5 19.2141 5 18.2447C5 17.8668 5.11441 17.6335 5.25244 17.5124Z"
                              fill="#464A54" />
                        </svg>
                     </a>
                  </div>
                  
                  <% if(session.getAttribute("sessionVO") == null) { %>
                  <div class="etc_icon">
                     <a href="${pageContext.request.contextPath}/etc/etc">
                        <svg width="28" height="28" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                           <path
                              d="M5.5 10.5C6.32843 10.5 7 11.1716 7 12C7 12.8284 6.32843 13.5 5.5 13.5C4.67157 13.5 4 12.8284 4 12C4 11.1716 4.67157 10.5 5.5 10.5Z"
                              fill="#464A54" />
                           <path
                              d="M12 10.5C12.8284 10.5 13.5 11.1716 13.5 12C13.5 12.8284 12.8284 13.5 12 13.5C11.1716 13.5 10.5 12.8284 10.5 12C10.5 11.1716 11.1716 10.5 12 10.5Z"
                              fill="#464A54" />
                           <path
                              d="M18.5 10.5C19.3284 10.5 20 11.1716 20 12C20 12.8284 19.3284 13.5 18.5 13.5C17.6716 13.5 17 12.8284 17 12C17 11.1716 17.6716 10.5 18.5 10.5Z"
                              fill="#464A54" />
                        </svg>
                     </a>
                  </div>
                  <% } %>
                  
                  <% if(session.getAttribute("sessionVO") != null) { %>
                  <div class="logout_icon">
                     <a class="header_icon logout_btn" href="${pageContext.request.contextPath}/loginPage/logout">
						<iconify-icon icon="codicon:sign-out"></iconify-icon>
                     </a>
                  </div>
                  <%} %>
               </div>
            </div>

         </div>
      </div>
    <div class="big_menu_container">
        <div class="big_menu_area">
            <div class="big_menu_content">
                <div class="menu menu1"><a class="menu1_a" href="${pageContext.request.contextPath}/home">소셜 매치</a></div>
                <div class="menu menu2"><a class="menu2_a" href="${pageContext.request.contextPath}/team/team">팀 매치</a></div>
                <div class="menu menu3"><a class="menu3_a" href="${pageContext.request.contextPath}/rental/rental">구장 예약</a></div>
                <div class="menu menu4"><a class="menu4_a" href="${pageContext.request.contextPath}/rank/rank">랭킹</a></div>
                <div class="menu menu5"><a class="menu5_a" href="${pageContext.request.contextPath}/review/reviewmain">커뮤니티</a></div>
                <div class="menu menu6"><a class="menu6_a" href="${pageContext.request.contextPath}/blacklist/blacklistmain">블랙리스트</a></div>
            </div>
        </div>
    </div>

    <div class="banner_container">
            <div class="banner_content_area">
                <div class="banner_content">
                    <img class="banner_image" src="../image/Reviewbanner.png" alt="">
                </div>
            </div>
        </div>

 	<div id = "div1">
 		
 		<div class = "asd">
 		<div class = "head">
 		<h1>블랙리스트 / 신고게시판</h1>
 		<h2>악의적인 행동을 반복하는 유저를 신고해주세요</h2>
 		</div>
 		<div class="sideicon">
 		<iconify-icon icon="fluent:pen-24-filled" id= "btn1" style="color: #26a563;" width="30" height="30"></iconify-icon>
 		<span id= "btn2">블랙리스트 등록</span>
 		</div>
 		</div>
 		
		<div class="containermain">
		<main>
			<table>
				<tbody class ="ta">
					<c:forEach var="vo" items="${list}">
						<%-- <c:if test="${vo.isDelete == 1}"> --%>
						<tr>
						<td class = "ta1"><a
								href="${pageContext.request.contextPath}/blacklist/blacklistmain/${vo.blacklistCode}"><span class ="span1">${vo.blacklistTitle}</span>   <span class ="span3">작성자 : ${vo.buserName}</span> </a></td>
						<td class ="ta2"><a
							href="${pageContext.request.contextPath}/blacklist/blacklistmain/${vo.blacklistCode}"><span class ="span2">${vo.blacklistLocal}</span>   ${vo.blacklistCreateDate}</a></td>

						</tr>
						<%-- 	</c:if> --%>
					</c:forEach>
					</tbody>
			</table>

					<div class="pageInfo_wrap">
						<div class="pageInfo_area">
							<ul id ="pageInfo" class="pageInfo">
							  <!-- 이전페이지 버튼 -->
				                <c:if test="${pageMaker.prev}">
				                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">◀</a></li>
				                </c:if>
				                
								 <!-- 각 번호 페이지 버튼 -->
                				 <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
				                </c:forEach>

              					
              					 <!-- 다음페이지 버튼 -->
				                <c:if test="${pageMaker.next}">
				                    <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">▶</a></li>
				                </c:if>    
							</ul>
						</div>
					</div>

			<form id ="moveForm" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">  
			</form>
			
			
		</main>
		</div>
		</div>
	</div>
	<script type="text/javascript">
	

	/*검색 버튼*/
		$("#chbtn").click(function(){
			
		});
	
	
	let moveForm = $("#moveForm");
	
	$(".move").on("click", function(e){
		e.preventDefault();
		
		moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
		moveForm.attr("action", "/EZFootBall/blacklist/blacklistmain/{blacklistCode}");
		moveForm.submit();
	});


	
	  $(".pageInfo a").on("click", function(e){
		 
		  e.preventDefault();
	      moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	      moveForm.attr("action", "/EZFootBall/blacklist/blacklistmain");
	      moveForm.submit();
	        
	    });
	
	
	/* 글쓰기 아이콘 누를시 이동 */
	document.getElementById("btn1").addEventListener("click",function(){

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
 					location.href = "${pageContext.request.contextPath}/blacklist/blacklistmain/setbbs";
 				}
			}
 		});
	});
		
	
	document.getElementById("btn2").addEventListener("click",function(){

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
 					location.href = "${pageContext.request.contextPath}/blacklist/blacklistmain/setbbs";
 				}
			}
 		});
	});
	
	</script>


    </div>

    <div class="bottom_banner">
    	<div class="banner_area">
			<img src="${pageContext.request.contextPath}/image/index_bottom_banner.png">
		</div>
    </div>
    <footer>
        <jsp:include page="../etc/footer.jsp"></jsp:include>
    </footer>
</div>


<script type="text/javascript">
	let main_logo = document.querySelector(".main_logo");
	
	main_logo.addEventListener("click",function() {
		location.href="${pageContext.request.contextPath}";
	});
</script>


   <script type="text/javascript">
           
            console.log("<%=alert%>");
            
        		if(<%=alert%> == alert){
        			Swal.fire('이미 신고한 유저 입니다');

        		}
	
            </script>



  

</body>
</html>