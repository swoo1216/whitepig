<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body>
	<div class="w3-teal">
		<h1>회원정보</h1>
	</div>
	<div class="w3-container">
		<table class="w3-table-all w3-striped">
			<thead>
				<tr class="w3-teal">
					<th style="width: 10%">ID</th>
					<th style="width: 25%">Nick Name</th>
					<th style="width: 25%">E-Mail</th>
					<th style="width: 10%">Point</th>
					<th style="width: 10%">권한</th>
					<th style="width: 20%">가입일</th>
				</tr>
			</thead>
			<c:forEach var="vo" items="${adminlist }">
				<tr onclick="document.getElementById('detailuser${vo.id}').style.display='block'">
					<td>${vo.id }</td>
					<td>${vo.nic }</td>
					<td>${vo.email }</td>
					<td>${vo.point }</td>
					<td>${vo.clss }</td>
					<td>${vo.regdate }</td>
				</tr>
				<div  class="w3-container w3-modal" id="detailuser${vo.id}">
					<div class="w3-modal-content w3-animate-zoom w3-margin-top" style="width: 80%">	
					<form class="w3-container" action="modifyuser.do">
						<div class="w3-section">
							<label style="hidden"><b>id</b></label> <input class="w3-input w3-border"
								type="text" name="detailid" id="detailid" value="${vo.id }" readonly="readonly" style="background-color:  fuchsia;">
							<label><b>Password</b></label> <input class="w3-input w3-border"
								type="password" name="detailpwd" id="detailpwd" value="${vo.pwd }" required>
							<label><b>Nickname</b></label> <input class="w3-input w3-border"
								type="text" name="detailemail" id='detailemail' value="${vo.nic }" required>
							<label><b>E-Mail</b></label> <input class="w3-input w3-border"
								type="text" name="detailnic" id="detailnic" value="${vo.email }">
							<label><b>class</b></label> <input class="w3-input w3-border"
								type="text" name="detailclss" id="detailclss" value="${vo.clss }">
							<label><b>Point</b></label> <input class="w3-input w3-border"
								type="text" name="detailpoint" id="detailpoint" value="${vo.point }">
							<label><b>regdate</b></label> <input class="w3-input w3-border"
								type="text" name="detailregdate" id="detailregdate" value="${vo.regdate }" readonly="readonly">
							<label><b>Icon</b></label> <input class="w3-input w3-border"
								type="text" name="detailicon" id="detailicon" value="${vo.num }">
							<button class="w3-button w3-block w3-green w3-section w3-padding"
								type="submit" onclick="modifyuser.do">Modify</button>
							<button
								onclick="document.getElementById('detailuser${vo.id}').style.display='none'"
								type="button"
								class="w3-button w3-block w3-teal w3-section w3-padding">Cancel</button>
						</div>		
					</form>
					</div>
				</div>		
			</c:forEach>
		</table>
		<div class="w3-right">
			<form action="usersearch.do" onsubmit="return searchvalue()">
				<select name="searchvalue">
					<option value="id">ID</option>
					<option value="nic">NickName</option>
					<option value="email">E-Mail</option>
					<option value="clss">권한</option>					
				</select>
				<input class="w3-input w3-border" type="text" name="searchinfo" id="searchinfo" required>
				<input class="w3-button" type="submit" value="조회"></div>
				<div class="w3-bar w3-teal" style="width: 200px; margin-top: 50px;">
			</form>
				<a
					onclick="document.getElementById('writeboard').style.display='block'"
					class="w3-bar-item w3-button" style="width: 50%">회원추가</a> <a
					href="main.jsp?page=join.jsp" class="w3-bar-item w3-button"
					style="width: 50%">회원삭제</a>
			</div>
		</div>
		<div>
			<c:choose>
				<c:when test="${startPage>10 }">
					<a href="userlist.do?pageNum=${startPage-1 }">[이전]</a>
				</c:when>
				<c:otherwise>
					[이전]
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:choose>
				<c:when test="${pageNum==i }"><%-- 현재페이지인경우--%>
					<a href="userlist.do?pageNum=${i }"><span style="color:red" >[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href="userlist.do?pageNum=${i }"><span style="color:#555" >[${i }]</span></a>
				</c:otherwise>
			</c:choose>	
			</c:forEach>
			<!-- 다음 -->
			<c:choose>
				<c:when test="${endPage<pageCount }">
					<a href="userlist.do?pageNum=${endPage+1 }">[다음]</a>
				</c:when>
				<c:otherwise>
					[다음]
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div id="writeboard" class="w3-modal">
		<div class="w3-modal-content w3-animate-zoom" style="width: 80%">
		<form class="w3-container" action="adminjoin.do">
			<div class="w3-section">
				<label><b>id</b></label> <input class="w3-input w3-border"
					type="text" placeholder="Enter Username" name="id" id="id" onkeyup="infocheck('id')" required>
					<div id="idcheck" style="font-size:12px; font-weight:bold;"></div>									
				<label><b>Password</b></label> <input class="w3-input w3-border"
					type="password" placeholder="Enter Password" name="pwd" id="pwd" required>
				<label><b>E-Mail</b></label> <input class="w3-input w3-border"
					type="text" placeholder="Enter E-Mail" name="email" required>
				<label><b>Nickname</b></label> <input class="w3-input w3-border"
					type="text" placeholder="Enter Nickname" name="nic" id="nic" onkeyup="infocheck('nic')" required>
					<div id="niccheck" style="font-size:12px; font-weight:bold;"></div>			
				<button class="w3-button w3-block w3-green w3-section w3-padding"
					type="submit" onclick="return ckcommit()">Join</button>
				<button
					onclick="document.getElementById('writeboard').style.display='none'"
					type="button"
					class="w3-button w3-block w3-teal w3-section w3-padding">Cancel</button>
			</div>		
		</form>
		</div>
			<div class="w3-container w3-teal">
		<h5>Footer</h5>
	</div>
	</div>	

</body>
</html>
