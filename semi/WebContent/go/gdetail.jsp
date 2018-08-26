<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/go_frm.css">
<style type="text/css">
td, th {
	border-spacing: 0px;
	border-style: none;
	padding: 5px;
}

th {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

td {
	border-bottom: 1px solid black;
}

#comments {
	margin-top: 30px;
}

p {
	margin: auto;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		var size = window.innerHeight || document.body.clientHeight;
		document.getElementById("wrapper").style.height = (size - 10) + "px";
	}
	
	function golist() {
		location.href = "gboard.do";
	}
	
	function resetRecommList(json){
		var j = json;
		
		var cNum = j.cNum;
		var content = j.content;
		var recomm = j.recomm;
		var rnic = j.rnic;
		var rdate = j.rdate;

		var table = document.createElement("table");
		var tbody = document.createElement("tbody");
		var tr = document.createElement("tr");

		var td1 = document.createElement("td");
		var td2 = document.createElement("td");
		var td3 = document.createElement("td");
		var td4 = document.createElement("td");
		var td5 = document.createElement("td");

		td1.width = "5%";
		td2.width = "78%";
		td3.width = "7%";
		td4.width = "10%";

		var text1 = document.createTextNode(rnic);
		var text2 = document.createTextNode(content);
		var text3 = document.createTextNode(recomm);
		var text4 = document.createTextNode(rdate);
		var text5 = document.createTextNode("X");
		
		var pre = document.createElement("pre");
		pre.appendChild(text2);
		
		var btn = document.createElement("button");
		btn.appendChild(text5);
		btn.type = "button";
		btn.onclick = function(){ //댓글번호 id가 있는지
			xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var text = this.responseText;
					var json = JSON.parse(text);
					
					if(json.check == "yesId"){ // 아이디가 있으면
						xhr = new XMLHttpRequest();
						xhr.onreadystatechange = function(){
							if(this.readyState == 4 && this.status == 200){
								var text = this.responseText;
								var json = JSON.parse(text);
								
								if(json.result === 'fail'){ //로그인 아이디와 일치하지 않으면
									var noiddAlert = document.getElementById("noiddAlert");
									noiddAlert.style.display = "block";
									setTimeout(function(){
										noiddAlert.style.display = "none";
									}, 2000);
									return;
								}
								
								var comments = document.getElementById("comments");
								comments.innerHTML = "";
								
								for(var i=0; i<json.recomm.length; i++){
									resetRecommList(json.recomm[i]);	
								}
								resetBoard(json); //글쓴이 정보 리셋
							}
						}
						xhr.open('get', 'GcommentRemoveId.do?cNum=' + cNum + '&id=${sessionScope.id}', true);
						xhr.send();
					}else{ //없으면 비밀번호로 삭제
						
					}
				}
			}
			xhr.open("get", 'gcommentIdCheck.do?cNum=' + cNum , true);
			xhr.send();
		}
		btn.style.padding = "5px 10px";

		td1.appendChild(text1);
		td2.appendChild(pre);
		td3.appendChild(text3);
		td4.appendChild(text4);
		td5.appendChild(btn);

		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td4);
		tr.appendChild(td5);

		tbody.appendChild(tr);
		table.appendChild(tbody);

		comments.appendChild(table);
		
		document.getElementById("tarea").value = ""; //입력창 초기화
	}
	function godeleteModal(writerId) {
		if(writerId !== '${sessionScope.id}'){
			var deleteAlert = document.getElementById("deleteAlert");
			deleteAlert.style.display = "block";
			setTimeout(function(){
				deleteAlert.style.display = "none";
			}, 2000);
			return;
		}
		deleteModal.style.display = "block";
		
	}
	function godelete(bNum){
		location.href = "gboarddelete.do?bNum=" + bNum + "&tNum=" + 0;
	}
	function gomodify(bNum, writerId) {
		if(writerId !== '${sessionScope.id}'){
			var modifyAlert = document.getElementById("modifyAlert");
			modifyAlert.style.display = "block";
			setTimeout(function(){
				modifyAlert.style.display = "none";
			}, 2000);
			return;
		}
		location.href = "gboardmodify.do?bNum=" + bNum;
	}
	function insertComment() {
		location.href = "gcinsert.do";
	}

	function getList() { //댓글 추가
		var id = document.commentFrm.id.value;
		var nic = document.commentFrm.nic.value;
		
		if(!nic){ //닉네임을 입력안했으면
			var nicAlert = document.getElementById("nicAlert");
			nicAlert.style.display = "block";
			setTimeout(function(){
				nicAlert.style.display = "none";
			}, 2000);
			return;
		}
		
		var rPassword;
		if(!id){ //로그인을 안했으면
			rPassword = document.commentFrm.rPassword.value;
			if(!rPassword){ //비밀번호를 입력안했으면
				var rpwdAlert = document.getElementById("rpwdAlert");
				rpwdAlert.style.display = "block";
				setTimeout(function(){
					rpwdAlert.style.display = "none";
				}, 2000);
				return;
			}
		}
		
		var bNum = document.commentFrm.bNum.value;
		var tNum = document.commentFrm.tNum.value;
		var content = document.commentFrm.content.value;
		
		if(!content){ // 내용이 없으면
			var recommAlert = document.getElementById("recommAlert");
			recommAlert.style.display = "block";
			setTimeout(function(){
				recommAlert.style.display = "none";
			}, 2000);
			return;
		}

		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var text = this.responseText;
				var json = JSON.parse(text);
				
				var comments = document.getElementById("comments");
				comments.innerHTML = "";
				
				for (var i=0;i<json.recomm.length;i++) { //댓글 리스트
					resetRecommList(json.recomm[i]);
				}
				
				resetBoard(json);
			}
			if(!document.commentFrm.id.value){
				document.commentFrm.nic.value = "";
				document.commentFrm.rPassword.value = "";
			}
		}
		xhr.open("POST", "gcinsert.do", true);
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		var param = "bNum=" + bNum + "&tNum=" + tNum + "&content=" + content;
		if(!id){ //nic, rPassword 넘기기
			param += "&nic=" + nic + "&rPassword=" + rPassword;
		}else{ //로그인 되있으면 id넘기기
			param += "&id=" + id;
		}
		xhr.send(param);	
		
		
	}

	function goRecomm(id, bNum, tNum) { //추천
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var text = xhr.responseText;
				var json = JSON.parse(text);
				
				detailFunc = document.getElementById("detailFunc");
				detailFunc.innerHTML = "";
				
				var button1 = document.createElement("button");
				var button2 = document.createElement("button");
				var button3 = document.createElement("button");
				var button4 = document.createElement("button");
				
				
				var txt1 = document.createTextNode("목록");
				var txt2 = document.createTextNode("삭제");
				var txt3 = document.createTextNode("수정");
				var txt4 = document.createTextNode("추천취소");
				
				button1.appendChild(txt1);
				button1.addEventListener('click', function(){
					golist();
				}, false);
				button2.appendChild(txt2);
				button2.addEventListener('click', function(){
					godeleteModal('${vo.id}');
				}, false);
				button3.appendChild(txt3);
				button3.addEventListener('click', function(){
					gomodify('${vo.bNum}', '${vo.id}');
				});
				button4.appendChild(txt4);
				button4.addEventListener('click', function(){
					deleteRecomm('${sessionScope.id}', '${vo.bNum}', 0);
				}, false);
				
				detailFunc.appendChild(button1);
				detailFunc.appendChild(button2);
				detailFunc.appendChild(button3);
				detailFunc.appendChild(button4);
			}
		}
		xhr.open("POST", "grecommInsert.do", true);
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xhr.send("id=" + id + "&bNum=" + bNum + "&tNum=" + tNum);
	}
	
	function deleteRecomm(id, bNum, tNum) { //추천 취소
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var text = xhr.responseText;
				var json = JSON.parse(text);
				
				detailFunc = document.getElementById("detailFunc");
				detailFunc.innerHTML = "";
				
				var button1 = document.createElement("button");
				var button2 = document.createElement("button");
				var button3 = document.createElement("button");
				var button4 = document.createElement("button");
				
				var txt1 = document.createTextNode("목록");
				var txt2 = document.createTextNode("삭제");
				var txt3 = document.createTextNode("수정");
				var txt4 = document.createTextNode("추천");
				
				button1.appendChild(txt1);
				button1.addEventListener('click', function(){
					golist();
				}, false);
				button2.appendChild(txt2);
				button2.addEventListener('click', function(){
					godeleteModal();
				}, false);
				button3.appendChild(txt3);
				button3.addEventListener('click', function(){
					gomodify('${vo.bNum}');
				});
				button4.appendChild(txt4);
				button4.addEventListener('click', function(){
					goRecomm('${sessionScope.id}', '${vo.bNum}', 0);
				}, false);
				
				detailFunc.appendChild(button1);
				detailFunc.appendChild(button2);
				detailFunc.appendChild(button3);
				detailFunc.appendChild(button4);
			}
		}
		xhr.open("POST", "grecommDelete.do", true);
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xhr.send("id=" + id + "&bNum=" + bNum + "&tNum=" + tNum);
	}
	function removeRecomm(cNum){ //댓글번호 id가 있는지
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				var text = this.responseText;
				var json = JSON.parse(text);
				
				if(json.check == "yesId"){ // 아이디가 있으면
					xhr = new XMLHttpRequest();
					xhr.onreadystatechange = function(){
						if(this.readyState == 4 && this.status == 200){
							var text = this.responseText;
							var json = JSON.parse(text);
							
							if(json.result === 'fail'){ //로그인 아이디와 일치하지 않으면
								var noiddAlert = document.getElementById("noiddAlert");
								noiddAlert.style.display = "block";
								setTimeout(function(){
									noiddAlert.style.display = "none";
								}, 2000);
								return;
							}
							
							var comments = document.getElementById("comments");
							comments.innerHTML = "";
							
							for(var i=0; i<json.recomm.length; i++){
								resetRecommList(json.recomm[i]);	
							}
							resetBoard(json); //글쓴이 정보 리셋
						}
					}
					xhr.open('get', 'GcommentRemoveId.do?cNum=' + cNum + '&id=${sessionScope.id}', true);
					xhr.send();
				}
			}
		}
		xhr.open("get", 'gcommentIdCheck.do?cNum=' + cNum , true);
		xhr.send();
	}
	
	function resetBoard(json){
		var reset = document.getElementById("resetComment");
		reset.innerHTML = "";
		
		var board = json.board; //글쓴이 정보
		var re_tr1 = document.createElement("td");
		var re_tr2 = document.createElement("td");
		var writer = document.createTextNode("글쓴이");
		var texts = board.bNic + " | 조회 " + board.hit + " | 작성일 " + board.bDate
				+ " | 댓글 " + board.countComment;
		var count = document.createTextNode(texts);
		re_tr1.appendChild(writer);
		re_tr2.appendChild(count);

		reset.appendChild(re_tr1);
		reset.appendChild(re_tr2);
	}
