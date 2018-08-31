<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_frm.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_modal.css?ver=4">
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

	function check() {
		if (!document.getElementsByName("title")[0].value) {
			alert("제목을 입력하세요");
			return;
		}

		if (!document.getElementsByName("content")[0].value)
			return;

		document.insertFrm.submit();
	}
</script>
<div id="gtable">
	<form name="insertFrm" method="post" action="/semi/go/ginsert.do">
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
		<button type="button" onclick="check();">작성</button>
	</form>
</div>
<script src="/semi/js/pantalk.js?ver=4" type="text/javascript"
	charset="UTF-8"></script>
<script type="text/javascript">
	var pt = new pantalk("${sessionScope.id}", "${sessionScope.nic}");
	pt.startCount();
</script>
