<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_frm.css?ver=4">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_modal.css?ver=4">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}
</style>
</head>
<script>
	function sel() {
		alert(document.getElementById("sel").value);
	}
</script>
<body>
	<script src="/semi/js/pantalk.js" type="text/javascript"
		charset="UTF-8"></script>
	<select id="sel">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
	</select>
	<button onclick="sel()">11</button>
</body>
</html>