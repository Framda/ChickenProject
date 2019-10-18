<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log in content</title>
<script src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js" ></script>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<style>
	* {
		box-sizing: border-box;
	}
    body {
    	display:flex;
    	flex-direction: column;
        background-color: rgb(253, 189, 51);
        height: 100vh;
    }
    #wrap {
    	flex-grow: 1;
    }
    #content-box {
        margin: 0 auto;
        width: 300px;
        
    }
    #btn-login {
        margin: 50px 0;
    }
    footer {
    	height: 50px;
        line-height: 50px;
        text-align: center;
    }
</style>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/style.css">
<script type="text/javascript">
	function btnLogin() {
		if($("#mid").val() == "") return false;
		if($("#mpassword").val() == "") return false;
		return true;
	}
	function btnLogout() {
		location.href = "logout";
	}
	$(document).ready(function(){
		 
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key = getCookie("key");
	    $("#mid").val(key); 
	     
	    if($("#mid").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("key", $("#mid").val(), 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#mid").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#mid").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
</script>
</head>
<body>
	<div id="wrap">
	<div id="imageDiv">
		<img id="mainimage" src="<%=application.getContextPath()%>/resources/images/chicken.PNG" width = 320/>
	</div>
    <div id="content-box">
	<c:if test="${loginResult != 'success'}">
		<form id="loginForm" method="post" action="login">
			<div class="form-group">
				<label for="mid">ID</label>
				<input type="text" class="form-control" id="mid" name="mid">
				<c:if test="${loginResult == 'wrongMid'}">
				<span style="color:red;font-weight: 700;">Incorrect username</span>
				</c:if>
			</div>
			<div class="form-group">
				<label for="mpassword">Password</label>
				<input type="password" class="form-control" id="mpassword" name="mpassword">
				<c:if test="${loginResult == 'wrongMpassword'}">
				<span style="color:red;font-weight: 700;">Incorrect password.</span>
				</c:if>
			</div>
			<input type="checkbox" id="idSaveCheck"> 아이디 저장
			<input id="loginButton1" type="submit" onclick="btnLogout()" class="btn btn-danger" value="Log in"/>
		</form>
	</c:if>
	<c:if test="${loginResult == 'success'}">
		<div id="logoutDiv">
			<button onclick="btnLogout()" class="btn btn-danger" style="text-align: center;">Log out</button>
		</div>
	</c:if>
	</div>
	</div>
	<footer>
		<div id="footer">&copy;copyright 2019 . <a href="https://github.com/Framda" target="_blank">Framda</a> </div>
	</footer>
</body>
</html>