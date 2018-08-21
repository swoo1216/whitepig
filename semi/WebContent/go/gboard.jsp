<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

#wrapper {
	width: 100%;
	height: 100%;
	margin: auto;
}

#header {
	background-color: #ff80df;
	width: 100%;
	height: 60px;
}

#center {
	width: 100%;
	height: 800px;
	display: flex;
}

#nav {
	height: 100%;
	width: 15%;
}

#content {
	padding-top: 50px; height : 100%;
	width: 70%;
	height: 100%;
}

#extra {
	height: 100%;
	width: 15%;
}

table {
	width: 100%;
	text-align: center;
	font-size: 30px;
}
</style>
<script type="text/javascript">
	
</script>
<body>
	<div id="wrapper">
		<div id="header"></div>
		<div id="center">
			<div id="nav"></div>
			<div id="content">
				<table>
					<tr style="background-color: #ffccf2">
						<th width="10%">번호</th>
						<th width="10%">아이디</th>
						<th width="60%">제목</th>
						<th width="10%">조회</th>
						<th width="10%">추천</th>
					</tr>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="5">게시물이 존재 하지 않아 하나 좀 써봐</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="vo" items="${list}">
								<tr>
									<td>${vo.bNum}</td>
									<td>${vo.id}</td>
									<td>${vo.title}</td>
									<td>${vo.hit}</td>
									<td>${vo.recomm}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				<button type="button" onclick="location.href = 'ginsert.jsp';">글쓰기</button>
			</div>
			<div id="extra"></div>
		</div>
	</div>

</body>
</html>