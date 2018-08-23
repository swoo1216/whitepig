<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_frm.css">
<style type="text/css">
td, th {
	border-spacing: 0px;
	border-style: none;
	padding: 5px;
}

th {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

td {
	border-bottom: 1px solid black;
}

#comments{
	margin-top: 30px;
}
</style>
<script type="text/javascript">

</script>
<title></title>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<jsp:include page="go/gboard.jsp"/>
		</div>
		<div id="center">
			<div id="nav">
				<jsp:include page="nav.jsp"/>
			</div>
			<div id="content">
				<jsp:include page="sw/index.jsp"/>
			</div>
			<div id="extra">
				<jsp:include page="extra.jsp"/>
			</div>
		</div>
	</div>

</body>
</html>