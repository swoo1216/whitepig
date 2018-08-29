<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
<div id = "modifyInfo">
<a href="/semi/main/mypage/modifyInfo.jsp">[회원정보 수정하기]</a>
<a href="<%=request.getContextPath()%>/mmain.do">[메인으로 가기]</a>
</div>
<div id="nic">
	<h1 style= "text-align: center; margin-top:30px; font-size:120px;"><img src = "poke/img/<%=session.getAttribute("num") %>.png" 
	onclick="document.getElementById('id01').style.display='block'"
	style = height:120px;><%=session.getAttribute("nic")%></h1>
	<br><br>
</div>
<div id="info">
[게시글 : <a href="/semi/mlist.do"><%= session.getAttribute("boardcount") %></a>]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[댓  글 : <a href="/semi/mrlist.do"><%= session.getAttribute("commentcount") %></a>]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[포인트 : <%=session.getAttribute("point") %>]
</div>
<c:choose>
	<c:when test="${requestScope.code =='success'}">
		<script>
		alert('비밀번호변경성공')
		</script>
	</c:when>
	<c:when test="${requestScope.code=='fail'}">
		<script>
		alert('비밀번호변경실패')
		</script>
	</c:when>
</c:choose>

<div id="id01" class="w3-modal">
 <div class="w3-modal-content w3-card-4 w3-animate-zoom	">
  <header class="w3-container w3-pale-red"> 
   <span onclick="document.getElementById('id01').style.display='none'" 
   class="w3-button w3-pale-red	 w3-xlarge w3-hover-pale-red w3-display-topright">&times;</span>
   <h2>보유아이콘목록</h2>
  </header>

  <img src = "poke/img/1.gif" style = height:120px;>
  <img src = "poke/img/4.gif" style = height:120px;>
  <img src = "poke/img/7.gif" style = height:120px;>
  <img src = "poke/img/25.gif" style = height:120px;>
  <div class="w3-container w3-pale-red w3-padding w3-center">
  	 <button class="w3-button w3-white w3-border" 
   	onclick="document.getElementById('id01').style.display='none'">바꾸기</button>
  </div>
  </div>
 </div>
</body>
</html>