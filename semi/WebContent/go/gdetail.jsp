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
	function insertComment() {
		location.href = "gcinsert.do";
	}

	function getList() {
		var id = document.commentFrm.id.value;
		var bNum = document.commentFrm.bNum.value;
		var content = document.commentFrm.content.value;

		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var text = xhr.responseText;
				var json = JSON.parse(text);
				var comments = document.getElementById("comments");
				comments.innerHTML = "";
				for (var i in json) {
					var j = json[i];
					var cNum = j[0].cNum;
					var content = j[1].content;
					var recomm = j[2].recomm;
					var id = j[3].id;
					var nic = j[4].nic;
					var bNum = j[5].bNum;
					var date = j[6].date;
					
					var text1 = document.createTextNode(nic);
					var span1 = document.createElement("span");
					span1.appendChild(text1);
					span1.style.width = "5%";
					comments.appendChild(span1);
					
					var text2 = document.createTextNode(content);
					var span2 = document.createElement("span");
					span2.appendChild(text2);
					span2.style.width = "80%";
					comments.appendChild(span2);
					
					var text3 = document.createTextNode(recomm);
					var span3 = document.createElement("span");
					span3.appendChild(text3);
					span3.style.width = "5%";
					comments.appendChild(span3);
					
					var text4 = document.createTextNode(date);
					var span4 = document.createElement("span");
					span4.appendChild(text4);
					span4.style.width = "5%";
					comments.appendChild(span4);
					comments.appendChild(document.createTextNode("\\r\\n"));
					
					
					//comments.innerHTML += "<td width='5%'>" + nic + "</td>"
					//		+ "<td width='80%'>" + content + "</td>"
					//		+ "<td width='5%''>" + recomm + "</td>"
					//		+ "<td width='10%''>" + date + "</td>";
				}

				console.log("inner", comments.innerHTML);
			}
		}
		xhr.open("POST", "gcinsert.do", true);
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		console.log("ddd");
		xhr.send("id=" + id + "&bNum=" + bNum + "&content=" + content);
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
							<td>${vo.nic}| 조회${vo.hit} | 작성일 ${vo.regdate} | 댓글</td>
						</tr>
						<tr>
							<td height="500px" colspan="2"
								style="text-align: left; vertical-align: top;">${vo.content}</td>
						</tr>
					</table>
					<button type="button" onclick="golist()">목록</button>
					<div id="comments">
						<c:forEach var="vo" items="${gclist}">
							<table>
								<tr>
									<td width="5%">${vo.nic}</td>
									<td width="80%">${vo.content}</td>
									<td width="5%">${vo.recomm}</td>
									<td width="10%">${vo.regdate}</td>
								</tr>
							</table>
						</c:forEach>
					</div>
					<div id="insertComment">
						<form method="post" action="gcinsert.do" name="commentFrm">
							<table>
								<tr>
									<td colspan="3">${vo.nic}</td>
								</tr>
								<tr>
									<td width="10%">댓글</td>
									<td width="70%"><textarea rows="5" cols="100"
											name="content"></textarea></td>
									<td width="20%"><button type="button" onclick="getList()">작성</button></td>
								</tr>
							</table>
							<input type="hidden" name="id" value="${sessionScope.id}">
							<input type="hidden" name="bNum" value="${vo.bNum}">
						</form>
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