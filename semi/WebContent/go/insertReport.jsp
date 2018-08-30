<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="/semi/go/InsertReport.do">
		<table>
			<tr>
				<td>신고자</td>
				<td><input type="text" value="${vo.report}" name="reporter"></td>
			</tr>
			<tr>
				<td>용의자</td>
				<td><input type="text" value="${vo.suspect}" name="suspect"></td>
			</tr>
			<tr>
				<td>신고유형</td>
				<td><select name="rtype">
						<option value="욕설">욕설</option>
						<option value="부적절한 내용">부적절한 내용</option>
						<option value="관리자 비난">관리자 비난</option>
						<option value="Guitar">Guitar</option>
				</select></td>
			</tr>`
			<tr>
				<td colspan="2"><textarea rows="5" cols="50" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit">신고작성</button>
				</td>
			</tr>
		</table>
	</form>





</body>
</html>