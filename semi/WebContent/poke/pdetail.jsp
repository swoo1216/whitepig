<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdetail</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<header class="w3-container w3-teal">
	<h1>Header</h1>
</header>
<div class="w3-main">
<div class="w3-container">

<div class="w3-panel w3-border">

	<img src="img/${vo.num }.png" style="width: 50px;margin-top: 10px;"> ${vo.nic }
	<i class="fa fa-check-square-o w3-right fa-lg w3-margin"> ${vo.hit }</i>
	<i class="fa fa-twitch w3-right fa-lg w3-margin">  ${vo.commCnt }</i>

<hr style="border-color: teal;">
	<h4>글제목</h4>
<hr style="border-color: teal;">

<div class="w3-panel w3-teal w3-round-xlarge w3-margin w3-padding-64">
	<div class="w3-margin">
		${vo.content }
	</div>
</div>

</div>

<div class="w3-panel w3-border">
	
	<h5>Comments</h5>
	<hr style="border-color: teal;">

<c:forEach var="vo" items="${list }">
<div class="w3-panel w3-teal w3-round-xlarge w3-margin">
	<div class="w3-margin">
	<img src="img/${vo.num }.png" style="width: 50px;"> ${vo.nic }
		<p>${vo.content }</p>
		</div>
</div>
</c:forEach>
<div class="w3-margin">
	<textarea rows="5" cols="50" class="w3-round" placeholder="comment"></textarea><br>
	<button class="w3-btn w3-round w3-ripple w3-teal">등록</button>
</div>
</div>
</div>

<footer class="w3-container w3-teal w3-padding-32">
	<h5>Footer</h5>
</footer>



</div>

</body>
</html>