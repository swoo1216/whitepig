<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#main {
	display: grid;
	width: 100%;
	height: 100%;
	grid-template-columns: repeat(2, 1fr);
}

div {
	border: 1px solid black;
}

.items {
	
}

.items2 {
	margin: 5% 15% 5% 15%;
}
</style>
<div id="main">
	<div class="items">
		<div class=items2>
			<div>
				<a href="#">고전게임갤러리</a>
			</div>
			<div>
				<table>
					<tr>
						<th>제목</th>
						<th>닉네임</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="vo" items="${glist}">
					<tr>
						<td>${vo.title }</td>
						<td>${vo.nic }</td>
						<td>${vo.hit }</td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<div class="items">
		<div class=items2>
			<div>
				<a href="#">포켓몬갤러리</a>
			</div>
		</div>
	</div>
	<div class="items">
		<div class=items2>
			<div>
				<a href="#">롤갤러리</a>
			</div>
		</div>
	</div>
	<div class="items">
		<div class=items2>
			<div>
				<a href="#">음악갤러리</a>
			</div>
		</div>
	</div>
</div>