<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_frm.css?ver=4">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_modal.css?ver=4">
<div class="w3-container" style="min-height: 865px;">


	<div class="w3-panel w3-border">

		<img src="img/${vo.num }.png" style="width: 50px; margin-top: 10px;">
		<span>${vo.nic }</span> <i
			class="fa fa-check-square-o w3-right fa-lg w3-margin"> ${vo.hit }</i>
		<i class="fa fa-twitch w3-right fa-lg w3-margin"> ${vo.commCnt }</i><br>

		<hr style="border-color: pale-red;">
		<div class="w3-margin">
			${vo.title }
			<div class="w3-right">
				<c:choose>
					<c:when test="${id != null}">
						<c:choose>
							<c:when test="${isrecomm == 'true' }">
								<button class="w3-btn w3-round w3-ripple"
									onclick="location='/semi/lol/lrecommdelete.do?id=${id}&bnum=${vo.bnum }'">
									<i class="fa fa-thumbs-o-down fa-lg"></i>
								</button>
						${vo.recomm }
					</c:when>
							<c:otherwise>
								<button class="w3-btn w3-round w3-ripple"
									onclick="location='/semi/lol/lrecomminsert.do?id=${id}&bnum=${vo.bnum }'">
									<i class="fa fa-thumbs-o-up fa-lg"></i>
								</button>
						${vo.recomm }
					</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<button class="w3-btn w3-round w3-ripple" disabled="disabled">
							<i class="fa fa-thumbs-o-up fa-lg"></i>
						</button>
				${vo.recomm }
			</c:otherwise>
				</c:choose>
			</div>
		</div>

		<hr style="border-color: pale-red;">

		<div
			class="w3-panel w3-pale-red w3-round-xlarge w3-margin w3-padding-32">
			<div class="w3-margin">
				${vo.content }
				<c:choose>
					<c:when test="${id == vo.id}">
						<br>
						<button class="w3-btn w3-round w3-ripple w3-right"
							onclick="document.getElementById('delete').style.display='block'">
							<i class="fa fa-trash"></i>
						</button>
						<button class="w3-btn w3-round w3-ripple w3-right"
							onclick="document.getElementById('update').style.display='block'">
							<i class="fa fa-pencil-square-o"></i>
						</button>
					</c:when>
					<c:otherwise>
						<br>
						<button class="w3-btn w3-round w3-ripple w3-right"
							disabled="disabled">
							<i class="fa fa-trash"></i>
						</button>
						<button class="w3-btn w3-round w3-ripple w3-right"
							disabled="disabled">
							<i class="fa fa-pencil-square-o"></i>
						</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>


	</div>

	<!-- 글수정 modal -->
	<div id="update" class="w3-modal">
		<div class="w3-modal-content w3-animate-bottom w3-card-4"
			style="width: 600px;">
			<header class="w3-container w3-pale-red">
				<span
					onclick="document.getElementById('update').style.display='none'"
					class="w3-btn w3-round w3-ripple w3-display-topright"><i
					class="fa fa-close"></i></span>
				<h2>글수정</h2>
			</header>
			<div class="w3-container w3-margin">
				<form action="lupdate.do?bnum=${vo.bnum }" method="post">
					<input type="text" name="title" placeholder="title"
						class="w3-round w3-margin"><br>
					<textarea rows="10" cols="50" placeholder="content"
						class="w3-round w3-margin" name="content"></textarea>

					<button
						class="w3-btn w3-round w3-ripple w3-pale-red w3-margin w3-right">수정</button>
				</form>
			</div>
		</div>
	</div>

	<!-- 글삭제 modal -->
	<div id="delete" class="w3-modal">
		<div class="w3-modal-content w3-animate-bottom w3-card-4"
			style="width: 400px;">
			<header class="w3-container w3-pale-red">
				<span
					onclick="document.getElementById('delete').style.display='none'"
					class="w3-btn w3-round w3-ripple w3-display-topright"><i
					class="fa fa-close"></i></span>
				<h2>글삭제</h2>
			</header>
			<div class="w3-container w3-margin">
				삭제?
				<button class="w3-btn w3-round w3-ripple w3-right"
					onclick="location='/semi/lol/ldelete.do?bnum=${vo.bnum }'">
					<i class="fa fa-trash"></i>
				</button>
			</div>
		</div>
	</div>

	<div class="w3-panel w3-border">

		<h5>Comments</h5>
		<hr style="border-color: pale-red;">

		<c:forEach var="vo" items="${list }">
			<div class="w3-margin">
				<img src="img/${vo.num }.png" style="width: 40px;"><span
					class="clickPopup" onclick="showPopup('pop${vo.cnum}')">${vo.nic}</span>
				<div class="w3-right" style="margin-top: 30px;">${vo.regdate }
				</div>
				<hr style="border-color: pale-red;">
				<div
					class="w3-panel w3-pale-red w3-round-xlarge w3-margin w3-padding-16">
					<div class="w3-margin">
						${vo.content }

						<c:choose>
							<c:when test="${id == vo.id}">
								<br>
								<button class="w3-btn w3-round w3-ripple w3-right"
									onclick="location='/semi/lol/lcdelete.do?cnum=${vo.cnum}&bnum=${vo.bnum }'">
									<i class="fa fa-trash"></i>
								</button>
							</c:when>
							<c:otherwise>
								<br>
								<button class="w3-btn w3-round w3-ripple w3-right"
									disabled="disabled">
									<i class="fa fa-trash"></i>
								</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<br>
			</div>
			<div class="popup" id="pop${vo.cnum}">
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


		<div class="w3-margin">
			<form method="post" action="lcinsert.do">
				<textarea rows="5" cols="50" class="w3-round" placeholder="comment"
					name="content"></textarea>
				<br>
				<button class="w3-btn w3-round w3-ripple w3-pale-red">등록</button>
				<input type="hidden" name="id" value="${id }"> <input
					type="hidden" name="bnum" value="${vo.bnum }">
			</form>
		</div>
	</div>
</div>
<script src="/semi/js/showPop.js" charset="UTF-8"></script>
<script type="text/javascript">

window.onclick = function(event) {
    if (event.target.className == "modal") {
    	event.target.style.display = "none";
    }
}

var clickPopup = document.getElementsByClassName("clickPopup"); // 마우스포인터 효과
for (var i = 0; i < clickPopup.length; i++) {
	clickPopup[i].addEventListener("mouseover", function() { // 팝업
		this.style.cursor = "pointer";
	}, false);
}

var popup = document.getElementsByClassName("popup");

for (var i = 0; i < popup.length; i++) { // 마우스 떠나면 꺼지기
	popup[i].addEventListener("mouseleave", function() {
		this.style.display = "none";
	}, false);
	}

	function showPopup(popNum) { // 팝업띄우기
		var popup = document.getElementsByClassName("popup");

		for (var i = 0; i < popup.length; i++) {
			popup[i].style.display = "none";
		}

		var popNum = document.getElementById(popNum);
		popNum.style.display = "block";
		popNum.style.position = "absolute";
		popNum.style.top = (event.pageY + 20) + "px";
		popNum.style.left = (event.pageX - 40) + "px";
	}
</script>