</script>
<title></title>
</head>
<body>
	<div id="wrapper">
		<div id="header"></div>
		<div id="center">
			<div id="nav">
				<div id="title">pants</div>
				<button class="navButton">기동아</button>
				<button class="navButton">넌이제</button>
				<button class="navButton">디디디</button>
				<button class="navButton">자자자</button>
				<button class="navButton">이이이</button>
				<button class="navButton" style="border-bottom: 1px solid white;">너너너</button>
			</div>
			<div id="content">
				<div id="gtable">
					<table>
						<tr>
							<td width="8%">제목</td>
							<td>${vo.title}</td>
						</tr>
						<tr id="resetComment">
							<td>글쓴이</td>
							<td>${vo.nic}&nbsp;|&nbsp;조회&nbsp;${vo.hit}&nbsp;|&nbsp;작성일&nbsp;${vo.regdate}&nbsp;|&nbsp;댓글&nbsp;${vo.countComment}</td>
						</tr>
						<tr>
							<td height="500px" colspan="2" style="text-align: left; vertical-align: top;">${vo.content}</td>
						</tr>
					</table>
					<div id="detailFunc">
						<button type="button" onclick="golist()">목록</button>
						<button type="button" onclick="godeleteModal('${vo.id}')">삭제</button>
						<button type="button" onclick="gomodify('${vo.bNum}', '${vo.id}')">수정</button>
						<c:choose>
							<c:when test="${isrecomm == 'false'}">
								<button type="button" onclick="goRecomm('${sessionScope.id}', ${vo.bNum}, 0)">추천</button>
							</c:when>
							<c:otherwise>
								<button type="button" onclick="deleteRecomm('${sessionScope.id}', ${vo.bNum}, 0)">추천취소</button>
							</c:otherwise>
						</c:choose>
					</div>
					<div id="comments">
						<c:forEach var="vo" items="${gclist}">
							<table>
								<tr>
									<td width="5%">${vo.nic}</td>
									<td width="78%"><pre>${vo.content}</pre></td>
									<td width="7%">${vo.recomm}</td>
									<td width="10%">${vo.regdate}</td>
									<!-- 닉네임으로 작성했으면 닉네임과 비밀번호로 조회후 삭제 -->
									<!-- 로그인해서 작성했으면 아이디로 조회후 삭제 -->
									<td><button type="button" onclick="removeRecomm('${vo.cNum}')" style="padding: 5px 10px;">X</button></td>
								</tr>
							</table>
						</c:forEach>
					</div>
					<div id="insertComment">
						<form method="post" action="gcinsert.do" name="commentFrm">
							<table>
								<tr>
									<td width="10%">댓글</td>
									<!-- 로그인 안되있으면 닉네임 입력하고 댓글 작성 -->
									<c:choose>
										<c:when test="${empty sessionScope.id}">
											<td width="10%"><input type="text" name="nic" size="10" placeholder="닉네임"> <br> <input type="password" name="rPassword" size="10" placeholder="비밀번호"></td>
										</c:when>
										<c:otherwise>
											<td width="10%">${sessionScope.nic}</td>
											<input type="hidden" name="id" value="${sessionScope.id}">
											<input type="hidden" name="nic" value="${sessionScope.nic}">
										</c:otherwise>
									</c:choose>
									<td width="60%"><textarea rows="5" cols="100" name="content" id="tarea"></textarea></td>
									<td width="20%"><button type="button" onclick="getList()">작성</button></td>
								</tr>
							</table>
							<input type="hidden" name="bNum" value="${vo.bNum}"> <input type="hidden" name="tNum" value="0">
						</form>
					</div>
				</div>
			</div>
			<div id="extra">
				<img src="../ad1.jpg" alt="ad">
			</div>
		</div>
	</div>

	<div id="delete_modal" class="modal" style="display: none;">
		<div class="modal_content">
			<span class="close">&times;</span>
			<p>정말 삭제하실 꺼예요?</p>
			<button type="button" onclick="godelete('${vo.bNum}')" style="float: none;">확인</button>
		</div>
	</div>

	<div id="deleteAlert" class="modal" style="display: none;">
		<div class="modal_content">
			<p>글쓴이만 삭제 할 수 있습니다.</p>
		</div>
	</div>

	<div id="modifyAlert" class="modal" style="display: none;">
		<div class="modal_content">
			<p>글쓴이만 수정 할 수 있습니다.</p>
		</div>
	</div>

	<div id="recommAlert" class="modal" style="display: none;">
		<div class="modal_content">
			<p>댓글을 입력하세요.</p>
		</div>
	</div>

	<div id="nicAlert" class="modal" style="display: none;">
		<div class="modal_content">
			<p>닉네임을 입력하세요.</p>
		</div>
	</div>

	<div id="rpwdAlert" class="modal" style="display: none;">
		<div class="modal_content">
			<p>비밀번호를 입력하세요.</p>
		</div>
	</div>

	<div id="noiddAlert" class="modal" style="display: none;">
		<div class="modal_content">
			<p>댓글 작성자만 삭제 할 수 있습니다.</p>
		</div>
	</div>
</body>
<script type="text/javascript">
var deleteModal = document.getElementById("delete_modal");
document.getElementsByClassName("close")[0].onclick = function() {
	deleteModal.style.display = "none";
}

window.onclick = function(event) {
    if (event.target.className == "modal") {
    	event.target.style.display = "none";
    }
}
</script>
</html>