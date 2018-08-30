<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/go_frm.css?ver=4">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/go_modal.css?ver=4">
<style type="text/css">
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

ul li {
	list-style: none;
}

</style>
<script type="text/javascript">
	window.onload = function() {
		var size = window.innerHeight || document.body.clientHeight;
		document.getElementById("wrapper").style.height = (size - 10) + "px";
		var tr = document.getElementsByTagName("tr");

		for (var i = 0; i < tr.length; i++) {
			if (i == 0)
				continue;
			tr[i].addEventListener("mouseover", function() { //테이블 효과
				this.style.backgroundColor = "#ffe6e6";
			}, false);

			tr[i].addEventListener("mouseout", function() {
				this.style.backgroundColor = "white";
			}, false);
		}
		document.getElementById("scontent").addEventListener('keyup',
				function(e) {
					if (e.keyCode == 13)
						sendScontent()
				}, false);
		function showPopup(popNum) { // 팝업띄우기
			var popup = document.getElementsByClassName("popup");

			for (var i = 0; i < popup.length; i++) {
				popup[i].style.display = "none";
			}

			var popNum = document.getElementById(popNum);
			popNum.style.display = "block";
			popNum.style.position = "absolute";
			popNum.style.top = event.clientY + "px";
			popNum.style.left = (event.clientX + 30) + "px";
		}
	}
	function sendSort(sort) {
		location.href = "/semi/go/gboard.do?pageNum=${pageNum}&sort=" + sort
				+ "&search=${search}&scontent=${scontent}";
	}
	function sendScontent() {
		var search = document.getElementById("search").value;
		var scontent = document.getElementById("scontent").value;

		location.href = "/semi/go/gboard.do?pageNum=${pageNum}&sort=${sort}&search="
				+ search + "&scontent=" + scontent;
	}
</script>
<body>
	<div id="wrapper">
		<div id="header"></div>
		<div id="center">
			<div id="nav"></div>
			<div id="content">
				<div id="gtable">
					<button onclick="sendSort('regdate')">최신순</button>
					<button onclick="sendSort('hit')">조회순</button>
					<button onclick="sendSort('recomm')">추천순</button>
					<button onclick="sendScontent()">검색^^</button>
					<select id="search" style="height: 23px">
						<option value="content" <c:if test="${search == 'content'}">selected</c:if>>내용</option>
						<option value="nic" <c:if test="${search == 'nic'}">selected</c:if>>글쓴이</option>
						<option value="title" <c:if test="${search == 'title'}">selected</c:if>>제목</option>
					</select> <input type="text" id="scontent" value="${scontent}" style="height: 20px">
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
									<td colspan="6">게시물이 존재 하지 않아 하나 좀 써봐</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="vo" items="${list}">
									<tr>
										<td>${vo.bNum}</td>
										<td style="text-align: left;"><a href="/semi/go/gdetail.do?bNum=${vo.bNum}&tNum=0">${vo.title}</a> &nbsp;[${vo.countComment}]</td>
										<td><span class="clickPopup" onclick="showPopup('pop${vo.bNum}')">${vo.nic}</span></td>
										<td>${vo.regdate}</td>
										<td>${vo.hit}</td>
										<td>${vo.recomm}</td>
									</tr>
									<div class="popup" id="pop${vo.bNum}">
										<div class="popstyle">
											<ul>
												<li><a href="javascript:sendMsg('${sessionScope.id}','${sessionScope.nic}', '${vo.id}', '${vo.nic}')">쪽지보내기</a></li>
												<li><a href="">신고하기</a></li>
											</ul>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<c:choose>
						<c:when test="${empty sessionScope.id}">
							<button type="button" onclick="location.href = '/semi/go/index.jsp';">로그인</button>
						</c:when>
						<c:otherwise>
							<button type="button" onclick="location.href = '/semi/go/ginsert.jsp';">글쓰기</button>
						</c:otherwise>
					</c:choose>
					<div style="text-align: center">
						<c:choose>
							<c:when test="${startPage>10}">
								<a href="/semi/go/gboard.do?pageNum=${startPage-1}&sort=${sort}&search=${search}&scontent=${scontent}">[&lt;]</a>
							</c:when>
							<c:otherwise>
								[&lt;]
							</c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:choose>
								<c:when test="${pageNum == i}">
							[<a href="/semi/go/gboard.do?pageNum=${i}&sort=${sort}&search=${search}&scontent=${scontent}">${i}</a>]
						</c:when>
								<c:otherwise>
							[<a href="/semi/go/gboard.do?pageNum=${i}&sort=${sort}&search=${search}&scontent=${scontent}">${i}</a>]
						</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${endPage<pageCount}">
								<a href="/semi/go/gboard.do?pageNum=${endPage+1}&sort=${sort}&search=${search}&scontent=${scontent}">[&gt;]</a>
							</c:when>
							<c:otherwise>
								[&gt;]
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<div id="extra">
				<img src="../ad1.jpg" alt="ad">
			</div>
		</div>
	</div>
</body>
<script src="/semi/js/pantalk.js?ver=4" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript">
	var pt = new pantalk("${sessionScope.id}", "${sessionScope.nic}");
	pt.startCount();
</script>
</html>