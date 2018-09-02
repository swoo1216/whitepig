<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_frm.css?ver=6">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_modal.css?ver=6">

<div class="w3-container w3-padding-32" style="min-height: 865px;">

	<button class="w3-btn w3-round w3-ripple w3-teal" style="width: 80px;"
		onclick="location='/semi/poke/pboard.do'">최신순</button>
	<button class="w3-btn w3-round w3-ripple w3-red" style="width: 80px;"
		onclick="location='/semi/poke/pboard.do?sort=recomm'">추천순</button>
	<button class="w3-btn w3-round w3-ripple w3-blue" style="width: 80px;"
		onclick="location='/semi/poke/pboard.do?sort=hit'">조회순</button>

	<form action="pboard.do" method="post" style="float: right;">
		<select class="w3-round" style="height: 38px; vertical-align: middle;"
			name="search">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="nic">아이디</option>
		</select> <input class="w3-round" type="text" name="keyword"
			style="height: 38px; vertical-align: middle;">
		<button class="w3-btn w3-round w3-ripple w3-teal"
			style="height: 38px;">Search</button>
	</form>

	<table class="w3-table-all w3-margin-top w3-tangerine">

		<c:if test="${list==null }">
			<tr class="w3-leftbar w3-border-teal">
				<td style="width: 5%; vertical-align: middle;"></td>
				<td style="width: 50%; vertical-align: middle;">내용을 입력하세요</td>
				<td style="width: 10%; vertical-align: middle;"><i
					class="fa fa-twitch"> </i></td>
				<td style="width: 10%; vertical-align: middle;"><i
					class="fa fa-thumbs-o-up"> </i></td>
				<td style="width: 10%; vertical-align: middle;"><i
					class="fa fa-check-square-o"> </i></td>
				<td style="width: 15%; vertical-align: middle;"></td>
			</tr>
		</c:if>

		<c:forEach var="vo" items="${list }">
			<c:choose>
				<c:when test="${vo.commCnt!=0 }">
					<tr class="w3-leftbar w3-border-teal">
						<td style="width: 5%; vertical-align: middle;">${vo.bnum }</td>
						<td style="width: 50%; vertical-align: middle;"><a
							href="<%=request.getContextPath() %>/poke/pdetail.do?bnum=${vo.bnum }"
							class="w3-hover-teal" style="text-decoration: none;">${vo.title }</a></td>
						<td style="width: 10%; vertical-align: middle;"><i
							class="fa fa-twitch"> ${vo.commCnt }</i></td>
						<td style="width: 10%; vertical-align: middle;"><i
							class="fa fa-thumbs-o-up"> ${vo.recomm }</i></td>
						<td style="width: 10%; vertical-align: middle;"><i
							class="fa fa-check-square-o"> ${vo.hit }</i></td>
						<td style="width: 15%; vertical-align: middle;"><img
							src="img/${vo.num }.gif" style="width: 40px;"><span
							class="clickPopup" onclick="showPopup('pop${vo.bnum}')">${vo.nic}</span></td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr class="w3-leftbar w3-border-gray">
						<td style="width: 5%; vertical-align: middle;">${vo.bnum }</td>
						<td style="width: 50%; vertical-align: middle;"><a
							href="<%=request.getContextPath() %>/poke/pdetail.do?bnum=${vo.bnum }"
							class="w3-hover-teal" style="text-decoration: none;">${vo.title }</a></td>
						<td style="width: 10%; vertical-align: middle;"><i
							class="fa fa-twitch"> ${vo.commCnt }</i></td>
						<td style="width: 10%; vertical-align: middle;"><i
							class="fa fa-thumbs-o-up"> ${vo.recomm }</i></td>
						<td style="width: 10%; vertical-align: middle;"><i
							class="fa fa-check-square-o"> ${vo.hit }</i></td>
						<td style="width: 15%; vertical-align: middle;"><img
							src="img/${vo.num }.gif" style="width: 40px;"><span
							class="clickPopup" onclick="showPopup('pop${vo.bnum}')">${vo.nic}</span></td>
					</tr>
				</c:otherwise>
			</c:choose>

			<div class="popup" id="pop${vo.bnum}">
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
	</table>

	<button class="w3-btn w3-round w3-ripple w3-teal w3-margin w3-right"
		onclick="document.getElementById('insert').style.display='block'">글쓰기
	</button>


	<!-- 글쓰기 modal -->
	<div id="insert" class="w3-modal">
		<div class="w3-modal-content w3-animate-bottom w3-card-4"
			style="width: 600px;">
			<header class="w3-container w3-teal">
				<span
					onclick="document.getElementById('insert').style.display='none'"
					class="w3-btn w3-round w3-ripple w3-display-topright"><i
					class="fa fa-close"></i></span>
				<h2>글쓰기</h2>
			</header>
			<div class="w3-container w3-margin">
				<form action="pinsert.do?id=${sessionScope.id }" method="post">
					<input type="text" name="title" placeholder="title"
						class="w3-round"><br>
					<textarea rows="10" style="width: 100%; margin-top: 20px;"
						placeholder="content" class="w3-round" name="content"></textarea>

					<button
						class="w3-btn w3-round w3-ripple w3-teal w3-margin w3-right">등록</button>
				</form>
			</div>
		</div>
	</div>


	<div class="w3-container w3-center">
		<div class="w3-bar w3-border w3-round">
			<c:choose>
				<c:when test="${startPage>5 }">
					<a
						href="pboard.do?pageNum=${startPage-1 }&search=${param.search}&keyword=${param.keyword}"
						class="w3-bar-item w3-btn w3-ripple w3-hover-teal"><i
						class="fa fa-chevron-left"></i></a>
				</c:when>
				<c:otherwise>
					<a href="" class="w3-bar-item w3-btn w3-ripple w3-hover-teal"><i
						class="fa fa-chevron-left"></i></a>
				</c:otherwise>
			</c:choose>

			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:choose>
					<c:when test="${pageNum==i }">
						<a
							href="pboard.do?pageNum=${i }&search=${param.search}&keyword=${param.keyword}"
							class="w3-bar-item w3-btn w3-ripple w3-teal w3-hover-teal">${i }</a>
					</c:when>
					<c:otherwise>
						<a
							href="pboard.do?pageNum=${i }&search=${param.search}&keyword=${param.keyword}"
							class="w3-bar-item w3-btn w3-ripple w3-hover-teal">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${endPage<pageCount }">
					<a
						href="pboard.do?pageNum=${endPage+1 }&search=${param.search}&keyword=${param.keyword}"
						class="w3-bar-item w3-btn w3-ripple w3-hover-teal"><i
						class="fa fa-chevron-right"></i></a>
				</c:when>
				<c:otherwise>
					<a href="" class="w3-bar-item w3-btn w3-ripple w3-hover-teal"><i
						class="fa fa-chevron-right"></i></a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<script src="/semi/js/showPop.js" charset="UTF-8"></script>
<script type="text/javascript">
	var deleteModal = document.getElementById("delete_modal");
	document.getElementsByClassName("close")[0].onclick = function() {
		deleteModal.style.display = "none";
	}

	window.onclick = function(event) {
		if (event.target.className == "modal") {
			event.target.style.display = "none";
		}
	}

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
</script>

