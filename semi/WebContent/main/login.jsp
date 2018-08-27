<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
<h2>로그인</h2>
<form method="post" action="<%=request.getContextPath()%>/mlogin.do">
	<div class="w3-section">
	  	<input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="아이디" name="id" required>
	   	<input class="w3-input w3-border" type="password" placeholder="비밀번호" name="pwd" required>
	   	<button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">로그인</button>
	   	<input class="w3-check w3-margin-top" type="checkbox" name="check"> 로그인 유지
	        <span class="w3-right w3-padding w3-hide-small"><a href="/semi/main/findPwd.jsp">비밀번호찾기</a></span>
	        <span class="w3-right w3-padding w3-hide-small"><a href="/semi/main/findId.jsp	">아이디찾기</a></span>
	</div>
</form>
</body>
</html>