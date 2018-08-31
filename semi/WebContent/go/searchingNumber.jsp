<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>





	<script type="text/javascript">
		var canvas = document.createElement("canvas");
		canvas.width = "500";
		canvas.height = "500";
		canvas.style.border = "1px solid black";
		document.body.appendChild(canvas);
		
		var ctx = canvas.getContext("2d");

		ctx.fillStyle = "white";
		ctx.fillRect(0, 0, canvas.width, canvas.height);
		
		
		ctx.fillStyle = "gray";
		ctx.fillRect(0, 0, 40-2, 40-2);
	</script>



</body>
</html>