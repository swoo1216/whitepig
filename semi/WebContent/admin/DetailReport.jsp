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
<script type="text/javascript">
	function sendChange() {
		location.href = "/semi/go/ChangeUserClass.do?reportNum=${vo.reportNum}&id=${vo.suspect}&clss="
				+ document.getElementById("clss").value;
	}
</script>
<body>
<div class="w3-container">
	<table  class="w3-table-all w3-striped">
		<th class="w3-dark-grey" colspan="2"><h1>세부내용</h1></th>
		<tr>
			<td>신고번호</td>
			<td>${vo.reportNum}</td>
		</tr>
		<tr>
			<td>신고자</td>
			<td>${vo.reporter}</td>
		</tr>
		<tr>
			<td>용의자</td>
			<td>${vo.suspect}<select id="clss">
					<option value="user" <c:if test="${clss == 'user'}">selected</c:if>>user</option>
					<option value="yellow" <c:if test="${clss == 'yellow'}">selected</c:if>>yellow</option>
					<option value="red" <c:if test="${clss == 'red'}">selected</c:if>>red</option>
			</select>
				<button type="button" onclick="sendChange()">등급변경</button></td>
		</tr>
		<tr>
			<td>신고유형</td>
			<td>${vo.rtype}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${vo.content}</td>
		</tr>
		<tr >
			<td colspan="2"><a href="/semi/go/DeleteReport.do?reportNum=${vo.reportNum}">삭제</a></td>
		</tr>
	</table>
	</div>
</body>
</html>