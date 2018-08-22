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
	display: flex;
	flex-direction: column;
}

#title{
	font-size: 40px;
	text-align: center;
	height: 30%;
	width: 100%;
	border-bottom: 1px solid white;
}
.navButton{
	margin: 0px;
	font-size: 20px;
	border-top: 1px solid white;
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
	}
</script>
<body>
	<div id="wrapper">
		<div id="header"></div>
		<div id="center">
			<div id="nav">
				<div id="title">
					pants				
				</div>
				<button class="navButton">기동아</button>
				<button class="navButton">넌이제</button>
				<button class="navButton">디디디</button>
				<button class="navButton">자자자</button>
				<button class="navButton">이이이</button>
				<button class="navButton" style="border-bottom:1px solid white;">너너너</button>
			</div>
			<div id="content">
				<div id="gtable">
					<table>
						<tr>
							<td width="8%">제목</td>
							<td>${vo.title}</td>
						</tr>
						<tr>
							<td>글쓴이</td>
							<td>${vo.nic} | 조회 ${vo.hit} | 작성일 ${vo.regdate} | 댓글</td>
						</tr>
						<tr>
							<td height="500px" colspan="2" style="text-align: left; vertical-align: top;">${vo.content}</td>
						</tr>
					</table>
					<div id="insertComment">
						<table>
							<tr>
								<td colspan="3">${vo.nic}</td>
							</tr>
							<tr>
								<td width="10%">댓글</td>
								<td width="70%">
									<textarea rows="5" cols="100" name="comment"></textarea>
								</td>
								<td width="20%"><button type="button" onclick="">뭐하지</button></td>
							</tr>
						</table>
					</div>
					
				</div>
			</div>
			<div id="extra">
				<img src="../ad1.jpg" alt="ad">
			</div>
		</div>
	</div>

</body>
</html>