<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="gmodifyOk.do">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="${sessionScope.id}" readOnly="readOnly"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${vo.title}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="5" cols="50">${vo.content}</textarea></td>
			</tr>
		</table>
		<input type="hidden" value="${vo.bNum}" name="bNum">
		<input type="hidden" value="0" name="tNum">
		<button type="submit">수정</button>
	</form>
</body>
</html>