<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body>
<div>
	<div class="w3-container w3-teal" style="width: 1600px;">
	  <p>관리자페이지</p>
	</div>
	<div class="w3-cell-row" style="width: 1600px; height: 1000px;">
		<div class="w3-cell w3-teal" style="width: 300px; height: 1000px;">	
			<div class="w3-bar-block w3-teal" style="width:100%;">
			  	<a href="#" class="w3-bar-item w3-button">회원목록</a>
			  	<a href="#" class="w3-bar-item w3-button">lol</a>
			  	<a href="../mu/mlist.do" class="w3-bar-item w3-button">music</a>
			  	<a href="#" class="w3-bar-item w3-button">oldgame</a>
			  	<a href="#" class="w3-bar-item w3-button">pocket</a>			  	
			  	<a href="#" class="w3-bar-item w3-button">판매량</a>
			  	<a href="#" class="w3-bar-item w3-button">사용자통계</a>
			  	<a href="#" class="w3-bar-item w3-button">신고접수리스트</a>
			</div>		
		</div>
		<%
			String contentpage=request.getParameter("page");
			if(contentpage==null) contentpage="/mu/mumain.jsp";
		%>
		<div id="content" class="w3-white w3-cell" style="width: 1000px; height: 1000px;">
			<jsp:include page="<%=contentpage %>"/>
		</div>
		<div class="w3-container w3-teal w3-cell w3-cell-bottom" style="width: 300px; height: 1000px;">			
		</div>
	</div>
</div>	
</body> 
</html>