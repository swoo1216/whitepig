<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
*
{		
	margin: 0px;
	padding: 0px;
	font - family : Comic Sans MS;
}
#info
{
	text-align:center;	
	font-size : 50px;
}
#getnumber
{
	padding-left :600px;
	font-size : 50px;
}
</style>
<body>

<div id="nic">
	<h1 style= "text-align: center; margin-top:30px; font-size:150px;"><%=session.getAttribute("nic")%></h1>
	<br><br>
</div>
<div id="info">
[게시글]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[댓글]
</div>
<div id="getnumber">
<a href=""><%= session.getAttribute("boardcount") %></a>
<a href=""><%= session.getAttribute("replycount") %></a>
</div>	
	
</body>

</html>