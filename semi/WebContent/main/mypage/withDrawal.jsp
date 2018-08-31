<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
#main
{
/* 	padding-left: 50px;
	padding-top: 50px; */
/* 	height: 300px;
	width: 350px; */
	text-align: center;
}
</style>
<body>
<form method="post" action="<%=request.getContextPath()%>/mwithdrawal.do">
<div id=main>
	<h2>회원탈퇴시 아래와 같은 조취가 취해집니다.</h2>
	<ul>
		<li>회원 탈퇴 일로부터 계정과 닉네임을 포함한 계정 정보(아이디/이메일/닉네임)는 '개인 정보 보호 정책'에 따라 60일간 보관(잠김) 되며,</li>
		<li>60일이 경과된 후에는 모든 개인 정보는 완전히 삭제되며 더 이상 복구할 수 없게 됩니다.</li>
		<li>작성된 게시물은 삭제되지 않으며, 익명처리 후 PANTS로 소유권이 귀속됩니다.</li>
		<li>게시물 삭제가 필요한 경우에는 관리자(admin@pants.kr)로 문의해 주시기 바랍니다.</li>
	</ul>
	<input type="submit" value="예 탈퇴하겠습니다." style= "color:red;" >
	<input type="Button" value="아니오" onclick="location.href='/semi/mboardcount.do'">
</div>
</form>
</body>
</html>