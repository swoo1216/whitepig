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
<h2>게시글목록</h2>
<table border="1" width="500">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>추천수</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>
	<c:forEach var="vo" items="${list }">
	<tr>
		<td>${vo.bnum}</td>
		<td>${vo.title}</td>
		<td>${vo.id }</td>
		<td>${vo.recomm}</td>
		<td>${vo.hit }</td>
		<td>${vo.regdate }</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>