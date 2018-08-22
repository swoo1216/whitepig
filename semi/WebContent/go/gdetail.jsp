<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_frm.css">
<style type="text/css">
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
</style>
<script type="text/javascript">
	window.onload = function() {
		var size = window.innerHeight || document.body.clientHeight;
		document.getElementById("wrapper").style.height = size + "px";
	}
	function golist() {
		location.href = "gboard.do";
	}
</script>
<title></title>
</head>
<body>
	<div id="wrapper">
		<div id="header"></div>
		<div id="center">
			<div id="nav">
				<div id="title">pants</div>
				<button class="navButton">기동아</button>
				<button class="navButton">넌이제</button>
				<button class="navButton">디디디</button>
				<button class="navButton">자자자</button>
				<button class="navButton">이이이</button>
				<button class="navButton" style="border-bottom: 1px solid white;">너너너</button>
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
							<td height="500px" colspan="2"
								style="text-align: left; vertical-align: top;">${vo.content}</td>
						</tr>
					</table>
					<button type="button" onclick="golist()">목록</button>
					<div id="insertComment">
						<table>
							<tr>
								<td colspan="3">${vo.nic}</td>
							</tr>
							<tr>
								<td width="10%">댓글</td>
								<td width="70%"><textarea rows="5" cols="100"
										name="comment"></textarea></td>
								<td width="20%"><button type="button" onclick="">작성</button></td>
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