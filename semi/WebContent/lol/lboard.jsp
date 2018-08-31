<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_frm.css?ver=4">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_modal.css?ver=4">
<div class="w3-container w3-padding-32" style="min-height: 865px;">

	<!-- 	<button class="w3-btn w3-round w3-ripple w3-teal"
		style="width: 80px;"
		onclick="location='/semi/lol/lboard.do?sort=regdate'">최신순</button> -->
	<button class="w3-btn w3-round w3-ripple w3-red" style="width: 80px;"
		onclick="location='/semi/lol/lboard.do?sort=recomm'">추천순</button>
	<button class="w3-btn w3-round w3-ripple w3-blue" style="width: 80px;"
		onclick="location='/semi/lol/lboard.do?sort=hit'">조회순</button>

	<form action="lboard.do" method="post" style="float: right;">
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

	<table class="w3-table-all w3-margin-top">

		<c:if test="${list==null }">
			<tr>
				<td style="width: 5%; vertical-align: middle;"></td>
				<td style="width: 50%; vertical-align: middle;">글을 입력하세요</td>
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
			<tr>
				<td style="width: 5%; vertical-align: middle;">${vo.bnum }</td>
				<td style="width: 50%; vertical-align: middle;"><a
					href="<%=request.getContextPath() %>/lol/ldetail.do?bnum=${vo.bnum }"
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
				<form action="linsert.do?id=${sessionScope.id }" method="post">
					<input type="text" name="title" placeholder="title"
						class="w3-round w3-margin"><br>
					<textarea rows="10" cols="50" placeholder="content"
						class="w3-round w3-margin" name="content"></textarea>

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
						href="lboard.do?pageNum=${startPage-1 }&search=${param.search}&keyword=${param.keyword}"
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
							href="lboard.do?pageNum=${i }&search=${param.search}&keyword=${param.keyword}"
							class="w3-bar-item w3-btn w3-ripple w3-teal w3-hover-teal">${i }</a>
					</c:when>
					<c:otherwise>
						<a
							href="lboard.do?pageNum=${i }&search=${param.search}&keyword=${param.keyword}"
							class="w3-bar-item w3-btn w3-ripple w3-hover-teal">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${endPage<pageCount }">
					<a
						href="lboard.do?pageNum=${endPage+1 }&search=${param.search}&keyword=${param.keyword}"
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



