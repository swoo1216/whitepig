<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%
	String page1=request.getParameter("page");
	if(page1==null) page1="main.html";
%>
<!-- 로그인기능을 메뉴로 추가하고 로그인/로그아웃기능을 추가해보세요. -->
<table >
	<tr>
		<td>
			<jsp:include page="main.jsp"></jsp:include>
		</td>
	</tr>
	<tr>
		<td>
			
		</td>
	</tr>
</table>
</body>
</html>