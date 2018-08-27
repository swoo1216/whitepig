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
#modifyInfo
{

}
</style>
<body>
<div id = "modifyInfo">
<a href="/semi/mmodify.do">[회원정보 수정하기]</a> 
</div>
<div id="nic">
	<h1 style= "text-align: center; margin-top:30px; font-size:150px;"><%=session.getAttribute("nic")%></h1>
	<br><br>
</div>
<div id="info">
[게시글 : <a href=""><%= session.getAttribute("boardcount") %></a>]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[댓  글 : <a href=""><%= session.getAttribute("replycount") %></a>]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[포인트 : <%=session.getAttribute("point") %>]
</div>
</body>

</html>