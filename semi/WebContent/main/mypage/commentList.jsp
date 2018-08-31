<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>댓글목록</h2>
<table border="2" width="500" style="text-align: center;">
	<tr>go</tr>
	<tr>
		<th>댓글단게시물번호</th>
		<th>내용</th>
		<th>작성시간</th>
	</tr>
	<c:forEach var="vo" items="${commentlist1 }">
	<tr>
		<td>${vo.bnum}</td>
		<td>${vo.content}</td>
		<td>${vo.regdate }</td>
	</tr>
	</c:forEach>
</table>
<table border="2" width="500" style="text-align: center;">
	<tr>poke</tr>
	<tr>
		<th>댓글단게시물번호</th>
		<th>내용</th>
		<th>작성시간</th>
	</tr>
	<c:forEach var="vo" items="${commentlist2 }">
	<tr>
		<td>${vo.bnum}</td>
		<td>${vo.content}</td>
		<td>${vo.regdate }</td>
	</tr>
	</c:forEach>
</table>
<table border="2" width="500" style="text-align: center;">
	<tr>lol</tr>
	<tr>
		<th>댓글단게시물번호</th>
		<th>내용</th>
		<th>작성시간</th>
	</tr>
	<c:forEach var="vo" items="${commentlist3 }">
	<tr>
		<td>${vo.bnum}</td>
		<td>${vo.content}</td>
		<td>${vo.regdate }</td>
	</tr>
	</c:forEach>
</table>
<table border="2" width="500" style="text-align: center;">
	<tr>mu</tr>
	<tr>
		<th>댓글단게시물번호</th>
		<th>내용</th>
		<th>작성시간</th>
	</tr>
	<c:forEach var="vo" items="${commentlist4 }">
	<tr>
		<td>${vo.bnum}</td>
		<td>${vo.content}</td>
		<td>${vo.regdate }</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>