<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_frm.css?ver=7">
<title>Insert title here</title>

</head>
<body>
	<button type="button" onclick="goGame()">open</button>
	<div id="game" class="modal" style="display: none;">
		<div id="game_modal" class="game_content">
			<canvas id="mycanvas"></canvas>
			<div style="float: right">
				방향키 이동 <br>
				스페이스바 시작
			</div>
		</div>
	</div>
</body>

</html>