<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>id찾기</h2>
	<form method="post" action="<%=request.getContextPath()%>/mfindpwd.do">
	<div class="w3-section">
	  	<input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="아이디" name="id" required>
	  	<input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="이메일" name="email" required>
	   	<button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">비밀번호 찾기</button>
	</div>
	</form>
</body>
</html>