<%@page import="org.apache.catalina.filters.ExpiresFilter.XHttpServletResponse"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var xhr=null;
	function emailcheck() {
		var email=document.getElementById("email").value;
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=checkedemail;
		xhr.open('get', 'mainidfind.do?email='+email, true);
		xhr.send();		
	}
	function checkedemail() {
		if(xhr.readyState==4 && xhr.status==200){
			var text=xhr.responseText;
			var json=JSON.parse(text);
			var email=json.email;
			if(email!=null){
				alert("이메일로 발송");
				location.href="adminmain.jsp";
			}else{
				alert("이메일 정보가 없습니다.");
				document.getElementById("email").value="";
				return;
			}
		}
	}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
	<div class="w3-card-4" style="width: 500px; margin-top: 20px; margin-left: 20px;">
		<div class="w3-container w3-dark-gray">
			<h2>Log In</h2>
		</div>
		<form class="w3-container" action="mlogin.do">
			<div class="w3-section">
				<label><b>UserID</b></label> 
				<input
					class="w3-input w3-border w3-margin-bottom" type="text"
					placeholder="Enter ID" name="id" id="id" required>
				<label><b>Password</b></label> <input class="w3-input w3-border"
					type="password" placeholder="Enter Password" name="pwd" id="pwd"
					required>
				<button class="w3-button w3-block w3-light-gray w3-section w3-padding"
					type="submit">Login</button>
				<input class="w3-check w3-margin-top" type="checkbox" value>
				Remember me<br> <span class="w3-right w3-padding w3-hide-small">Forgot
					<a
					onclick="document.getElementById('findemail').style.display='block'" style="color: blue; cursor:pointer;">password!</a>	
				</span>
			</div>
		</form>
		
		<div id="findemail" class="w3-modal" >
			<div class="w3-modal-content w3-card-4 w3-animate-zoom"
				style="width: 40%">
				<div class="w3-container w3-dark-gray">
				<h2>ID 찾기</h2>
				<span
						onclick="document.getElementById('findemail').style.display='none'"
						class="w3-button w3-xlarge w3-hover-red w3-display-topright"
						title="Close Modal">&times;</span>
				</div>
				<div class="w3-container" >
					<div class="w3-section">
						<label><b>E-Mail</b></label> <input class="w3-input w3-border"
							type="text" placeholder="Enter E-Mail" name="email" id="email" required>
						<button class="w3-button w3-block w3-light-gray w3-section w3-padding"
							type="button" onclick="emailcheck()">find</button>
						<button
							onclick="document.getElementById('findemail').style.display='none'"
							type="button"
							class="w3-button w3-block w3-dark-gray w3-section w3-padding">Cancel</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>