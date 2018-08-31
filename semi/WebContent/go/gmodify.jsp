<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_frm.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_modal.css?ver=4">
<style type="text/css">
#gtable table tbody td, #gtable table tbody th {
	border-spacing: 0px;
	border-style: none;
	padding: 5px;
	text-align: left;
}

#gtable table tbody th {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

#gtable table tbody td {
	border-bottom: 1px solid black;
}

button {
	border: none;
	background-color: #ff6666;
	color: white;
	text-align: center;
	padding: 10px 10px 10px 10px;
	margin-top: 5px;
	cursor: pointer;
	button: hover{       
	background-color: #ff8080;
}

button:hover {
	background-color: #ff8080;
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
				<form method="post" action="/semi/go/gmodifyOk.do">
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" value="${sessionScope.id}"
								readOnly="readOnly"></td>
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
					<input type="hidden" value="${vo.bNum}" name="bNum"> <input
						type="hidden" value="0" name="tNum">
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
<script src="/semi/js/pantalk.js?ver=4" type="text/javascript"
	charset="UTF-8"></script>
<script type="text/javascript">
	var pt = new pantalk("${sessionScope.id}", "${sessionScope.nic}");
	pt.startCount();
</script>
