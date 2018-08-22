<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${requestScope.code=='success'}">
		<h2>회원가입성공</h2>
		<a href="/semi/Main/join.jsp">첫페이지로</a>
	</c:when>
	<c:otherwise>
		<h2>회원가입실패</h2>
		<a href="/semi/Main/join.jsp">첫페이지로</a>
	</c:otherwise>
</c:choose>
</body>
</html>