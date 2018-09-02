<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_frm.css?ver=1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/go_modal.css?ver=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	var lastNum = 0;
	function submit() {
		var id = '${id}';
		var nic = '${nic}';
		var num = '${num}';
		var content = $('#contents').val();
		$.ajax({
			type : "post",
			url : "/semi/poke/chatInsert.do",
			data : {
				id : id,
				nic : nic,
				num : num,
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
					addChat(result[i][1].value, result[i][2].value,
							result[i][3].value, result[i][4].value);
				}
				lastNum = Number(parsed.last);
			}
		});
	}

	function addChat(nic, num, content, regdate) {
		$('#chatList').append(
				'<div class="w3-panel w3-pale-red w3-round-large w3-padding-16">' +
				'<img src="/semi/poke/img/' + num + '.png" style="width: 30px">' + nic + '<br>'
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

		<button
			class="w3-btn w3-round w3-ripple w3-pale-red w3-large w3-right"
			onclick="goGame()">open</button>

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
				<button
					class="w3-button w3-hide-large w3-large w3-hover-white w3-right"
					onclick="location.href='/semi/mboardcount.do'">
					<img alt="" src="/semi/poke/img/${num }.png" style="width: 30px;">
				</button>

			</c:when>
			<c:otherwise>
				<button
					class="w3-bar-item w3-button w3-hide-large w3-hover-white w3-right"
					onclick="location='/semi/main/join.jsp'">
					<i class="fa fa-user-plus"></i>
				</button>
				<button
					class="w3-bar-item w3-button w3-hide-large w3-hover-white w3-right"
					onclick="location='/semi/poke/main.jsp?page=/semi/main/login.jsp'">
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
					href="/semi/mmain.do"><img src="/semi/바지.png"
					style="height: 60px;">PANTS</a> 

				<!-- 로그인 회원가입 -->
				<c:choose>
					<c:when test="${id!=null }">
						<div style="margin: 10px;">
							<img alt="" src="/semi/poke/img/${num }.png" style="width: 50px;">
							<a href="/semi/mboardcount.do">${nic}</a>님<br>환영합니다!
							<button onclick="location.href='/semi/mlogout.do'"
								style="background-color: pink;">로그아웃</button>
						</div>

						<hr style="border-color: white;">
					</c:when>
					<c:otherwise>
						<div class="w3-bar w3-border w3-border-white"
							style="display: flex; margin-top: 20px;">
							<button
								class="w3-border-right w3-border-white w3-bar-item w3-button w3-hover-white"
								onclick="location.href='/semi/poke/main.jsp?page=/main/login.jsp';">로그인</button>
							<button class="w3-bar-item w3-button w3-hover-white"
								onclick="location='/semi/poke/main.jsp?page=/main/join.jsp'">회원가입</button>
							<hr style="border-color: white;">
						</div>
					</c:otherwise>
				</c:choose>



				<a class="w 3-bar-item w3-button w3-hover-white"
					href="/semi/go/gboard.do"><img alt=""
					src="/semi/images/슈퍼마리오아이콘.png" style="width: 50px;">Go</a>

				<hr style="border-color: white;">
				<a class="w3-bar-item w3-button w3-hover-white"
					href="/semi/poke/pboard.do"><img alt=""
					src="/semi/images/포켓몬아이콘.png" style="width: 50px;">Poke</a>
				<hr style="border-color: white;">
				<a class="w3-bar-item w3-button w3-hover-white"
					href="/semi/poke/list.do"><img alt=""
					src="/semi/poke/img/25.gif" style="width: 50px;">Icon</a>
				<hr style="border-color: white;">
				<a class="w3-bar-item w3-button w3-hover-white"
					href="/semi/lol/lboard.do"><img alt=""
					src="/semi/images/롤아이콘.png" style="width: 50px;">LoL</a>
				<hr style="border-color: white;">
				<a class="w3-bar-item w3-button w3-hover-white"
					href="/semi/mu/mlist.do"><img alt=""
					src="/semi/images/음악아이콘.png" style="width: 50px;">Music</a>
				<hr style="border-color: white;">

			</nav>

			<div class="w3-overlay w3-hide-large w3-animate-opacity"
				onclick="w3_close()" style="cursor: pointer" id="myOverlay"></div>
	</div>

	<div id="Demo1" class="w3-hide w3-pale-red"
		style="position: absolute; width: 100%;">
		<a
			class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large"
			href="/semi/go/gboard.do"><img alt=""
			src="/semi/images/슈퍼마리오아이콘.png" style="width: 30px;"> Go</a> <a
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
			href="/semi/mu/mlist.do"><img alt="" src="/semi/images/음악아이콘.png"
			style="width: 30px;"> Music</a>
	</div>

	<div class="w3-main" style="margin-left: 250px; margin-top: 43px;"
		id="content">

		<!-- 채팅 modal -->
		<div class="w3-modal" id="chat">
			<div class="w3-modal-content w3-animate-zoom w3-card-4"
				style="width: 60%;">
				<header class="w3-container w3-pale-red">
					<span
						onclick="document.getElementById('chat').style.display='none'"
						class="w3-btn w3-round w3-ripple w3-display-topright"><i
						class="fa fa-close"></i></span>
					<h2>Chat</h2>
				</header>
				<div class="w3-container">

					<div id="chatList"
						style="width: 100%; height: 500px; overflow: auto;"></div>
					<div>
						<textarea rows="3" style="width: 90%;" id="contents"
							class="w3-round"></textarea>
						<input type="button" class="w3-round w3-ripple w3-pale-red"
							onclick="submit()" value="전송">

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
	<div id="game" class="modal" style="display: none;">
		<div id="game_modal" class="game_content">
			<canvas id="mycanvas"></canvas>
			<div style="float: right">
				방향키 이동<br> 스페이스바 시작
				<div id="gameScore"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function goGame(){
		document.getElementById("game").style.display = "block";
	}
	
	var gaming = false;
	var width = 1000, height = 500, range = 30;
	var player = {x: 500, y: 250, width: 40, height: 40, spd:10};
	var enemy = {x: 0, y: 0, width: 30, height: 30, spd:5};
	var enemy2 =  {x: 10, y: 0, width: 30, height: 30, spd:5};
	var enemy3 =  {x: 20, y: 0, width: 30, height: 30, spd:5};
	
	var enemy4 =  {x: 0, y: 0, width: 30, height: 30, spd:5};
	var enemy5 =  {x: width, y: 0, width: 30, height: 30, spd:5};
	
	var enemy6 =  {x: 0, y: height, width: 30, height: 30, spd:5};
	var score = 0, count = 0, key = [];
	var canvas = document.getElementById("mycanvas");
	canvas.width = width;
	canvas.height = height;
	canvas.style.border = "1px solid black";
	canvas.style.margin = "0 auto";
	var ctx = canvas.getContext("2d");
	
	
	//var gdiv = document.createElement("div");
	//gdiv.style.cssFloat = "right";
	
	//var gText = document.createTextNode("방향키 이동");
	//var gBr = document.createElement("br");
	//var gText2 = document.createTextNode("스페이스바 시작");
	
	//gdiv.appendChild(gText);
	//gdiv.appendChild(gBr);
	//gdiv.appendChild(gText2);
	
	
	window.addEventListener("keydown", function(){
		if(event.keyCode == 32){
			startgame();
		}
	}, false);
	//start
	var end;
	function startgame(){
		if(gaming)
			return;
		gaming = true;
		window.scroll(function() { return false; });
		width = 1000, height = 500, range = 30;
		player = {x: 500, y: 250, width: 40, height: 40, spd:10};
		enemy = {x: 0, y: 0, width: 30, height: 30, spd:5};
		enemy2 =  {x: 10, y: 0, width: 30, height: 30, spd:5};
		enemy3 =  {x: 20, y: 0, width: 30, height: 30, spd:5};
		
		enemy4 =  {x: 0, y: 0, width: 30, height: 30, spd:5};
		enemy5 =  {x: width, y: 0, width: 30, height: 30, spd:5};
		
		enemy6 =  {x: 0, y: height, width: 30, height: 30, spd:5};
		score = 0
		count = 0
		key = [];
		end = setInterval(function(){
			  update();
			  draw();
			},10)
	}
	
	function draw(){
	  ctx.save();
	  ctx.fillStyle = "white";
	  ctx.fillRect(0,0,width,height);
	  ctx.fillStyle = "red";
	  ctx.fillRect(enemy.x-enemy.width/2, enemy.y-enemy.height/2, enemy.width, enemy.height);
	  ctx.fillRect(enemy2.x-enemy2.width/2,enemy2.y-enemy2.height/2,enemy2.width,enemy2.height);
	  ctx.fillRect(enemy3.x-enemy3.width/2,enemy3.y-enemy3.height/2,enemy3.width,enemy3.height);
	  
	  ctx.fillRect(enemy4.x-enemy4.width/2,enemy4.y-enemy4.height/2,enemy4.width,enemy4.height);
	  ctx.fillRect(enemy5.x-enemy5.width/2,enemy5.y-enemy5.height/2,enemy5.width,enemy5.height);
	  ctx.fillRect(enemy6.x-enemy6.width/2,enemy6.y-enemy6.height/2,enemy6.width,enemy6.height);
	  ctx.fillStyle = "black";
	  ctx.fillRect(player.x-player.width/2,player.y-player.height/2,player.width,player.height);
	  ctx.font = "20px Arial";
	  ctx.fillStyle = "black";
	  ctx.fillText("Score: "+score,0,20);
	  ctx.restore();
	}
	function update(){
	  if(player.x >= enemy.x-range && player.x <= enemy.x+range && player.y >= enemy.y-range && player.y <= enemy.y+range ){
	    gameover();
	    gaming = false;
	    
	  }
	  if(player.x >= enemy2.x-range && player.x <= enemy2.x+range && player.y >= enemy2.y-range && player.y <= enemy2.y+range ){
		  gameover();
		  gaming = false;
		  }
	  if(player.x >= enemy3.x-range && player.x <= enemy3.x+range && player.y >= enemy3.y-range && player.y <= enemy3.y+range ){
		  gameover();
		  gaming = false;
		  }
	  if(player.x >= enemy4.x-range && player.x <= enemy4.x+range && player.y >= enemy4.y-range && player.y <= enemy4.y+range ){
		  gameover();
		  gaming = false;
		  }
	  if(player.x >= enemy5.x-range && player.x <= enemy5.x+range && player.y >= enemy5.y-range && player.y <= enemy5.y+range ){
		  gameover();
		  gaming = false;
		  }
	  if(player.x >= enemy6.x-range && player.x <= enemy6.x+range && player.y >= enemy6.y-range && player.y <= enemy6.y+range ){
		  gameover();
		  gaming = false;
		  }
	  if(enemy.y > height){
	    enemy.x = Math.ceil(Math.random()*width);
	    enemy.y = 0;
	    enemy.spd = 1;
	    score = score + 10;
	  }
	  if(enemy2.y > height){
		    enemy2.x = Math.ceil(Math.random()*width);
		    enemy2.y = 0;
		    enemy2.spd = 1;
		    score = score + 1;
	 }
	 if(enemy3.y > height){
		    enemy3.x = Math.ceil(Math.random()*width);
		    enemy3.y = 0;
		    enemy3.spd = 1;
		    score = score + 1;
	 }
	  
	  if(enemy4.x > width){
		  enemy4.x = 0;
		  enemy4.y = Math.ceil(Math.random()*height);
		  enemy4.spd = 1;
		  score = score + 10;
	  }
	  if(enemy5.x < 0){
		  enemy5.x = width;
		  enemy5.y = Math.ceil(Math.random()*height);
		  enemy5.spd = 1;
		  score = score + 10;
	  }
	  if(enemy6.y < 0){
		  enemy6.x = Math.ceil(Math.random()*width);
		  enemy6.y = height;
		  enemy6.spd = 1;
		  score = score + 10;
	  }
	  
	  if(key[37]&&player.x-player.width/2>0) player.x -= player.spd;
	  if(key[38]&&player.y-player.height/2>0) player.y -= player.spd;
	  if(key[39]&&player.x+player.width/2<width) player.x += player.spd;
	  if(key[40]&&player.y+player.height/2<height) player.y += player.spd;
	  enemy.y += enemy.spd;
	  enemy.spd += Math.floor(Math.random() * 50) / 100;
	  enemy2.y += enemy2.spd;
	  enemy2.spd += Math.floor(Math.random() * 50) / 100;
	  enemy3.y += enemy3.spd;
	  enemy3.spd += Math.floor(Math.random() * 50) / 100;
	  
	  enemy4.x += enemy4.spd;
	  enemy4.spd += Math.floor(Math.random() * 50) / 100;
	  enemy5.x -= enemy5.spd;
	  enemy5.spd += Math.floor(Math.random() * 50) / 100;
	  
	  enemy6.y -= enemy6.spd;
	  enemy6.spd += Math.floor(Math.random() * 50) / 100;
	}
	window.addEventListener("keydown", function(e){
	  key[e.keyCode] = true;
	});
	window.addEventListener("keyup", function(e){
	  key[e.keyCode] = false;
	});
	function gameover(){
		clearInterval(end);
		
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				var text = this.responseText;
				var json = JSON.parse(text);
				
				var table = document.createElement("table");
				var tbody = document.createElement("tbody");
				var tr = document.createElement("tr");
				var rankth = document.createElement("th");
				var idth = document.createElement("th");
				var scoreth = document.createElement("th");
				
				var rankText = document.createTextNode("등수")
				var idText = document.createTextNode("아이디");
				var scoreText = document.createTextNode("점수");
				
				rankth.appendChild(rankText);
				idth.appendChild(idText);
				scoreth.appendChild(scoreText);
				
				tr.appendChild(rankth);
				tr.appendChild(idth);
				tr.appendChild(scoreth);
				
				tbody.appendChild(tr);
				
				for(var i=0;i<json.length;i++){
					var id = json[i].id;
					var gameNum = json[i].gameNum;
					var getPoint = json[i].getPoint;
					
					var _idText = document.createTextNode(id);
					var _scoreText = document.createTextNode(getPoint);
					var _rank = document.createTextNode((i + 1)+"");
					
					var _tr = document.createElement("tr");
					var _ranktd = document.createElement("td");
					var _idtd = document.createElement("td");
					var _scoretd = document.createElement("td");
					
					_ranktd.appendChild(_rank);
					_idtd.appendChild(_idText);
					_scoretd.appendChild(_scoreText);
					
					_tr.appendChild(_ranktd);
					_tr.appendChild(_idtd);
					_tr.appendChild(_scoretd);
					tbody.appendChild(_tr);
				}
				table.appendChild(tbody);
				document.getElementById("gameScore").innerHTML = "";
				document.getElementById("gameScore").appendChild(table);
			}
		}
		xhr.open("get", "/semi/go/getGamePoint.do?id=${sessionScope.id}&getPoint=" + score, true);
		xhr.send();
	}
	</script>
