<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

@font-face {
	font-family: 'NanumGothic';
	src: url('images/NanumGothic.eot');
	src: url('images/NanumGothic.eot?#iefix') format('embedded-opentype'),
		url('images/NanumGothic.woff') format('woff'),
		url('images/NanumGothic.ttf') format('truetype');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'NanumGothic';
}

#wrapper {
	width: 100%;
	height: 100%;
	margin: auto;
}

#header {
	background-color: #ffb3b3;
	width: 100%;
	height: 60px;
}

#center {
	width: 100%;
	height: 800px;
	display: flex;
}

#nav {
	height: 100%;
	width: 15%;
}

#content {
	padding-top: 50px;
	height: 100%;
	width: 70%;
	height: 100%;
}

#extra {
	height: 100%;
	width: 15%;
}

table {
	width: 100%;
	vertical-align: middle;
	border-spacing: 0px;
	border-style: none;
	padding: 0px;
}

td, th {
	border-spacing: 0px;
	border-style: none;
	padding: 5px;
	text-align: center;
}
th{
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}
td{
	border-bottom: 1px solid black;
}
a{
	text-decoration: none;
	color: black;
}
</style>
<script type="text/javascript">
	window.onload = function(){
		var tr = document.getElementsByTagName("tr");
		
		for(var i in tr){
			console.log(tr);
			console.log(tr[i]);
			console.log(i);
			if(i == 0)
				continue;
			tr[i].addEventListener("mouseover", function(){
				this.style.backgroundColor = "#ffe6e6";
			}, false);
			
			tr[i].addEventListener("mouseout", function(){
				this.style.backgroundColor = "white";
			}, false);
		}
	}
</script>
<body>
	<div id="wrapper">
		<div id="header"></div>
		<div id="center">
			<div id="nav"></div>
			<div id="content">
				<table>
					<tr>
						<th width="8%">번호</th>
						<th width="58%">제목</th>
						<th width="10%">글쓴이</th>
						<th width="8%">날짜</th>
						<th width="8%">조회</th>
						<th width="8%">추천</th>
					</tr>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="5">게시물이 존재 하지 않아 하나 좀 써봐</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="vo" items="${list}">
								<tr>
									<td>${vo.bNum}</td>
									<td style="text-align: left;">
										<a href="">${vo.title}</a>
									</td>
									<td>${vo.nic}</td>
									<td>${vo.regdate}</td>
									<td>${vo.hit}</td>
									<td>${vo.recomm}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				
				
				
				
				
				<button type="button" onclick="location.href = 'ginsert.jsp';">글쓰기</button>
			</div>
			<div id="extra"></div>
		</div>
	</div>

</body>
</html>