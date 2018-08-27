<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pboard</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<div class="w3-bar w3-top w3-pale-red w3-large" style="z-index:4;">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-white" onclick="myFunction('Demo1')"><i class="fa fa-bars"></i>  Menu</button>
  <span class="w3-bar-item w3-right">Logo</span>
   <button class="w3-bar-item w3-button w3-hide-large w3-hover-white w3-right" onclick="location='/semi/main/join.jsp'"><i class="fa fa-user-plus"></i></button>
   <button class="w3-bar-item w3-button w3-hide-large w3-hover-white w3-right" onclick="location='/semi/main/login.jsp'"><i class="fa fa-user-circle"></i></button>
</div>

	<div id="nav">
<nav class="w3-sidebar w3-center w3-bar-block w3-collapse w3-animate-left w3-card w3-pale-red" style="z-index:3;width:200px;height: 100%;" id="mySidebar">
  <a class="w3-bar-item w3-button w3-large w3-hover-white" href="main.jsp"><img src="/semi/바지.png" style="height: 60px;"></a>
  	<!-- 로그인 회원가입 -->
  	<c:choose>
  		<c:when test="${id!=null }">
  			<img alt="" src="img/1.png" style="width: 50px;margin-top: 30px;"> ${nic}
  			<hr style="border-color: white;">
  		</c:when>
  		<c:otherwise>
  	<div class="w3-bar w3-border w3-border-white" style="display: flex;margin-top: 20px;">
  			<button class="w3-border-right w3-border-white w3-bar-item w3-button w3-hover-white" onclick="location='/semi/main/login.jsp'">로그인</button>
			<button class="w3-bar-item w3-button w3-hover-white" onclick="location='/semi/main/join.jsp'">회원가입</button>
			<hr style="border-color: white;">
	  </div>
  		</c:otherwise>
  	</c:choose>
   
 <a class="w3-bar-item w3-button w3-hover-white" href="#" style="margin-top: 60px;"><img alt="" src="/semi/images/슈퍼마리오아이콘.png" style="width: 50px;"> Go</a>
 	<hr style="border-color: white;">
  <a class="w3-bar-item w3-button w3-hover-white" href="/semi/poke/pboard.do"><img alt="" src="/semi/images/포켓몬아이콘.png" style="width: 50px;"> Poke</a>
  	<hr style="border-color: white;">
  <a class="w3-bar-item w3-button w3-hover-white" href="/semi/poke/list.do"><img alt="" src="img/25.gif" style="width: 50px;"> Icon</a>
	<hr style="border-color: white;">
  <a class="w3-bar-item w3-button w3-hover-white" href="#"><img alt="" src="/semi/images/롤아이콘.png" style="width: 50px;"> LoL</a>
 	<hr style="border-color: white;">	
  <a class="w3-bar-item w3-button w3-hover-white" href="#"><img alt="" src="/semi/images/음악아이콘.png" style="width: 50px;"> Music</a>

 </nav>
 
 <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>

</div>





<div class="w3-main" style="margin-left:200px;margin-top: 43px;" id="content">
   
<div id="Demo1" class="w3-hide w3-pale-red" style="position: absolute;width: 100%;">
	<a class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large" href="#"><img alt="" src="/semi/images/슈퍼마리오아이콘.png" style="width: 30px;"> Go</a>
	<a class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large" href="/semi/poke/pboard.do"><img alt="" src="/semi/images/포켓몬아이콘.png" style="width: 30px;"> Poke</a>
  	<a class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large" href="/semi/poke/list.do"><img alt="" src="img/25.gif" style="width: 30px;"> Icon</a>
  	<a class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large" href="#"><img alt="" src="/semi/images/롤아이콘.png" style="width: 30px;"> LoL</a>
  	<a class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large" href="#"><img alt="" src="/semi/images/음악아이콘.png" style="width: 30px;"> Music</a>
</div>


<div class="w3-container w3-padding-32" style="min-height: 865px;">

	<button class="w3-btn w3-round w3-ripple w3-teal"
		style="width: 80px;"
		onclick="location='/semi/poke/pboard.do?sort=regdate'">최신순</button>
	<button class="w3-btn w3-round w3-ripple w3-red"
		style="width: 80px;"
		onclick="location='/semi/poke/pboard.do?sort=recomm'">추천순</button>
	<button class="w3-btn w3-round w3-ripple w3-blue"
		style="width: 80px;"
		onclick="location='/semi/poke/pboard.do?sort=hit'">조회순</button>
		
	<form action="pboard.do" method="post" style="float: right;">
		<select class="w3-round" style="height: 38px; vertical-align: middle;" name="search">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="nic">아이디</option>
		</select>
		<input class="w3-round" type="text" name="keyword"
			style="height: 38px; vertical-align: middle;">
		<button class="w3-btn w3-round w3-ripple w3-teal" style="height: 38px;">Search</button>
	</form>	

	<table class="w3-table-all w3-margin-top">
	
		<c:if test="${list==null }">
			<tr>
				<td style="width: 5%;vertical-align: middle;"></td>
				<td style="width: 50%;vertical-align: middle;">글을 입력하세요</td>
				<td style="width: 10%;vertical-align: middle;"><i class="fa fa-twitch"> </i></td>
				<td style="width: 10%;vertical-align: middle;"><i class="fa fa-thumbs-o-up"> </i></td>
				<td style="width: 10%;vertical-align: middle;"><i class="fa fa-check-square-o"> </i></td>
				<td style="width: 15%;vertical-align: middle;"></td>
			</tr>
		</c:if>
	
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

<footer class="w3-container w3-pale-red">
	<div class="w3-right">
		<h5>Footer</h5>
	</div>
</footer>
</div>

   

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
	function myFunction(id) {
	    var x = document.getElementById(id);
	    if (x.className.indexOf("w3-show") == -1) {
	        x.className += " w3-show";
	    } else { 
	        x.className = x.className.replace(" w3-show", "");
	    }
	}
</script>
</body>
</html>