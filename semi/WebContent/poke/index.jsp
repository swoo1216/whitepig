<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/go_frm.css">
<style type="text/css">

</style>
<script type="text/javascript">

</script>
<title></title>
</head>
<body>
<c:choose>
<c:when test="${empty param.content}">
	<c:set var="content" value="main.html"/>
</c:when>
<c:otherwise>
	<c:set var="content" value="${param.content}"/>
</c:otherwise>
</c:choose>
	<div id="wrapper">
		<div id="center">
			<div id="nav">
				<jsp:include page="main.jsp"/>
			</div>
			<div id="content">
				 <jsp:include page="iconStore.jsp"/>
			</div>
			
		</div>
	</div>
</body>
</html>