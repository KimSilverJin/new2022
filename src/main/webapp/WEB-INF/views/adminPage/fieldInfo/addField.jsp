<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.menu2 {
		background-color: #f8ede3;
	}
	
	
    .field_container {
    	padding:25px;
        display: flex;
        flex-direction: column;
    }
    
   	.field_title {
    	display: flex;		
    	justify-content: space-between;
	}
	
	.field_title_h1 {
		margin-bottom:20px;
	}
	
	.field_insert {
	    width: 60px;
	    height: 40px;
    }
    
    .button_area {
	    display: flex;
		justify-content: flex-end;
    }
    
    
    .area_box {
        display: flex;
    }

    .left_content {
        width: 70%;
        border: 1px solid black;
        padding:20px;
    }
    .right_content {
        width: 30%;
        border: 1px solid black;
        padding:20px;
        display: flex;
        flex-direction: column;
    }
    .select {
        height: 35px;
        padding-left:10px;
    }
    .input {
        height:30px;
        padding-left:10px;
    }

    .image_area {
        width:100%;
        height: 330px;
        border: 1px solid black;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    .image_content {
    	height: 100%;
    }

    .file_box {
        margin-top: 10px;
        display: flex;
        justify-content: flex-end;
    }
    
    .image_file_name {
        width: 50%;
        padding-left:10px;
    }
    .input_file_button{
        padding: 5px 15px;
        background-color: #f8ede3;
        border-radius: 4px;
        color: black;
        cursor: pointer;
        margin-left:10px;
    }
    .buttons {
        width:7%;
        margin-left: 10px;
    }
    
    .preview_image{
    	width:100%;
    	height:100%;
    }
    .king_image {
    	line-height: 27px;
    }
    
        

    
    
</style>
</head>
<body>
<!-- enctype="multipart/form-data" -->
<form action="${pageContext.request.contextPath}/admin/addField" method="post" enctype="multipart/form-data">
    <div class="field_container">
        <div class="field_title">
            <h1 class="field_title_h1">?????? ??????</h1>
            <div class="button_area">
            	<button class="field_insert" name="select" value="fieldAdmin">??????</button>
            	
        	</div>
        </div>

        

        <div class="area_box">
            <div class="left_content">
                <div class="image_area">
                    <div class="image_content">
                        <span class="image_span">
                            <img src="${pageContext.request.contextPath}/image/preview_image.png" class="preview_image" id="preview_image">
                        </span>
                    </div>
                </div>
                <div class="file_add_area">
                    <div class="file_box">
                    	<label for="select_file" class="king_image">??????????????? ?????? &nbsp;</label>
                        <input type="text" class="image_file_name" id="select_file" placeholder="????????? ????????????" readonly required="required" title="????????? ??????????????????.">
                        <label class="input_file_button" for="input_file">
                            ????????????
                        </label>
                        <input type="file" class="input_file" name="fieldImg" id="input_file" style="display:none" accept="image/*" required="required">
                        <button type="button" class="add_btn buttons">+</button>
                        
                    </div>
                </div>
            </div>
            <div class="right_content">
                <label for="search_local">????????? : </label>
                <select name="gamePlace" id="search_local" class="select" required="required">
                	<option id="default" value="??????">?????? ??????</option>
                    <option id="??????" value="??????">??????</option>
                    <option id="??????" value="??????">??????</option>
                    <option id="?????????" value="?????????">?????????</option>
                    <option id="?????????" value="?????????">?????????</option>
                    <option id="?????????" value="?????????">?????????</option>
                    <option id="?????????" value="?????????">?????????</option>
                    <option id="?????????" value="?????????">?????????</option>
                    <option id="?????????" value="?????????">?????????</option>
                </select><br>

                <label for="field_name">????????? : </label>
                <input type="text" class="input" id="field_name" name="fieldName" required="required"><br>
                <label for="field_address">???????????? : </label>
                <input type="text" class="input" id="field_address" name="fieldAddress" required="required"><br>
                <label for="field_call">??????????????? : </label>
                <input type="text" class="input" id="field_call" name="fieldCall" pattern="010-[0-9]{4}-[0-9]{4}" required title="???????????? ????????? ?????? ?????????(-)??? ??????????????????."><br>
                <label for="field_rentalfee">??????????????? : </label>
                <select name="fieldRentalfee" id="field_rentalfee" class="select" required="required">
                	<option id="default" value="100000">????????? ??????</option>
                    <option id="100000" value="100000">100,000???</option>
                    <option id="120000" value="120000">120,000???</option>
                    <option id="150000" value="150000">150,000???</option>
                </select><br>
                <label for="field_type">???????????? : </label>
                <select name="fieldType" id="field_type" class="select" required="required">
                	<option id="default" value="5v5">???????????? ??????</option>
                    <option id="5v5" value="5v5">5v5</option>
                    <option id="6v6" value="6v6">6v6</option>
                </select><br>
                <label for="field_size">???????????? : </label>
                <select name="fieldSize" id="field_size" class="select" required="required">
                	<option id="default" value="32x18m">???????????? ??????</option>
                    <option id="32x18" value="32x18m">32x18m</option>
                    <option id="32x20" value="32x20m">32x20m</option>
                    <option id="36x17" value="36x17m">36x17m</option>
                    <option id="36x24" value="36x24m">36x24m</option>
                    <option id="38x20" value="38x20m">38x20m</option>
                    <option id="40x20" value="40x20m">40x20m</option>
                    <option id="40x25" value="40x25m">40x25m</option>
                    <option id="42x21" value="42x21m">42x21m</option>
                    <option id="43x26" value="43x26m">43x26m</option>
                </select><br>
                <label for="field_in_out">???????????? : </label>
                <select name="fieldInOut" id="field_in_out" class="select" required="required">
                	<option id="default" value="??????">???????????? ??????</option>
                    <option id="??????" value="??????">??????</option>
                    <option id="??????" value="??????">??????</option>
                </select><br>
                <label for="field_grass">???????????? : </label>
                <select name="fieldGrass" id="field_grass" class="select" required="required">
                	<option id="default" value="????????????">?????? ??????</option>
                    <option id="????????????" value="????????????">????????????</option>
                    <option id="????????????" value="????????????">????????????</option>
                    <option id="???" value="???">???</option>
                </select><br>
            </div>
        </div>            
    </div>
</form>
    <script>
        let image_add_btn = document.querySelector(".add_btn");
        let file_add_area = document.querySelector(".file_add_area");
        let image_span = document.querySelector(".image_span");
        let image_tag = document.querySelector(".image_box");
        
        let image_file_name = document.querySelector('.image_file_name');
        let input_file = document.querySelector(".input_file");
        
        let previewImage = document.getElementById("preview_image");
        let num=1;
        

        image_add_btn.addEventListener("click",function() {
        	if(num<5){
	            let file_box = document.createElement("div");
	            file_box.className = "file_box";
	            
	            let image_file_name = document.createElement("input");
	            image_file_name.type="text";
	            image_file_name.className = "image_file_name";
	            image_file_name.placeholder = "????????? ????????????";
	            image_file_name.readOnly="true";
	            image_file_name.id = "select_file"+num;
	            image_file_name.name = "fieldName"+num;
	
	            let input_file_label = document.createElement("label");
	            input_file_label.className="input_file_button";
	            input_file_label.innerText ="????????????";
	            input_file_label.htmlFor = 'input_file'+num;
	
	            let input_file = document.createElement("input");
	            input_file.type ="file";
	            input_file.id = "input_file"+num;
	            input_file.className = "input_file";
	            input_file.style.display ="none";
	            input_file.accept="image/*";
	            input_file.name = "fieldImg";
	            
	            let delete_btn = document.createElement("button");
	            delete_btn.className = "delete_btn buttons";
	            delete_btn.innerText = "-";
	            delete_btn.type="button";
	            
	            file_box.append(image_file_name);
	            file_box.append(input_file_label);
	            file_box.append(input_file);
	            file_box.append(delete_btn);
	            
	
	            file_add_area.append(file_box);
	
	            let delete_btns = document.querySelectorAll(".delete_btn");
	        
	            delete_btns.forEach(function(e) {
	                e.addEventListener("click",function() {
	                	num=num-1;
	                	previewImage.src = "${pageContext.request.contextPath}/image/preview_image.png";
	                    e.parentElement.remove();
	                });
	            });
	
	            let image_name_inputs = document.querySelectorAll(".image_file_name");
	            let input_files = document.querySelectorAll(".input_file");
	            let file_boxes = document.querySelectorAll(".file_box");
	
	            for(let i=0; i<image_name_inputs.length; i++) {
	
	                input_files[i].addEventListener('change', function(e){
	    
	                    if(input_files[i].files && input_files[i].files[0]) {
	                        image_name_inputs[i].value = input_files[i].files[0].name;
	
	                        const reader = new FileReader()
	
	                        reader.onload = function(e) {
	
	                        	previewImage.src = e.target.result;
	                            
	                        }
	                        reader.readAsDataURL(input_files[i].files[0]);
	                    }else {
	                    	image_name_inputs[i].value = '????????? ????????? ????????????.';
	                    }
	                    
	                });
	            };
	            num++;
	        }else {
	        	alert("????????? 5????????? ?????? ??? ?????????");
	        }
        });

        
        
        function readImage(input) {
            // ?????? ????????? ????????? ?????? ??????
            if(input.files && input.files[0]) {
                image_file_name.value = input.files[0].name;
                // ????????? ???????????? ?????? (??????)
                // FileReader ???????????? ??????
                const reader = new FileReader()
                // ???????????? ????????? ??? ??????
                reader.onload = function(e) {
                    previewImage.src = e.target.result;
                    

                }
                // reader??? ????????? ????????? ??????
                reader.readAsDataURL(input.files[0])
            }else {
            	image_file_name.value = '????????? ????????? ????????????.';
            }
        }


     // input file??? change ????????? ??????
        input_file.addEventListener("change", function(e) {
            readImage(e.target);
        });
       

    </script>

</body>
</html>