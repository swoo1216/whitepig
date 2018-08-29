<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>새 글 쓰기</h1>
<form action = "/semi/linsert.do" method="post">
	<input type="hidden" name="bnum" value="${param.bnum }">
	<input type="hidden" name="id" value="${param.id}">
	제목<br> <input type="text" name="title"><br>
	내용<br>
	<textarea rows="5" cols="50" name="content"></textarea><br>
	<input type="submit" value="게시">
	<input type="button" value="취소" onclick="location.href='index.jsp'">
</form>
</body>
</html>