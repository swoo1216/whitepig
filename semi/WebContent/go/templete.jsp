<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_frm.css?ver=4">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		var size = window.innerHeight || document.body.clientHeight;
		document.getElementById("wrapper").style.height = (size - 10) + "px";
	}
</script>
</head>
<body>
	<div id="wrapper">
		<div id="header"></div>
		<div id="center">
			<div id="nav"></div>
			<div id="content">
			</div>
		</div>
	</div>
</body>
</html>