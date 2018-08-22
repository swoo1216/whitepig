<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
</head>
<body>
    <div id="mainForm">
        <h4>회원가입</h4>
        <form action="join.do" method="post">
               <div class="w3-section">
	         	<input class="w3-input w3-border" type="text" placeholder="아이디" name="id" required>
	          	<input class="w3-input w3-border" type="password" placeholder="비밀번호" name="pwd" required>
	          	<input class="w3-input w3-border" type="password" placeholder="비밀번호확인" required>
	          	<input class="w3-input w3-border" type="text" placeholder="이메일" name="email" required>
	          	<input class="w3-input w3-border" type="text" placeholder="닉네임" name="nic" required>
	          	<button class="w3-button w3-block w3-pink w3-section w3-padding" type="submit">회원가입</button>
        	</div>
        </form>
    </div>
</body>
</html>