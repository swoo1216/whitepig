<%@page import="pp.main.vo.MainVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<style>
body, h1, h2, h3, h4, h5 {
	font-family: "Poppins", sans-serif
}

body {
	font-size: 16px;
}

.w3-half img {
	margin-bottom: -6px;
	margin-top: 16px;
	opacity: 0.8;
	cursor: pointer
}

.w3-half img:hover {
	opacity: 1
}
</style>
<body>
<%-- 	<% MainVo infovo=(MainVo)session.getAttribute("infovo"); %> --%>
	<!-- Sidebar/menu -->
	<nav
		class="w3-sidebar w3-dark-gray w3-collapse w3-top w3-large w3-padding"
		style="z-index:3;width:300px;font-weight:bold;" id="mySidebar">
	<br>
	<a href="javascript:void(0)" onclick="w3_close()"
		class="w3-button w3-hide-large w3-display-topleft"
		style="width: 100%; font-size: 22px">Close Menu</a>
	<div class="w3-container">
		<h3 class="w3-padding-64">
			<b>Admin page </b>
		</h3>
		<c:choose>
			<c:when test="${empty sessionScope.id }">			
				<div class="w3-bar w3-black" style="width: 100%; margin-top: 50px;">
					<a href="adminmain.jsp?page=login.jsp" class="w3-bar-item w3-button"
						style="width: 50%">로그인</a> <a href="adminmain.jsp?page=join.jsp"
						class="w3-bar-item w3-button" style="width: 50%">회원가입</a>
				</div>
			</c:when>
			<c:otherwise>
				<div><a onclick="location.href='adminmain.jsp?page=mypage.jsp'" style="cursor: pointer;">
				<img align="left" src="/semi/poke/img/<%=session.getAttribute("num")%>.png" style="height: 50px">
				<h3><%=session.getAttribute("nic")%></h3></a></div>
				<a href="mainlogout.do" class="w3-bar-item w3-button w3-right" ><span class="w3-xlarge"><i class="fa fa-times-rectangle"></i></span></a>
			</c:otherwise>	
		</c:choose>

		<div class="w3-bar-block">
			<a href="/semi/admin/adminmain.jsp?page=userlist.do" onclick="w3_close()"
				class="w3-bar-item w3-button w3-hover-white">회원목록</a> <!-- <a
				href="#services" onclick="w3_close()"
				class="w3-bar-item w3-button w3-hover-white">pocket</a> <a
				href="#services" onclick="w3_close()"
				class="w3-bar-item w3-button w3-hover-white">oldgame</a> <a
				href="#designers" onclick="w3_close()"
				class="w3-bar-item w3-button w3-hover-white">lol</a> <a
				href="adminmain.jsp?page=mlist.do" onclick="w3_close()"
				class="w3-bar-item w3-button w3-hover-white">music</a>  -->
				<a
				href="/semi/mmmain.do" onclick="w3_close()"
				class="w3-bar-item w3-button w3-hover-white">기본페이지</a>
				
				<a
				href="/semi/admin/adminmain.jsp?page=salsevolume.do" onclick="w3_close()"
				class="w3-bar-item w3-button w3-hover-white">판매량</a>  <a
				href="/semi/admin/adminmain.jsp?page=ListReport.do" onclick="w3_close()"
				class="w3-bar-item w3-button w3-hover-white">신고접수리스트</a>
		</div>
	</nav>

	<!-- Top menu on small screens -->
	<header
		class="w3-container w3-top w3-hide-large w3-dark-gray w3-xlarge w3-padding">
	<a href="javascript:void(0)"
		class="w3-button w3-dark-gray w3-margin-right" onclick="w3_open()">☰</a>
	<span>Admin page</span> </header>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large" onclick="w3_close()"
		style="cursor: pointer" title="close side menu" id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">

		<%
			String contentpage = request.getParameter("page");
			if (contentpage == null)
				contentpage = "userlist.do";
		%>
		<div id="content" class="w3-white w3-cell"
			style="width: 1000px; height: 1000px;">
			<jsp:include page="<%=contentpage%>" />
		</div>
	</div>
	<script>
		// Script to open and close sidebar
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("myOverlay").style.display = "block";
		}

		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("myOverlay").style.display = "none";
		}

		// Modal Image Gallery
		function onClick(element) {
			document.getElementById("img01").src = element.src;
			document.getElementById("modal01").style.display = "block";
			var captionText = document.getElementById("caption");
			captionText.innerHTML = element.alt;
		}
	</script>

</body>
</html>
