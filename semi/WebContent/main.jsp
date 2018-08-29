<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
* {	
	margin: 0px;
	padding: 0px;
	font-family: Comic Sans MS;
}

#wrapper {
	width: 	100%;
	height: 1000px;
	margin: auto;
	display: flex;
}

#nav {
	width: 20%;
	height: 100%;
	background-color: #ff80b3;
	padding: 10px;
}

#content {
	border: 1px solid blue;
	width: 60%;
	height: 100%;
	display: grid;
	padding: 10px;
	grid-template-columns: repeat(2, 1fr);
}

#extra {
	border: 1px solid tomato;
	width: 20%;
	height: 100%;
	padding: 10px;
}
#chat {
	border: 1px solid black;
	width: 80%;
	height: 50%;
	margin-left: 22px;
	margin-top: 20px;
}
#ad{
	border : 1px solid black;
	width: 80%;
	height: 40%;
	margin-left: 22px;
	margin-top: 20px;
}
button{
	padding: 30px;
}
.items{
	margin: 10px;
	border: 1px solid black;
}
ul li{
	list-style-type: none;
	padding: 50px 50px 0 50px;
}
a{
	text-decoration: none;
	color: black;
	font-size: 30px;
}
a:hover{
	background-color: #ff99c2;
}

</style>
<body>
<div id="wrapper">
	<div id="nav">
	<img src="images/바지.png" style= "height: 100px; margin-left: 30%;">
	<div>
		<h1 style="text-align: center; margin-top: 10px">Pants</h1>
	</div>
	<div style="margin-left:auto; margin-right: auto;">
	<%
		String id=(String)session.getAttribute("id");
		if(id==null)
		{
	%>
			<button onclick="location.href='/semi/main/login.jsp'" style="background-color: pink;">로 그 인</button>
			<button onclick="location.href='/semi/main/join.jsp'" style="background-color: pink;">회원가입</button>
	<%
		}
		else
		{
	%>	<div>
			<a href="/semi/mboardcount.do"><%=session.getAttribute("nic") %>님<br>환영합니다!</a><br>
			<button onclick="location.href='/semi/mlogout.do'" style="background-color: pink;">로그아웃</button>
		</div>
	<%	}
	%>
	
	</div>
	<ul>
		<li><a href="#">LoL</a></li>
		<li><a href="#">Music</a></li>
		<li><a href="/semi/poke/list.do">Icon</a></li>
		<li><a href="/semi/poke/pboard.do">Pocketmon</a></li>
		<li><a href="/semi/go/gboard.do">OldGame</a></li>
	</ul>
	</div>
	
	<div id="content">
		<div class="items">
		</div>
		<div class="items">
		</div>
		<div class="items">
		</div>
		<div class="items">
		</div>
	</div>
	<div id="extra">
	<div id="chat"></div>
	<div id="ad"></div>
	</div>
</div>
<c:choose>
	<c:when test="${requestScope.code=='success'}">
		<script type="text/javascript">
		alert('회원가입성공');
		</script>
	</c:when>
	<c:when test="${requestScope.code=='fail'}">
		<script type="text/javascript">
		alert('회원가입실패');
		</script>
	</c:when>
<%-- 
	<c:when test="${requestScope.code=='success1'}">
		<script type="text/javascript">
		alert('로그인성공');
		</script>
	</c:when>
	<c:when test="${requestScope.code=='logout'}">
		<script type="text/javascript">
		alert('로그아웃 하셨습니다.');
		</script>
	</c:when>
--%>
	<c:when test="${requestScope.code=='fail1'}">
		<script type="text/javascript">
		alert('로그인실패');
		</script>
	</c:when>
	<c:when test="${requestScope.code=='esuccess'}">
		<script type="text/javascript">
		alert('당신의 아이디는' + ${id }+'입니다.');
		</script>
	</c:when>
	<c:when test="${requestScope.code=='efail'}">
		<script type="text/javascript">
		alert('등록되지 않은 이메일입니다.');
		</script>
	</c:when>
	<c:when test="${requestScope.code=='psuccess'}">
		<script type="text/javascript">
		alert('당신의 비밀번호는' + ${pwd }+'입니다.');
		</script>
	</c:when>
	<c:when test="${requestScope.code=='pfail'}">
		<script type="text/javascript">
		alert('등록되지 않은 아이디 또는 이메일입니다.');
		</script>
	</c:when>
	<c:when test="${requestScope.code=='wsuccess'}">
		<script type="text/javascript">
		alert('회원탈퇴되셨습니다. 그동안 이용해주셔서 감사합니다.');
		</script>
	</c:when>
	<c:when test="${requestScope.code=='wfail'}">
		<script type="text/javascript">
		alert('회원탈퇴에 실패했습니다.');
		</script>
	</c:when>
</c:choose>

</body>
</html>