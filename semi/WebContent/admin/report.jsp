<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
</head>
<body>
	<table class="w3-table-all w3-striped">
		<thead>
			<tr class="w3-dark-gray">
				<th style="width: 10%">신고번호</th>
				<th style="width: 25%">신고자</th>
				<th style="width: 25%">용의자</th>
				<th style="width: 30%">신고유형</th>
				<th style="width: 10%">삭제</th>
			</tr>
		</thead>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td onclick="DetailReport.do?reportNum=${vo.reportNum} style="cursor: pointer">${vo.reportNum}</td>
				<td><a href="DetailReport.do?reportNum=${vo.reportNum}">${vo.reporter}</a></td>
				<td><a href="DetailReport.do?reportNum=${vo.reportNum}">${vo.suspect}</a></td>
				<td><a href="DetailReport.do?reportNum=${vo.reportNum}">${vo.rtype}</a></td>
				<td><a onclick="#" class="w3-button"><span
						class="w3-large"><i class="fa fa-times-rectangle"></i></span></a></td>

			</tr>
		</c:forEach>
	
	</table>

</body>
</html>