</body>


<script src="/semi/js/pantalk.js?ver=4" type="text/javascript"
	charset="UTF-8"></script>
<script type="text/javascript">
	var pt = new pantalk("${sessionScope.id}", "${sessionScope.nic}");
	pt.startCount();
	
	window.onload = function(){
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				var text = this.responseText;
				var json = JSON.parse(text);
				
				var table = document.createElement("table");
				var tbody = document.createElement("tbody");
				var tr = document.createElement("tr");
				var rankth = document.createElement("th");
				var idth = document.createElement("th");
				var scoreth = document.createElement("th");
				
				var rankText = document.createTextNode("등수")
				var idText = document.createTextNode("아이디");
				var scoreText = document.createTextNode("점수");
				
				rankth.appendChild(rankText);
				idth.appendChild(idText);
				scoreth.appendChild(scoreText);
				
				tr.appendChild(rankth);
				tr.appendChild(idth);
				tr.appendChild(scoreth);
				
				tbody.appendChild(tr);
				
				for(var i=0;i<json.length;i++){
					var id = json[i].id;
					var gameNum = json[i].gameNum;
					var getPoint = json[i].getPoint;
					
					var _idText = document.createTextNode(id);
					var _scoreText = document.createTextNode(getPoint);
					var _rank = document.createTextNode((i + 1)+"");
					
					var _tr = document.createElement("tr");
					var _ranktd = document.createElement("td");
					var _idtd = document.createElement("td");
					var _scoretd = document.createElement("td");
					
					_ranktd.appendChild(_rank);
					_idtd.appendChild(_idText);
					_scoretd.appendChild(_scoreText);
					
					_tr.appendChild(_ranktd);
					_tr.appendChild(_idtd);
					_tr.appendChild(_scoretd);
					tbody.appendChild(_tr);
				}
				table.appendChild(tbody);
				document.getElementById("gameScore").innerHTML = "";
				document.getElementById("gameScore").appendChild(table);
			}
		}
		xhr.open("get", "/semi/go/GetGameRank.do", true);
		xhr.send();
	}
	
	var modal = document.getElementById('chat');
	

	window.onclick = function(event) {
		console.log("event", event.target);
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	    
	    if (event.target.className == "modal") {
			event.target.style.display = "none";
			pt.imsee = false;
			document.body.style.overflow = "hidden";
			window.scroll(function() { return true; });
		}
	}
		if(event.target.className == "modal")
		{
			event.target.style.display = "none";
			pt.imsee = false;
			document.body.style.overflow = "hidden";
			window.scroll(function() { return;});
		}
	}
	
</script>
</html>