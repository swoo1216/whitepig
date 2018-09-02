<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_frm.css?ver=1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_modal.css?ver=1">
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

.mybutton {
	border: none;
	background-color: #ff6666;
	color: white;
	text-align: center;
	padding: 10px 10px 10px 10px;
	margin-top: 5px;
	cursor: pointer;
	float: right;
}

.mybutton:hover {
	background-color: #ff8080;
}
</style>
<div id="gtable">
	<button class="mybutton" onclick="sendSort('bNum')">최신순</button>
	<button class="mybutton" onclick="sendSort('hit')">조회순</button>
	<button class="mybutton" onclick="sendSort('recomm')">추천순</button>
	<button class="mybutton" onclick="sendScontent()">검색^^</button>
	<select id="search" style="height: 23px">
		<option value="content"
			<c:if test="${search == 'content'}">selected</c:if>>내용</option>
		<option value="nic" <c:if test="${search == 'nic'}">selected</c:if>>글쓴이</option>
		<option value="title"
			<c:if test="${search == 'title'}">selected</c:if>>제목</option>
	</select> <input type="text" id="scontent" value="${scontent}"
		style="height: 20px">
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
						<td style="text-align: left;"><a
							href="gdetail.do?bNum=${vo.bNum}&tNum=0">${vo.title}</a>
							&nbsp;[${vo.countComment}]</td>
						<td><span class="clickPopup"
							onclick="showPopup('pop${vo.bNum}')">${vo.nic}</span></td>
						<td>${vo.regdate}</td>
						<td>${vo.hit}</td>
						<td>${vo.recomm}</td>
					</tr>
					<div class="popup" id="pop${vo.bNum}">
						<div class="popstyle">
							<ul>
								<li><a
									href="javascript:sendMsg('${sessionScope.id}','${sessionScope.nic}', '${vo.id}', '${vo.nic}')">쪽지보내기</a></li>
								<li><a
									href="javascript:sendReport('${sessionScope.id}','${sessionScope.nic}', '${vo.id}', '${vo.nic}')">신고하기</a></li>
							</ul>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<c:choose>
		<c:when test="${empty sessionScope.id}">
			<button class="mybutton" type="button"
				onclick="location.href='/semi/poke/main.jsp?page=/main/login.jsp';">로그인</button>
		</c:when>
		<c:otherwise>
			<button type="button" class="mybutton"
				onclick="location.href = '/semi/poke/main.jsp?page=/go/ginsert.jsp';">글쓰기</button>
		</c:otherwise>
	</c:choose>
	<div style="text-align: center">
		<c:choose>
			<c:when test="${startPage>10}">
				<a
					href="/go/gboard.do?pageNum=${startPage-1}&sort=${sort}&search=${search}&scontent=${scontent}">[&lt;]</a>
			</c:when>
			<c:otherwise>
								[&lt;]
							</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:choose>
				<c:when test="${pageNum == i}">
							[<a
						href="/semi/go/gboard.do?pageNum=${i}&sort=${sort}&search=${search}&scontent=${scontent}">${i}</a>]
						</c:when>
				<c:otherwise>
							[<a
						href="/semi/go/gboard.do?pageNum=${i}&sort=${sort}&search=${search}&scontent=${scontent}">${i}</a>]
						</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${endPage<pageCount}">
				<a
					href="/semi/go/gboard.do?pageNum=${endPage+1}&sort=${sort}&search=${search}&scontent=${scontent}">[&gt;]</a>
			</c:when>
			<c:otherwise>
								[&gt;]
							</c:otherwise>
		</c:choose>
	</div>
</div>

<script src="/semi/js/showPop.js?ver=1" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript">
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
	document.getElementById("scontent").addEventListener("keyup", function() {
		if (event.keyCode == 13)
			sendScontent()
	}, false);
	
	var clickPopup = document.getElementsByClassName("clickPopup"); // 마우스포인터 효과
	for (var i = 0; i < clickPopup.length; i++) {
		clickPopup[i].addEventListener("mouseover", function() { // 팝업
			this.style.cursor = "pointer";
		}, false);
	}

	var popup = document.getElementsByClassName("popup");

	for (var i = 0; i < popup.length; i++) { // 마우스 떠나면 꺼지기
		popup[i].addEventListener("mouseleave", function() {
			this.style.display = "none";
		}, false);
	}

	if (event.target.className == "modal") {
		event.target.style.display = "none";
	}

	function showPopup(popNum) { // 팝업띄우기
		var popup = document.getElementsByClassName("popup");

		for (var i = 0; i < popup.length; i++) {
			popup[i].style.display = "none";
		}

		var popNum = document.getElementById(popNum);
		popNum.style.display = "block";
		popNum.style.position = "absolute";
		popNum.style.top = (event.pageY + 20) + "px";
		popNum.style.left = (event.pageX - 40) + "px";
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