<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_frm.css?ver=4">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		var size = window.innerHeight || document.body.clientHeight;
		document.getElementById("wrapper").style.height = (size - 50) + "px";
	}
</script>
</head>
<body>
	<div id="wrapper">
		<div id="header"></div>
		<div id="center">
			<div id="nav"></div>
			<div id="content">
				<canvas id="canvas" width="600" height="800"></canvas>
				<button type="button" onclick="startTet()">시작</button>
				<button type="button" onclick="restart()">재시작</button>
			</div>
		</div>
	</div>
</body>
<script src="/semi/js/tet.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript">
pp.tet.init('${sessionScope.id}');
console.log("pp.id", pp.tet.id);
var go;
var frame = 5;
	function startTet() {
		go = setInterval(function() {
			pp.tet.y++;
			pp.tet.game();
		}, 1000 / frame);
		
	}
	function restart(){
		pp.tet.reset();
	}
</script>
</html>