<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		vertical-align: middle !important;
	}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div id="wrapper">
	<div id="nav">
<nav class="w3-sidebar w3-center w3-bar-block w3-collapse w3-animate-left w3-card w3-pale-red" style="z-index:3;width:250px;" id="mySidebar">
  <a class="w3-bar-item w3-button w3-border-bottom w3-large w3-hover-white" href="main.jsp"><img src="/semi/바지.png" style="height: 80px;"></a>
  <a class="w3-bar-item w3-button w3-hide-large w3-large w3-hover-white" href="javascript:void(0)" onclick="w3_close()">Close <i class="fa fa-remove"></i></a>
  <a class="w3-bar-item w3-button w3-hover-white" href="#">Link 1</a>
  <a class="w3-bar-item w3-button w3-hover-white" href="main.jsp?content=/poke/pboard.do">Link 2</a>
  <a class="w3-bar-item w3-button w3-hover-white" href="main.jsp?content=/poke/list.do">Link 3</a>
  <a class="w3-bar-item w3-button w3-hover-white" href="#">Link 4</a>
  <a class="w3-bar-item w3-button w3-hover-white" href="#">Link 5</a>
 </nav>
 
 <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>
</div>

<header class="w3-bar w3-top w3-hide-large w3-pale-red w3-xlarge">
  <div class="w3-bar-item w3-padding-24 w3-wide"></div>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-24 w3-left" onclick="w3_open()"><i class="fa fa-bars"></i></a>
</header>

 <div class="w3-hide-large" style="margin-top:83px"></div>
 
<div class="w3-main" style="margin-left:250px;" id="content">

<c:choose>
<c:when test="${empty param.content}">
	<c:set var="content" value="main.html"/>
</c:when>
<c:otherwise>
	
	<c:set var="content" value="${param.content}"/>
			
</c:otherwise>
</c:choose>

<jsp:include page="${content }"></jsp:include>


     


<script type="text/javascript">
	
	//Open and close the sidebar on medium and small screens
	function w3_open() {
	 document.getElementById("mySidebar").style.display = "block";
	 document.getElementById("myOverlay").style.display = "block";
	}
	function w3_close() {
	 document.getElementById("mySidebar").style.display = "none";
	 document.getElementById("myOverlay").style.display = "none";
	}
	
</script>

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
				${id }
				<input type="text" name="title" placeholder="title" class="w3-round w3-margin"><br>
	 			<textarea rows="10" cols="50" placeholder="content" class="w3-round w3-margin" name="content"></textarea>
	 			
	 			<a class="w3-btn w3-round w3-ripple w3-teal w3-margin" href="pboard.jsp">취소</a>
	 			<button class="w3-btn w3-round w3-ripple w3-teal w3-margin w3-right">등록</button>
	 		</form>
			</div>
		</div>
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

</div>
</div>

</body>
</html>