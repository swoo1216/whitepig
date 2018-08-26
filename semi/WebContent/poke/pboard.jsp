<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

 
 
   


<header class="w3-container w3-teal">
	<h1>Header</h1>
</header>

<div class="w3-container">
	<table class="w3-table-all w3-margin-top">
	<c:forEach var="vo" items="${list }">
		<tr>
			<td style="width: 5%;vertical-align: middle;">${vo.bnum }</td>
			<td style="width: 50%;vertical-align: middle;"><a href="<%=request.getContextPath() %>/poke/pdetail.do?bnum=${vo.bnum }" class="w3-hover-teal" style="text-decoration: none;">${vo.title }</a></td>
			<td style="width: 10%;vertical-align: middle;"><i class="fa fa-twitch"> ${vo.commCnt }</i></td>
			<td style="width: 10%;vertical-align: middle;"><i class="fa fa-thumbs-o-up"> ${vo.recomm }</i></td>
			<td style="width: 10%;vertical-align: middle;"><i class="fa fa-check-square-o"> ${vo.hit }</i></td>
			<td style="width: 15%;vertical-align: middle;"><img src="img/${vo.num }.gif" style="width: 40px;"> ${vo.nic }</td>
		</tr>
		</c:forEach>
	</table>
	
	<button class="w3-btn w3-round w3-ripple w3-teal w3-margin w3-right" 
		onclick="document.getElementById('insert').style.display='block'">글쓰기
	</button>
</div>
	
	<!-- 글쓰기 modal -->
	<div id="insert" class="w3-modal">
		<div class="w3-modal-content w3-animate-bottom w3-card-4" style="width: 600px;">
			<header class="w3-container w3-teal">
				<span onclick="document.getElementById('insert').style.display='none'"
					class="w3-btn w3-round w3-ripple w3-display-topright"><i class="fa fa-close"></i></span>
				<h2>글쓰기</h2>
			</header>
			<div class="w3-container w3-margin">
			<form action="pinsert.do?id=${sessionScope.id }" method="post">
				<input type="text" name="title" placeholder="title" class="w3-round w3-margin"><br>
	 			<textarea rows="10" cols="50" placeholder="content" class="w3-round w3-margin" name="content"></textarea>
	 			
	 			<button class="w3-btn w3-round w3-ripple w3-teal w3-margin w3-right">등록</button>
	 		</form>
			</div>
		</div>
	</div>

	<div class="w3-center">
			<form action="pboard.do" method="post">
				<select class="w3-round" style="height: 38px; vertical-align: middle;" name="search">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="nic">아이디</option>
				</select>
				<input class="w3-round" type="text"
					placeholder="Search for names.." name="keyword"
					style="height: 38px; vertical-align: middle;">
				<button class="w3-btn w3-round w3-ripple w3-teal" style="height: 38px;">Search</button>
			</form>
		</div>
	


<div class="w3-container w3-center">
		<div class="w3-bar w3-border w3-round w3-margin">
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


<footer class="w3-container w3-teal w3-bottom">
	<h5>Footer</h5>
</footer>

</div>