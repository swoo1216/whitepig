<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_frm.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_modal.css?ver=4">
<title></title>
</head>
<style type="text/css">
#gtable table tbody td, #gtable table tbody th {
	border-spacing: 0px;
	border-style: none;
	padding: 5px;
	text-align: left;
}

#gtable table tbody th {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

#gtable table tbody td {
	border-bottom: 1px solid black;
}

button {
	border: none;
	background-color: #ff6666;
	color: white;
	text-align: center;
	padding: 10px 10px 10px 10px;
	margin-top: 5px;
	cursor: pointer;
}

button:hover {
	background-color: #ff8080;
}
</style>
<script type="text/javascript">
	//window.onload = function() {
	//	var size = window.innerHeight || document.body.clientHeight;
	//	document.getElementById("wrapper").style.height = (size - 10) + "px";
	//}
	function golist() {
		location.href = "/semi/go/gboard.do";
	}
</script>
<body>
	<div id="gtable">
		<form method="post" action="/semi/go/ginsert.do">
			<table>
				<tr>
					<td>닉네임</td>
					<td>${sessionScope.nic}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" value="${title}"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" rows="30" cols="100">${content}</textarea></td>
				</tr>
			</table>
			<input type="hidden" name="id" value="${sessionScope.id}">
			<button type="button" onclick="golist()">목록</button>
			<button type="submit">작성</button>
		</form>
	</div>
</body>
<script src="/semi/js/pantalk.js?ver=4" type="text/javascript"
	charset="UTF-8"></script>
<script type="text/javascript">
	var pt = new pantalk("${sessionScope.id}", "${sessionScope.nic}");
	pt.startCount();
</script>
</html>