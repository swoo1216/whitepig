<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	function pwdchk()
	{
		var pwd = document.getElementById("pwd").value;
		var pwd2 = document.getElementById("pwd2").value;
		var span = document.getElementById("pwdcheck");
		if(pwd==pwd2)
		{
			span.style.color = "green";
			span.innerHTML = "사용가능한 비밀번호입니다.";
		}
		else
		{	
			span.style.color = "red";
			span.innerHTML = "비밀번호가 불일치합니다.";
		}
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<div>
		<h4>비밀번호변경</h4>
		<form action="/semi/mpwdchange.do" method="post">
			<div class="w3-section">
				<input type="hidden" name="id" value=<%=session.getAttribute("id") %>>
				<input class="w3-input w3-border" type="password" placeholder="비밀번호" name="pwd" id="pwd" onkeyup="pwdchk()" required>
				<input class="w3-input w3-border" type="password" placeholder="비밀번호확인" name="pwd2" id="pwd2" onkeyup="pwdchk()" required>
				<span id="pwdcheck" font-size: 12px"></span><br>
				<button class="w3-button w3-block w3-pink w3-section w3-padding" type="submit">비밀번호변경</button>
			</div>
		</form>
	</div>
</body>
</html>