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
	
</script>
<body>
	<form method="post" action="<c:url value='ginsert.do'/>">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="${sessionScope.id}"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${title}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="5" cols="50">${content}</textarea></td>
			</tr>
		</table>
		<button type="submit">작성</button>
	</form>




</body>
</html>