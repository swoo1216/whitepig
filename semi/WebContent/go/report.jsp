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
	<table>
		<tr>
			<th>신고번호</th>
			<th>신고자</th>
			<th>용의자</th>
			<th>신고유형</th>
		</tr>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td><a
					href="/semi/go/DetailReport.do?reportNum=${vo.reportNum}">${vo.reportNum}</a></td>
				<td><a
					href="/semi/go/DetailReport.do?reportNum=${vo.reportNum}">${vo.reporter}</a></td>
				<td><a
					href="/semi/go/DetailReport.do?reportNum=${vo.reportNum}">${vo.suspect}</a></td>
				<td><a
					href="/semi/go/DetailReport.do?reportNum=${vo.reportNum}">${vo.rtype}</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>

