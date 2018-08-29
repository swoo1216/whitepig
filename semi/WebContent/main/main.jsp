<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
* {	
	margin: 0px;
	padding: 0px;
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
	padding: 10px;
}
</style>
<body>
<div id="wrapper">
	<div id="nav">
<nav class="w3-sidebar w3-center w3-bar-block w3-collapse w3-animate-left w3-card w3-pale-red" style="z-index:3;width:20%;" id="mySidebar">
  <a class="w3-bar-item w3-button w3-border-bottom w3-large w3-hover-white" href="/semi/mmain.do"><img src="/semi/바지.png" style="height: 60px;">PANTS</a>
  <a class="w3-bar-item w3-button w3-hide-large w3-large w3-hover-white" href="javascript:void(0)" onclick="w3_close()">Close <i class="fa fa-remove"></i></a>
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
			<img src = "poke/img/<%=session.getAttribute("num") %>.png"
			onclick="document.getElementById('id01').style.display='block'"style = height:50px;>
			<a href="/semi/mboardcount.do"><%=session.getAttribute("nic") %></a>님<br>환영합니다!<br>
			<button onclick="location.href='/semi/mlogout.do'" style="background-color: pink;">로그아웃</button>
		</div>
	<%	}
	%>
	
	</div>
  <a class="w3-bar-item w3-button w3-hover-white" href="#"><img alt="" src="/semi/images/슈퍼마리오아이콘.png" style="width: 50px;">Go</a>
  <a class="w3-bar-item w3-button w3-hover-white" href="/semi/poke/pboard.do"><img alt="" src="/semi/images/포켓몬아이콘.png" style="width: 50px;">Poke</a>
  <a class="w3-bar-item w3-button w3-hover-white" href="/semi/poke/list.do"><img alt="" src="/semi/images/이모티콘아이콘.png" style="width: 50px;">Icon</a>
  <a class="w3-bar-item w3-button w3-hover-white" href="/semi/lol/lboard.do"><img alt="" src="/semi/images/롤아이콘.png" style="width: 50px;">LoL</a>
  <a class="w3-bar-item w3-button w3-hover-white" href="#"><img alt="" src="/semi/images/음악아이콘.png" style="width: 50px;">Music</a>
 </nav>
 
 <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>
</div>

<header class="w3-bar w3-top w3-hide-large w3-pale-red w3-large">
  <div class="w3-bar-item w3-padding-24 w3-wide"></div>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-hover-white w3-padding-24 w3-left" onclick="w3_open()"><i class="fa fa-bars"></i></a>
</header>

 <div class="w3-hide-large" style="margin-top:66px"></div>
 
<div class="w3-main" style="margin-left:200px;" id="content">
     
</div>
</div>
<script type="text/javascript">
	
	//Open and close the sidebar on medium and small screens
	function w3_open() {
	 document.getElementById("mySidebar").style.display = "block";
	 document.getElementById("myOverlay").style.display = "block";
	}
	function w3_close() {
	 document.getElementById("mySidebar").style.display = "none";
	 document.getElementById("myOverlay").style.display = "none";
	}
	
</script>

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