<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원정보수정</h2>
<form method="post" action="<%=request.getContextPath()%>/mmodify.do">
	<div class="w3-section">
		<input type="hidden" value = <%= session.getAttribute("id") %> name="id">
	  	<input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="이메일" name="email" required>
	   	<input class="w3-input w3-border" type="text" placeholder="닉네임" name="nic" required>
	   	<button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">회원정보수정</button>
	   	<span class="w3-right w3-padding w3-hide-small"><a href="">회원탈퇴</a></span>
	   	<span class="w3-right w3-padding w3-hide-small"><a href="">비밀번호변경</a></span>
	</div>
</form>
</body>
</html>