<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/go_frm.css">
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

#comments {
	margin-top: 30px;
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
				for ( var i in json) {
					var j = json[i];
					var cNum = j.cNum;
					var content = j.content;
					var recomm = j.recomm;
					var id = j.id;
					var nic = j.nic;
					var bNum = j.bNum;
					var countComment = j.countComment;
					var hit = j.hit;
					var date = j.date;

					var table = document.createElement("table");
					var tbody = document.createElement("tbody");
					var tr = document.createElement("tr");

					var td1 = document.createElement("td");
					var td2 = document.createElement("td");
					var td3 = document.createElement("td");
					var td4 = document.createElement("td");

					td1.width = "5%";
					td2.width = "78%";
					td3.width = "7%";
					td4.width = "10%";

					var text1 = document.createTextNode(nic);
					var text2 = document.createTextNode(content);
					console.log(text2);
					var text3 = document.createTextNode(recomm);
					var text4 = document.createTextNode(date);

					var pre = document.createElement("pre");
					pre.appendChild(text2);

					td1.appendChild(text1);
					td2.appendChild(pre);
					td3.appendChild(text3);
					td4.appendChild(text4);

					tr.appendChild(td1);
					tr.appendChild(td2);
					tr.appendChild(td3);
					tr.appendChild(td4);

					tbody.appendChild(tr);
					table.appendChild(tbody);

					comments.appendChild(table);

					var reset = document.getElementById("resetComment");
					reset.innerHTML = "";

					var re_tr1 = document.createElement("td");
					var re_tr2 = document.createElement("td");
					var writer = document.createTextNode("글쓴이");
					var texts = nic + " | 조회 " + hit + " | 작성일 " + date
							+ " | 댓글 " + countComment;
					var count = document.createTextNode(texts);
					re_tr1.appendChild(writer);
					re_tr2.appendChild(count);

					reset.appendChild(re_tr1);
					reset.appendChild(re_tr2);

					document.getElementById("tarea").value = "";
				}
			}
		}
		xhr.open("POST", "gcinsert.do", true);
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xhr.send("id=" + id + "&bNum=" + bNum + "&content=" + content);
	}

	function goRecomm(id, bNum, tNum) {
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var text = xhr.responseText;
				var json = JSON.parse(text);
				
				alert("ㅊㅊ");
			}
		}
		xhr.open("POST", "grecommInsert.do", true);
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xhr.send("id=" + id + "&bNum=" + bNum + "&tNum=" + tNum);
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
						<tr id="resetComment">
							<td>글쓴이</td>
							<td>${vo.nic}|조회${vo.hit} | 작성일 ${vo.regdate} | 댓글 ${vo.countComment}</td>
						</tr>
						<tr>
							<td height="500px" colspan="2" style="text-align: left; vertical-align: top;">${vo.content}</td>
						</tr>
					</table>
					<button type="button" onclick="golist()">목록</button>
					<button type="button" onclick="goRecomm('${vo.id}', ${vo.bNum}, 0)">추천</button>
					<div id="comments">
						<c:forEach var="vo" items="${gclist}">
							<table>
								<tr>
									<td width="5%">${vo.nic}</td>
									<td width="78%"><pre>${vo.content}</pre></td>
									<td width="7%">${vo.recomm}</td>
									<td width="10%">${vo.regdate}</td>
								</tr>
							</table>
						</c:forEach>
					</div>
					<div id="insertComment">
						<form method="post" action="gcinsert.do" name="commentFrm">
							<table>
								<tr>
									<td width="10%">댓글</td>
									<td width="10%">${vo.nic}</td>
									<td width="60%"><textarea rows="5" cols="100" name="content" id="tarea"></textarea></td>
									<td width="20%"><button type="button" onclick="getList()">작성</button></td>
								</tr>
							</table>
							<input type="hidden" name="id" value="${sessionScope.id}"> <input type="hidden" name="bNum" value="${vo.bNum}">
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