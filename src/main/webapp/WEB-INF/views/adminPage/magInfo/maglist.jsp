<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<style>
	*{
		box-sizing: border-box;
		margin: 0;
	}
    .menu1 {
		background-color: #f8ede3;
	}
	#main_container{
		position:relative;
		display: flex;
		flex-direction: column;
		padding: 15px;
	}
	
	.header_box{
		width:100%;
		display: flex;
	}
	
	.header_right{
		display: flex;
		width: 100%;
		justify-content: flex-end;
	}
	
	.search_bar input{
		height: 30px;
		margin: 0 10px 0 0;
	}
	
	.state, .mselect {
		height: 30px;
	}
	
	.btn_box{
		width:15%;
/* 		align-self: flex-end; */
	}
	
	.btn{
    	color: #fff;
    	height: 30px;
	    background-color: #26a563;
	    border: none;
	    border-radius: 10px;
/* 	    width: 45%; */
	    min-width:45px;
	    cursor: pointer;
	    font-size: 12px;
	}
	
	#manager_List{
		width: 100%;
		border-collapse: collapse;
		font-size: 14px;
		margin: 20px 0;
	}
	
	#manager_List th, td {
		height: 40px;
	    text-align: center;
	    border-bottom: 2px dotted #D2D79F;
	}
	
	#manager_List th {
		background-color: #F8EDE3;
		height: 50px;
    	border-bottom: 2px solid #D2D79F;
	}

	
	#check, #ck{
		width: 20px;
   		height: 30px;
	}
	
	#add_box{
		display:none;
		position: absolute;
		top: 100px;
    	left: 50%;
  	  	transform: translate(-50%, 0%);
		width: 300px;
		height: 300px;
		background: #eee;
		padding: 20px;
	}
	
	#add_box h5 {
		font-size: 16px;
		padding: 10px 0;
	}
	
	#add_box input{
		width: 100%;
		padding:5px 0;
		font-size: 16px;
	}
	
	.title_h5 {
		text-align: center;
		margin-bottom: 20px;
	}
	
	.btn_box2 {
		display:flex;
		width: 100%;
		justify-content: center;
	}
	
	.btn_box2 button{
		padding: 5px;
		margin: 5px;
		background: #fff;
		cursor: pointer;
	}
	
/* 	.select_box{ */
/* 		align-self: flex-end; */
/* 	} */
	
</style>
<body>
	<div id="main_container">
		<div class="header_box">
			<section class="select_box">
				<select class="state">
	                <option value="">���弱��</option>
			        <c:forEach var="field" items="${fieldList}">
						<option value="${field.fieldName}">${field.fieldName}</option>
					</c:forEach>
		        </select>
		    </section>
		    <div class="header_right">
				<div class="search_bar">
			  		<select class="mselect">
	                	<option value="">ī�װ�</option>
			        	<option value="�����ڵ�">�����ڵ�</option>
			        	<option value="����ID">����ID</option>
			        	<option value="�����̸�">�����̸�</option>
			        	<option value="�������">�������</option>
			        	<option value="����">����</option>
			        	<option value="��籸��">��籸��</option>
		       		</select>
			    	<input type="text" name="msearch" id="msearch" placeholder="�˻�� �Է����ּ���" />
			    	
			    </div>
				<div class="btn_box">
					<button id="search_btn" class="btn">�˻�</button>
					<button id="add" class="btn">�߰�</button>
					<button id="delete" class="btn">����</button>
				</div>
			</div>
		</div>
		<table id="manager_List">
			<tr>
				<th><input type="checkbox" name="check" id="check" /></th>
				<th>�����ڵ�</th>
				<th>����ID</th>
				<th>�����̸�</th>
				<th>�������</th>
				<th>����</th>
				<th>��籸��</th>
			</tr>
			
			<c:forEach var="list" items="${managerList}" varStatus="status">
			<tr class="item_box${list.userCode} box_box">
				<td><input type="checkbox" name="ck" id="ck" class="ck"  userCode="${list.userCode}" /></td>
				<td>${list.userCode}</td>
				<td>${list.userId}</td>
				<td>${list.userName}</td>
				<td>${list.userBirth}</td>
				<td>${list.userGender}</td>
				<td class="area">${list.preferArea}</td>
			</tr>
				<script type="text/javascript">
					$('.state').on("change", function(){
						
						$('.item_box${list.userCode}').show();
								
							if ($('.state').val() == ''){
								$('.item_box${list.userCode}').show();
							}else if('${list.preferArea}' != $('.state').val()){
								$('.item_box${list.userCode}').hide();
							}
					});
					
					</script>			
			</c:forEach>
		</table>
		<div id="add_box">
			<h5 class="title_h5">�Ŵ��� �߰�</h5>
			<h5>���� �ڵ�</h5>
			<input type="text" name="userCode" id="userCode" />
			<h5>���� ID</h5>
			<input type="text" name="userId" id="userId" />
			<div class="btn_box2">
				<button id="box_add">�߰�</button>
				<button id="box_close">���</button>
			</div>
		</div>
	</div>
	
	
	
	<script type="text/javascript">
		$("#check").click(function(){	 
			 if($("#check").prop("checked")) {
			  $(".ck").prop("checked", true);
			 } else {
			  $(".ck").prop("checked", false);
			 }
		});
		
		$(".ck").click(function(){
			$("#check").prop("checked", false);
		});
		
		$('#add').click(function(){
			$('#add_box').show();
		});
		
		$('#box_add').click(function(){
			const userId = $('#userId').val();
			const userCode = $('#userCode').val();
			
			var confirm_val = confirm("�Ŵ����� �߰��Ͻðڽ��ϱ�?");
			 
			if(confirm_val) {
				location.href = "${pageContext.request.contextPath}/admin/manageradd?userId="+userId+"&userCode="+userCode;
			}
		});
		
		$('#box_close').click(function(){
			$('#add_box').hide();
		});		
	</script>
	
	<script type="text/javascript">
		// �Ŵ��� ����
		$('#delete').click(function(){
			var confirm_val = confirm("�Ŵ��� ������ �����Ͻðڽ��ϱ�?");
			 
			if(confirm_val) {
				var checkArr = new Array();
				  
				$("input[class='ck']:checked").each(function(){
				    checkArr.push($(this).attr("userCode"));
				});
				   
				   var chbox = new Array();
				   $.ajax({
				    url : "${pageContext.request.contextPath}/admin/magDelete",
				    type : "POST",
				  
				    data : { chbox : checkArr },
				    success : function(result){
				    	if(result == 1) { 
				    		location.href = "${pageContext.request.contextPath}/admin/magselect?magselect=magList";
			    		}else {
			    			alert("���� ����");
			    		}
		    		},
		    		error : function(){
		    			alert("������ ������ �ο��� üũ���ּ���");
		    		}
		    	});
			}
		});
	</script>
	
	<script type="text/javascript">
		$('#search_btn').click(function(){
			const mselect = $('.mselect').val();
			const msearch = $.trim($('#msearch').val());
			if(mselect == null || mselect == ""){
				alert('ī�װ��� �������ּ���');
			}else if(msearch == null || msearch == "" ) {
				alert('�˻�� �Է����ּ���');
			}else{
				location.href = "${pageContext.request.contextPath}/admin/managerSearch?mselect="+mselect+"&msearch="+msearch;	
			}
		});
		
		$('#msearch').on("keyup", function(e){
			if (e.keyCode == 13) {
				$('#search_btn').click(); 
	        }
		})
	</script>
</body>
</html>