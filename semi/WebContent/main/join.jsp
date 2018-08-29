<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<script>
	function idcheck() {
		var id = document.getElementById("id").value;
		if (id == "") {
			document.getElementById("idcheck").innerHTML = "";
			return;
		}
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = callback;
		xhr.open('get', '/semi/mcheck.do?id=' + id, true);
		xhr.send();
	}
	function niccheck() {
		xhr1 = new XMLHttpRequest();
		xhr1.onreadystatechange = callback1;
		var nic = document.getElementById("nic").value;
		xhr1.open('get', '/semi/mcheck.do?nic=' + nic, true);
		xhr1.send();
	}
	/* var nic = document.getElementById("nic").value;
	if(nic == "")
	{
		document.getElementById("niccheck").innerHTML = "";
		return;
	}
	xhr = new XMLHttpRequest();
	xhr.onreadystatechange = callback1;
	xhr.open('get', '/semi/mcheck.do?nic=' + nic, true);
	xhr.send(); 
	}*/
	function callback() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var xml = xhr.responseXML;
			var using = xml.getElementsByTagName("using")[0];
			var u = using.firstChild.nodeValue;
			var span = document.getElementById("idcheck");
			if (u == 1) {
				span.style.color = "red";
				span.innerHTML = "사용할 수 없는 아이디입니다";
			} else {
				span.style.color = "green";
				span.innerHTML = "사용가능한 아이디입니다.";
			}
		}
	}
	function callback1() {
		if (xhr1.readyState == 4 && xhr1.status == 200) {
			var text = xhr1.responseText;
			var json = JSON.parse(text);
			var b = json.nic;
			var span = document.getElementById("niccheck");
			if (b == 'false') {
				span.style.color = "green";
				span.innerHTML = "사용가능한 닉네임입니다";
			} else {
				span.style.color = "red";
				span.innerHTML = "사용 할 수 없는 닉네임입니다.";
			}
		}
	}
	function pwdchk()
	{
		var pwd = document.getElementById("pwd").value;
		var pwd2 = document.getElementById("pwd2").value;
		var span = document.getElementById("pwdcheck");
		if(pwd==pwd2)
		{
			span.style.color = "green";
			span.innerHTML = "사용가능한 비밀번호입니다.";
		}
		else
		{
			span.style.color = "red";
			span.innerHTML = "비밀번호가 불일치합니다.";
		}
	}
</script>
</head>
<body>
	<div id="mainForm">
		<h4>회원가입</h4>
		<form action="/semi/mjoin.do" method="post">
			<div class="w3-section">
				<input class="w3-input w3-border" type="text" placeholder="아이디" name="id" id="id" required onkeyup="idcheck()">
				<span id="idcheck" style="color: red; font-size: 12px"></span><br>
				
				<input class="w3-input w3-border" type="password" placeholder="비밀번호" name="pwd" id="pwd" onkeyup="pwdchk()" required>
				<input class="w3-input w3-border" type="password" placeholder="비밀번호확인" name="pwd2" id="pwd2" onkeyup="pwdchk()" required>
				<span id="pwdcheck" style="color : red; font-size: 12px"></span><br>
				
				<input class="w3-input w3-border" type="text" placeholder="이메일" name="email" required>
				
				<input class="w3-input w3-border" type="text" placeholder="닉네임" name="nic" id="nic" required onkeyup="niccheck()">
				<span id="niccheck" style="font-size: 12px"></span><br>
				
				<button class="w3-button w3-block w3-pink w3-section w3-padding" type="submit">회원가입</button>
			</div>
		</form>
	</div>
</body>
</html>