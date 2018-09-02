<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var xhr=null;
	function deleteMboard(bnum) {
		var check = confirm("이 글을 삭제하시겠습니까?");
		if(check == true){
			xhr=new XMLHttpRequest();
			xhr.onreadystatechange=deleteMboardOk;
			xhr.open('get','mdelete.do?bnum='+bnum,true);
			xhr.send();
		}else {
			alert("취소하셨습니다.");
			return;
		}
	}
	function deleteMboardOk(){
		if(xhr.readyState==4 && xhr.status==200){
			location.href="/mlist.do";
			var text=xhr.responseText;
			var json=JSON.parse(text);
			if(json.result==1){
				alert("삭제완료");
			}else{
				alert("삭제실패");
			}
		} 
	}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body>
	<div class="w3-container w3-dark-gray">
		<h1>Header</h1>
	</div>
	<div class="w3-container" >
		<table class="w3-table-all w3-striped">
			<thead>
				<tr class="w3-dark-gray">
					<th style="width: 10%">글번호</th>
					<th style="width: 60%">제목</th>
					<th style="width: 10%">조회수</th>
					<th style="width: 10%">작성자</th>
					<th style="width: 10%">삭제</th>
				</tr>
			</thead>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.bnum }</td>
					<td onclick="location.href='mdetail.do?bnum=${vo.bnum }'" style = "cursor:pointer;">${vo.title }</td>
					<td>${vo.hit }</td>
					<td>${vo.id }</td>
					<td><a onclick="deleteMboard('${vo.bnum }')" class="w3-button" ><span class="w3-large"><i class="fa fa-times-rectangle"></i></span></a></td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<c:choose>
				<c:when test="${startpage>10 }">
					<a href="mlist.do?pagenum=${startpage-1 }">[이전]</a>
				</c:when>
				<c:otherwise>
					[이전]
				</c:otherwise>
			</c:choose>
	<c:forEach var="i" begin="${startpage }" end="${endpage }">
			<c:choose>
				<c:when test="${pagenum==i }"><%-- 현재페이지인경우--%>
					<a href="mlist.do?pagenum=${i }"><span style="color:red" >[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href="mlist.do?pagenum=${i }"><span style="color:#555" >[${i }]</span></a>
				</c:otherwise>
			</c:choose>	
			</c:forEach>
			<!-- 다음 -->
			<c:choose>
				<c:when test="${endpage<pagecount }">
					<a href="mlist.do?pagenum=${endpage+1 }">[다음]</a>
				</c:when>
				<c:otherwise>
					[다음]
				</c:otherwise>
			</c:choose>
		</div>
		<div class="w3-right">
			<div class="w3-bar w3-dark-gray" style="width: 200px; margin-top: 50px;">
				<a
					onclick="document.getElementById('writeboard').style.display='block'"
					class="w3-bar-item w3-button" style="width: 50%">글작성</a> <a
					href="main.jsp?page=join.jsp" class="w3-bar-item w3-button"
					style="width: 50%">삭제</a>
			</div>
		</div>
	</div>
	<div id="writeboard" class="w3-modal">
		<div class="w3-modal-content w3-animate-zoom" style="width: 60%">
			<form action="minsert.do"
				class="w3-container w3-card-4 w3-light-grey w3-text-w3-dark-gray">
				
				<h2 class="w3-center w3-dark-grey w3-padding">글작성</h2>
				
				<div class="w3-row w3-section">
				
					<div class="w3-rest">
						<input class="w3-input w3-border" name="title" type="text"
							placeholder="제목">
					</div>
				</div>
				<div class="w3-row w3-section">
				
					<div class="w3-rest">
						<textarea class="w3-input w3-border" name="content" rows="7"
							cols="80" placeholder="내용"></textarea>
					</div>
				</div>
				<div class="w3-row w3-section">
				
					<div class="w3-rest">
						<input class="w3-input w3-border" name="id" type="text"
							placeholder="작성자">
					</div>
				</div>
				<button
					class="w3-button w3-block w3-section w3-dark-gray w3-ripple w3-padding" type="submit">Write</button>
				<a onclick="document.getElementById('writeboard').style.display='none'"
					class="w3-button w3-block w3-section w3-dark-gray w3-ripple w3-padding">닫기</a>					
			</form>
		</div>
	</div>
</body>
</html>
