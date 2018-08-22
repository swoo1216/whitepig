<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
* {
	margin: 0px;
	padding: 0px;
	font-family: Comic Sans MS;
}

#wrapper {
	width: 	80%;
	height: 1000px;
	margin: auto;
	display: flex;
}

#nav {
	width: 20%;
	height: 100%;
	background-color: #ff80b3;
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
	<img src="바지.png" style= "height: 100px; margin-left: 66px;">
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
	%>
			<button onclick="location.href='/semi/mlogout.do'" style="background-color: pink;">로그아웃</button>
	<%	}
	%>
	
	</div>
	<ul>
		<li><a href="/semi/sw/index.jsp">LoL</a></li>
		<li><a href="#">Music</a></li>
		<li><a href="#">Pocketmon</a></li>
		<li><a href="#">OldGame</a></li>
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
	<c:when test="${requestScope.code=='fail1'}">
		<script type="text/javascript">
		alert('로그인실패');
		</script>
	</c:when>
	<c:when test="${requestScope.code=='logout'}">
		<script type="text/javascript">
		alert('로그아웃 하셨습니다.');
		</script>
	</c:when>
--%>
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
</c:choose>

</body>
</html>