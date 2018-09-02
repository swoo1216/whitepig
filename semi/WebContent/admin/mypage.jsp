<%@page import="pp.main.vo.MainVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<% MainVo infovo=(MainVo)session.getAttribute("infovo"); %>
<div>
  <div class="w3-dark-gray">
    <h2><%=infovo.getNic()%>님 안녕하세요.</h2>
    <div line-height:200% >
    	<a href="#">게시글</a>
    	<a href="#">댓글</a>
    	<a href="modifyuser.do?id=<%=session.getAttribute("id")%>" >회원수정</a>
    	<a href="logout.do">로그아웃</a>
    </div>   
  </div>
</div>
</body>
</html>