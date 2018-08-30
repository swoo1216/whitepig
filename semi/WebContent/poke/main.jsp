<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	var lastNum = 0;
	function submit() {
		var id = '${id}';
		var content = $('#contents').val();
		$.ajax({
			type : "post",
			url : "/semi/poke/chatInsert.do",
			data : {
				id : id,
				content : content
			},
			success : function(result) {
				if (result == 1) {
					$('#contents').val('');
				} else if (result == 0) {
					alert('내용을 정확히 입력하세요');
				} else {
					alert('데이터베이스 오류가 발생했습니다.');
				}
			}
		});
		document.getElementById("contents").focus();
	}

	function chatList(type) {
		$.ajax({
			type : "post",
			url : "/semi/poke/chatList.do",
			data : {
				listType : type,
			},
			success : function(data) {
				if (data == "")
					return;
				var parsed = JSON.parse(data);
				var result = parsed.result;
				for (var i = 0; i < result.length; i++) {
					addChat(result[i][0].value, result[i][1].value,
							result[i][2].value);
				}
				lastNum = Number(parsed.last);
			}
		});
	}

	function addChat(id, content, regdate) {
		$('#chatList').append(
				'<div class="w3-panel w3-pale-red w3-round-large w3-padding-16">' +
				'<img src="/semi/poke/img/${num}.png" style="width: 30px">' + ' ${nic}' + '<br>'
						 + content + '<span class="w3-right w3-small">' + regdate + '</span>' + "</div>");

		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	}

	function getInfiniteChat() {
		setInterval(function() {
			chatList(lastNum)
		}, 1000);
	}
	
	function chatFocus() {
		document.getElementById("contents").focus();
	}

	
</script>
</head>
<body>
	<div class="w3-bar w3-top w3-pale-red w3-large" style="z-index: 4;">

		<button class="w3-bar-item w3-button w3-hide-large w3-hover-white"
			onclick="myFunction('Demo1')">
			<i class="fa fa-bars"></i>  Menu
		</button>
		<span class="w3-bar-item w3-right">Logo</span>

		<!-- 전체채팅 -->
		<button
			class="w3-btn w3-round w3-ripple w3-pale-red w3-large w3-right"
			onclick="document.getElementById('chat').style.display='block';chatFocus();">
			<i class="fa fa-comment"></i>
		</button>

		<c:if test="${param.icon!=null }">
			<button
				class="w3-btn w3-round w3-ripple w3-pale-red w3-large w3-right"
				onclick="openRightMenu()" id="wish">
				<i class="fa fa-shopping-cart"></i>
			</button>
		</c:if>

		<c:choose>
			<c:when test="${id!=null }">
				<button
					class="w3-button w3-hide-large w3-large w3-hover-white w3-right"
					onclick="location.href='/semi/mlogout.do'">
					<i class="fa fa-sign-out"></i>
				</button>
				<img alt="" src="img/1.png" class="w3-right w3-hide-large"
					style="width: 20px; margin-top: 10px;">
			</c:when>
			<c:otherwise>
				<button
					class="w3-bar-item w3-button w3-hide-large w3-hover-white w3-right"
					onclick="location='/semi/main/join.jsp'">
					<i class="fa fa-user-plus"></i>
				</button>
				<button
					class="w3-bar-item w3-button w3-hide-large w3-hover-white w3-right"
					onclick="location='/semi/main/login.jsp'">
					<i class="fa fa-sign-in"></i>
				</button>
			</c:otherwise>
		</c:choose>
	</div>

	<div id="nav">

		<nav
			class="w3-sidebar w3-center w3-bar-block w3-collapse w3-animate-left w3-card w3-pale-red"
			style="z-index: 3; width: 250px; height: 100%;" id="mySidebar">
			<a class="w3-bar-item w3-button w3-large w3-hover-white"
				href="main.jsp"><img src="/semi/바지.png" style="height: 60px;">PANTS</a>
					

			<!-- 로그인 회원가입 -->
			<c:choose>
				<c:when test="${id!=null }">
				<div style="margin: 10px;">
					<img alt="" src="/semi/poke/img/${num }.png"
						style="width: 50px;"> <a href="/semi/mboardcount.do">${nic}</a>님<br>환영합니다!
			<button onclick="location.href='/semi/mlogout.do'" style="background-color: pink;">로그아웃</button>
  			</div>
						
					<hr style="border-color: white;">
				</c:when>
				<c:otherwise>
					<div class="w3-bar w3-border w3-border-white"
						style="display: flex; margin-top: 20px;">
						<button
							class="w3-border-right w3-border-white w3-bar-item w3-button w3-hover-white"
							onclick="location='/semi/main/login.jsp'">로그인</button>
						<button class="w3-bar-item w3-button w3-hover-white"
							onclick="location='/semi/main/join.jsp'">회원가입</button>
						<hr style="border-color: white;">
					</div>
				</c:otherwise>
			</c:choose>



			<a class="w3-bar-item w3-button w3-hover-white" href="#"><img
				alt="" src="/semi/images/슈퍼마리오아이콘.png" style="width: 50px;">Go</a>
			<hr style="border-color: white;">
			<a class="w3-bar-item w3-button w3-hover-white"
				href="/semi/poke/pboard.do"><img alt=""
				src="/semi/images/포켓몬아이콘.png" style="width: 50px;">Poke</a>
			<hr style="border-color: white;">
			<a class="w3-bar-item w3-button w3-hover-white"
				href="/semi/poke/list.do"><img alt="" src="/semi/lol/img/25.gif"
				style="width: 50px;">Icon</a>
			<hr style="border-color: white;">
			<a class="w3-bar-item w3-button w3-hover-white"
				href="/semi/lol/lboard.do"><img alt=""
				src="/semi/images/롤아이콘.png" style="width: 50px;">LoL</a>
			<hr style="border-color: white;">
			<a class="w3-bar-item w3-button w3-hover-white" href="/semi/mu/mlist.do"><img
				alt="" src="/semi/images/음악아이콘.png" style="width: 50px;">Music</a>
			<hr style="border-color: white;">

		</nav>

		<div class="w3-overlay w3-hide-large w3-animate-opacity"
			onclick="w3_close()" style="cursor: pointer" id="myOverlay"></div>
	</div>

	<div id="Demo1" class="w3-hide w3-pale-red"
		style="position: absolute; width: 100%;">
		<a
			class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large"
			href="#"><img alt="" src="/semi/images/슈퍼마리오아이콘.png"
			style="width: 30px;"> Go</a> <a
			class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large"
			href="/semi/poke/pboard.do"><img alt=""
			src="/semi/images/포켓몬아이콘.png" style="width: 30px;"> Poke</a> <a
			class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large"
			href="/semi/poke/list.do"><img alt="" src="img/25.gif"
			style="width: 30px;"> Icon</a> <a
			class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large"
			href="/semi/lol/lboard.do"><img alt=""
			src="/semi/images/롤아이콘.png" style="width: 30px;"> LoL</a> <a
			class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large"
			href="#"><img alt="" src="/semi/images/음악아이콘.png"
			style="width: 30px;"> Music</a>
	</div>

	<div class="w3-main" style="margin-left: 250px; margin-top: 43px;"
		id="content">

		<!-- 채팅 modal -->
		<div class="w3-modal" id="chat">
			<div class="w3-modal-content w3-animate-zoom w3-card-4"
				style="width: 480px;">
				<header class="w3-container w3-pale-red">
					<span
						onclick="document.getElementById('chat').style.display='none'"
						class="w3-btn w3-round w3-ripple w3-display-topright"><i
						class="fa fa-close"></i></span>
					<h2>Chat</h2>
				</header>
				<div class="w3-container">

					<div id="chatList"
						style="width: 450px; height: 500px; overflow: auto;" id="chat">

					</div>
					<div>
						<textarea rows="3" cols="40" id="contents" class="w3-round"></textarea>
						<input type="button" class="w3-round w3-ripple w3-pale-red" onclick="submit()" value="전송">
					
					</div>
				</div>
				<script type="text/javascript">
					$(document).ready(function() {
						chatList('ten');
						getInfiniteChat();
					});
				</script>
			</div>
		</div>

		<div class="w3-container" style="min-height: 860px;">





			<%
				String contentpage = request.getParameter("page");
				if (contentpage == null)
					contentpage = "/poke/index.jsp";
			%>

			<jsp:include page="<%=contentpage%>" />



		</div>

		<footer class="w3-container w3-pale-red">
			<div class="w3-right">
				<h5>Footer</h5>
			</div>
		</footer>
	</div>
	<script type="text/javascript">
		function openRightMenu() {
			document.getElementById("rightMenu").style.display = "block";
		}
		function closeRightMenu() {
			document.getElementById("rightMenu").style.display = "none";
		}

		function myFunction(id) {
			var x = document.getElementById(id);
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}

		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("myOverlay").style.display = "block";
		}
		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("myOverlay").style.display = "none";
		}
	</script>
	
	<c:choose>
	<c:when test="${requestScope.code=='success'}">
		<script type="text/javascript">
		alert('회원가입성공');
		</script>
	</c:when>
	<c:when test="${requestScope.code=='fail'}">
		<script type="text/javascript">
		alert('회원가입실패');
		</script>
	</c:when>
