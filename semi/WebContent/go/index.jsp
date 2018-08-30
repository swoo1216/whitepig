<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<style type="text/css">
</style>
<script type="text/javascript">
	function selectAmount() {
		alert(event.target.value);
	}
</script>
<body>
	<form method="post" action="<c:url value='login.do'/>">
		아이디 <input type="text" name="id"><br> 비밀번호 <input type="password" name="pwd">
		<button type="submit">로그인</button>
	</form>
	${errMsg} ${id}

	<a href="<c:url value='gboard.do'/>">글목록</a>
	<a href="<%=request.getContextPath()%>/p	oke/list.do">상점</a>
	<a href="<%=request.getContextPath()%>/poke/pboard.do">poke</a>

	<c:if test="${!sessionScope.id}">
		<a href="<c:url value='logout.do'/>">로그아웃</a>
	</c:if>

	<input type="button" value="10" onclick="selectAmount()">
	<input type="button" value="50" onclick="selectAmount()">
	<input type="button" value="100" onclick="selectAmount()">
	<input type="button" value="1000" onclick="selectAmount()">
	<input type="button" value="10000" onclick="selectAmount()">

</body>
</html>