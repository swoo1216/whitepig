<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Puke board</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<header class="w3-container w3-teal">
	<h1>Header</h1>
</header>

<div class="w3-container">
	<table class="w3-table-all w3-hoverable w3-margin-top">
		<thead>
		<tr class="w3-light-grey">
			<th>글번호</th>
			<th>글제목</th>
			<th>아이디</th>
		</tr>
		</thead>
		<tr>
			<td>1</td>
			<td>ㅁㄴㅇㄹ</td>
			<td>ㅁㅁㅁ</td>
		</tr>
		<tr>
			<td>1</td>
			<td>ㅁㄴㅇㄹ</td>
			<td>ㅁㅁㅁ</td>
		</tr>
	</table>
	
	<button class="w3-btn w3-round w3-ripple w3-teal w3-margin w3-right">글쓰기</button>
</div>

	<div class="w3-center">
			<form action="list.do?search=name" method="post">
				<select class="w3-round" style="height: 38px;">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">아이디</option>
				</select>
				<input class="w3-border w3-large w3-round" type="text"
					placeholder="Search for names.." name="keyword"
					style="height: 38px;">
				<button class="w3-btn w3-round w3-ripple w3-teal">Search</button>
			</form>
		</div>
	


<div class="w3-container w3-center">
		<div class="w3-bar w3-border w3-round w3-margin">
			<c:choose>
				<c:when test="${startPage>5 }">
					<a
						href="plist.do?pageNum=${startPage-1 }&search=${param.search}&keyword=${param.keyword}"
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
							href="plist.do?pageNum=${i }&search=${param.search}&keyword=${param.keyword}"
							class="w3-bar-item w3-btn w3-ripple w3-teal w3-hover-teal">${i }</a>
					</c:when>
					<c:otherwise>
						<a
							href="plist.do?pageNum=${i }&search=${param.search}&keyword=${param.keyword}"
							class="w3-bar-item w3-btn w3-ripple w3-hover-teal">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${endPage<pageCount }">
					<a
						href="plist.do?pageNum=${endPage+1 }&search=${param.search}&keyword=${param.keyword}"
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
</body>
</html>