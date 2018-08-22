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

#wrapper {
	width: 100%;
	margin: auto;
}

#header {
	background-color: #ffb3b3;
	width: 100%;
	height: 5%;
}

#center {
	width: 100%;
	height: 95%;
	display: flex;
}

#nav {
	background-color: #ffe6e6;
	height: 100%;
	width: 15%;
}

#content {
	padding-top: 5%;
	height: 100%;
	width: 70%;
	height: 95%;
}

#extra {
	padding-top: 2%;
	height: 98%;
	width: 15%;
}

#gtable {
	width: 90%;
	margin: auto;
}

table {
	width: 100%;
	vertical-align: middle;
	border-spacing: 0px;
	border-style: none;
	padding: 0px;
	margin-left: auto;
	margin-right: auto;
}

td, th {
	border-spacing: 0px;
	border-style: none;
	padding: 5px;
	text-align: center;
}

th {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

td {
	border-bottom: 1px solid black;
}

a {
	text-decoration: none;
	color: black;
}

button {
	border: none;
	background-color: #ff6666;
	color: white;
	text-align: center;
	padding: 10px 10px 10px 10px;
	float: right;
	margin-top: 5px;
	cursor: pointer;
}

button:hover {
	background-color: #ff8080;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		var size = window.innerHeight || document.body.clientHeight;
		document.getElementById("wrapper").style.height = size + "px";
		var tr = document.getElementsByTagName("tr");

		for (var i = 0; i < tr.length; i++) {
			if (i == 0)
				continue;
			tr[i].addEventListener("mouseover", function() {
				this.style.backgroundColor = "#ffe6e6";
			}, false);

			tr[i].addEventListener("mouseout", function() {
				this.style.backgroundColor = "white";
			}, false);

			//var children = tr[i].children;

			//for (var j = 0; j < children.length; j++) {
			//	children[j].addEventListener("mouseover", function(){
			//		this.style.cursor = "pointer";
			//	}, false);
			//}
		}
	}
</script>
<body>
	<div id="wrapper">
		<div id="header"></div>
		<div id="center">
			<div id="nav"></div>
			<div id="content">
				<div id="gtable">
					<table>
						<tr>
							<th width="7%">번호</th>
							<th width="59%">제목</th>
							<th width="10%">글쓴이</th>
							<th width="10%">날짜</th>
							<th width="7%">조회</th>
							<th width="7%">추천</th>
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
											<a href="<c:url value='gdetail.do?bNum=${vo.bNum}'/>">${vo.title}</a> &nbsp;[0]</td>
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
			</div>
			<div id="extra">
				<img src="../ad1.jpg" alt="ad">
			</div>
		</div>
	</div>

</body>
</html>