<%-- 
	<c:when test="${requestScope.code=='success1'}">
		<script type="text/javascript">
		alert('로그인성공');
		</script>
	</c:when>
	<c:when test="${requestScope.code=='logout'}">
		<script type="text/javascript">
		alert('로그아웃 하셨습니다.');
		</script>
	</c:when>
--%>
	<c:when test="${requestScope.code=='fail1'}">
		<script type="text/javascript">
		alert('로그인실패');
		</script>
	</c:when>
	<c:when test="${requestScope.code=='esuccess'}">
		<script type="text/javascript">
		alert('당신의 아이디는' + ${id }+'입니다.');
		</script>
	</c:when>
	<c:when test="${requestScope.code=='efail'}">
		<script type="text/javascript">
		alert('등록되지 않은 이메일입니다.');
		</script>
	</c:when>
	<c:when test="${requestScope.code=='psuccess'}">
		<script type="text/javascript">
		alert('당신의 비밀번호는' + ${pwd }+'입니다.');
		</script>
	</c:when>
	<c:when test="${requestScope.code=='pfail'}">
		<script type="text/javascript">
		alert('등록되지 않은 아이디 또는 이메일입니다.');
		</script>
	</c:when>
	<c:when test="${requestScope.code=='wsuccess'}">
		<script type="text/javascript">
		alert('회원탈퇴되셨습니다. 그동안 이용해주셔서 감사합니다.');
		</script>
	</c:when>
	<c:when test="${requestScope.code=='wfail'}">
		<script type="text/javascript">
		alert('회원탈퇴에 실패했습니다.');
		</script>
	</c:when>
</c:choose>

</body>
<script src="/semi/js/pantalk.js?ver=4" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript">
	var pt = new pantalk("${sessionScope.id}", "${sessionScope.nic}");
	pt.startCount();
</script>
</html>