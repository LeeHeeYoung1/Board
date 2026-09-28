<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
 	* {
        box-sizing: border-box;
    }

    body {
        background-color: #0b1020;
    }

    .container {
        background-color: white;
        border: 1px solid gray;
        border-radius: 10px;
        width: 400px;
        height: 970px;
        margin: auto;
        padding: 10px;
        animation: show 1.5s ease;
    }
    
    #zipcode {
    	width:40%;
    	
    }
    
</style>
</head>
<body>

<form action="singUp" id="frm" method="post">

<div class="container">
	<fieldset id="box1">
		<legend>계정 정보</legend>
		
		<span>아이디</span>
		<input type="text" name="id" id="id" placeholder="아이디 ㄱ"> <button type="button" id="idCheckBtn">중복검사</button><br>
		<div id="resultid"></div>
		
		<span>비번</span>
		<input type="password" name="pw" id="pw" placeholder="비번 ㄱ"><br>
		
		<span>비번확인</span>
		<input type="password" name="pw2" id="pw2" placeholder="비번2 ㄱ"><br>
		<div id="pwCheck"></div>
	</fieldset>
	
	<fieldset id="box2">
		<legend>개인 정보</legend>
		
		<span>이름</span>
		<input type="text" name="name" id="name" placeholder="이름"><br>
		
		
		<span>전화번호</span>
		<input type="text" name="phone" id="phone" placeholder="010-0000-0000"><br>
		
		<span>이메일</span>
		<input type="text" name="email" id="email" placeholder="이멜"><br>
	</fieldset>
	
	<fieldset id="box3">
		<legend>주소 정보</legend>
		
		<span>우편번호</span>
		<input type="text" name="zipcode" id="zipcode" placeholder="우편번호" readonly> 
		<button type="button" id="codeBtn">우편번호 찾기</button><br>
		
		<span>집주소</span>
		<input type="text" name="address1" id="address1" placeholder="집주소"><br>
		
		<span>상세주소</span>
		<input type="text" name="address2" id="address2" placeholder="상세주소"><br>
	</fieldset>
	
	<fieldset id="box4" align="center">
		<button>가입하기</button>
		<button type="button" id="cancel">취소</button>
	</fieldset>
	
</div>

</form>

<script>

	
	document.getElementById("cancel").onclick = function() {
		location.href = "/";
	}
	
	
	// 아이디 중복체크 아쟈스
	$("#idCheckBtn").on("click", function(){

    let id = $("#id").val();

    $.ajax({
        url: "/members/idcheck",
        data: {
            id: id
        }
    }).done(function(resp){

        $("#resultid").empty();

        if(resp == "0"){
            $("#resultid").css("color","black").html("사용가능한 아이디입니다");
            $("#id").attr("check", "true");

        } else {
            $("#resultid").css("color","red").html("사용불가한 아이디입니다");
            $("#id").removeAttr("check");
        }

    	});
	});
	
	
	$("#id").on("input", function(){
	    $(this).removeAttr("check");
	    $("#resultid").empty();
	});
	
	
	//비밀번호 확인
	$("#pw2").on("keyup", function(){
	    if($("#pw").val() == $("#pw2").val()){
	        $("#pwCheck").css("color","black").html("비밀번호 맞");
	    } else {
	        $("#pwCheck").css("color","red").html("비밀번호 틀");
	    }
	});
	
	
	// 우편번호 api
	$("#codeBtn").on("click", function(){

        new daum.Postcode({
            oncomplete: function(data) {
                zipcode.value = data.zonecode;
                address1.value = data.address;
            }
        }).open();

    })
    
    
    //정규표현 스타트
    
    	let idregex = /^[a-z0-9_]{8,20}$/;

	    let pw1regex = /[A-Z]/;
	    let pw2regex = /[a-z]/;
	    let pw3regex = /[0-9]/;
	    let pw4regex = /^[A-Z0-9a-z]{8,}$/;

	    let nameregex = /^[가-힣]{2,5}$/;
	    let phoneregex = /^010-?\d{4}-?\d{4}$/;
	    let emailregex = /^.+?@.+?\.com$/;
	    let addressregex = /^[-가-힣0-9]*/;


	    
	    frm.onsubmit = function() {

	        if (!idregex.exec(id.value)) {
	            alert("아이디 확인해라");
	            id.value = "";
	            id.focus();
	            return false;
	        }


	        if (!pw1regex.exec(pw.value) ||
	            !pw2regex.exec(pw.value) ||
	            !pw3regex.exec(pw.value) ||
	            !pw4regex.exec(pw.value)) {

	            alert("비밀번호 형식오류");
	            pw.value = "";
	            pw.focus();
	            return false;
	        }


	        if (pw.value != pw2.value) {
	            alert("2차비번 확인해라");
	            pw.value = "";
	            pw2.value = "";
	            pw.focus();
	            return false;
	        }


	        if (!nameregex.exec(name.value)) {
	            alert("이름을 입력해주세요");
	            name.value = "";
	            name.focus();
	            return false;
	        }


	        if (!phoneregex.exec(phone.value)) {
	            alert("전화번호를 입력해주세요");
	            phone.value = "";
	            phone.focus();
	            return false;
	        }


	        if (!emailregex.exec(email.value)) {
	            alert("이메일을 입력해주세요");
	            email.value = "";
	            email.focus();
	            return false;
	        }


	        if (!zipcode.value) {
	            alert("우편번호 찾기를 통해 우편번호를 입력하세요");
	            zipcode.focus();
	            return false;
	        }


	        if (!address1.value) {
	            alert("우편번호 찾기를 통해 주소를 입력하세요.");
	            address1.focus();
	            return false;
	        }


	        if (!addressregex.exec(address2.value)) {
	            alert("상세 주소를 입력해주세요.");
	            address2.focus();
	            return false;
	        }
	        
	        if (!id.getAttribute("check")) {
	    		alert("중복 검사 안하냐????");
	    		return false;
	    	}

	    }

</script>
</body>
</html>