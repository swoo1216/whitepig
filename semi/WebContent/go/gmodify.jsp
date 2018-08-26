<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/go_frm.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
		document.getElementById("wrapper").style.height = (size - 10) + "px";
	}
	function golist() {
		location.href = "gboard.do";
	}
</script>
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
					<form method="post" action="gmodifyOk.do">
						<table>
							<tr>
								<td>아이디</td>
								<td><input type="text" name="id" value="${sessionScope.id}" readOnly="readOnly"></td>
							</tr>
							<tr>
								<td>제목</td>
								<td><input type="text" name="title" value="${vo.title}"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea name="content" rows="30" cols="100">${vo.content}</textarea></td>
							</tr>
						</table>
						<input type="hidden" value="${vo.bNum}" name="bNum"> <input type="hidden" value="0" name="tNum">
						<button type="button" onclick="golist()">목록</button>
						<button type="submit">수정</button>
					</form>
				</div>
			</div>
			<div id="extra">
				<img src="../ad1.jpg" alt="ad">

			</div>
		</div>
	</div>




</body>
</html>