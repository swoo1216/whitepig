window.onclick = function(event) { // 모달 닫기
	if (event.target.className == "modal") {
		event.target.style.display = "none";
		pt.imsee = false;
	}
}

window.onload = function(){
	var clickPopup = document.getElementsByClassName("clickPopup"); // 마우스포인터 효과
	for (var i = 0; i < clickPopup.length; i++) {
		clickPopup[i].addEventListener("mouseover", function() { // 팝업
			this.style.cursor = "pointer";
		}, false);
	}

	var popup = document.getElementsByClassName("popup");

	for (var i = 0; i < popup.length; i++) {  // 마우스 떠나면 꺼지기
		popup[i].addEventListener("mouseleave", function() {
			this.style.display = "none";
		}, false);
	}
}

function pantalk(receiverId, receiverNic) {
	const top = window.innerHeight || document.body.clientHeight;
	const left = window.innerWidth || document.body.clientWidth;

	const width = 50;
	const height = 50;
	
	this.receiverId = receiverId;
	this.receiverNic = receiverNic;
	
	this.senderId = "";
	this.getSenderId = function(){
		return this.senderId;
	}
	this.senderNic = "";
	this.getSenderNic = function(){
		return this.senderNic;
	}
	this.selectedInd = 0;
	
	this.imsee = false;
	
	this.hiddenId = document.createElement("input");
	this.hiddenId.type = "hidden";
	this.hiddenId.id = "hiddenId";
	this.hiddenId.value = this.senderId;
	
	this.hiddenNic = document.createElement("input");
	this.hiddenNic.type = "hidden";
	this.hiddenNic.id = "hiddenNic";
	this.hiddenNic.value = this.senderNic;
	
	document.body.appendChild(this.hiddenId);
	document.body.appendChild(this.hiddenNic);
	
	this.setHiddenId = function(hiddenId){
		this.senderId = hiddenId;
		this.hiddenId.value = this.senderId;
	}
	
	this.setHiddenNic = function(hiddenNic){
		this.senderNic = hiddenNic;
		this.hiddenNic.value = this.senderNic;
	}
	
	// 유저별 쪽지 목록 style
	this.userDiv = document.createElement("div");
	this.userDiv.id = "senderUsers";
	this.userDiv.style.display = "none";
	this.userDiv.style.position = "fixed";
	this.userDiv.style.outline = "2px solid #ff6666";
	this.userDiv.style.top = (top - 200) + "px";
	this.userDiv.style.left = (left - 170) + "px";
	this.userDiv.style.backgroundColor = "white";
	this.userDiv.style.zIndex = "1001";
	this.userDiv.style.height = "100px";
	this.userDiv.style.overflowY = "auto";
	this.userDiv.addEventListener("mouseleave", function(){
		this.style.display = "none";
	}, false);
	
	this.div = document.createElement("div"); // 유저들 호출
	this.div.addEventListener("click", function() {
		if(!receiverId)
			return;
		document.getElementById("senderUsers").style.display = "block";
	}, false);
	
	this.div.addEventListener("mouseover", function(){
		this.style.cursor = "pointer";
	}, false);

	// divStyle 배지 전체 쪽지 카운트
	this.div.style.position = "fixed";
	this.div.style.top = (top - height - 50) + "px";
	this.div.style.left = (left - width - 50) + "px";
	this.div.style.backgroundColor = "#ffccff";
	this.div.style.width = width + "px";
	this.div.style.height = height + "px";
	this.div.style.lineHeight =  height + "px";
	this.div.style.borderRadius = 50 + "px";
	this.div.style.textAlign = "center";
	this.div.style.zIndex = "1000";
	this.div.innerHTML = "";
	
	var text = document.createTextNode("");
	this.div.appendChild(text);
	
	document.body.appendChild(this.div);
	document.body.appendChild(this.userDiv);
	
	this.startCount = function(){ // 배지 카운트
		var si = setInterval(function (){
			xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var text = this.responseText;
					var json = JSON.parse(text);
					
					updateCount(json);
				}
			}
			xhr.open("get", "/semi/go/SenderList.do?receiver=" + receiverId, true);
			xhr.send();
		}, 1000);
	}
	
	this.chatList = document.createElement("div"); // 채팅u
	this.chatList.id = "userTalk";
	this.chatList.className = "modal";
	this.chatList.style.display = "none";
	
	this.modal_content = document.createElement("div");
	this.modal_content.className = "modal_content2";

	
	this.chatList.appendChild(this.modal_content);
	document.body.appendChild(this.chatList);
	
	this.inputDiv = document.createElement("div"); // 입력
	this.inputDiv.id = "userInput";
	this.inputDiv.style.width = "220px";
	this.inputDiv.style.margin = "auto";
	this.inputDiv.style.backgroundColor = "white";
	
	
	var textInput = document.createElement("input");
	textInput.id = "chatInput";
	textInput.type = "text";
	textInput.addEventListener("keyup", function(){
		if(event.keyCode != 13)
			return;
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				// document.getElementById("userTalk").style.display = "none";
				document.getElementById("chatInput").value = "";
			}
		}
		var senderId = document.getElementById("hiddenId").value;
		var content = document.getElementById("chatInput").value;
		if(!content)
			return;
		// 이번엔 내가 보내는 사람
		xhr.open("get", "/semi/go/insertPantalk.do?sender=" + receiverId + "&receiver=" + senderId + "&content=" + content);
		xhr.send();
	}, false);
	
	var inputText = document.createTextNode("입력");
	var inputBtn = document.createElement("button");
	inputBtn.type = "button";
	inputBtn.style.float = "none";
	inputBtn.style.marginTop = "0px";
	inputBtn.addEventListener("click", function(){
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				document.getElementById("chatInput").value = "";
			}
		}
		var senderId = document.getElementById("hiddenId").value;
		var content = document.getElementById("chatInput").value;
		// 이번엔 내가 보내는 사람
		xhr.open("get", "/semi/go/insertPantalk.do?sender=" + receiverId + "&receiver=" + senderId + "&content=" + content);
		xhr.send();
	}, false);
	inputBtn.appendChild(inputText);
	
	this.inputDiv.appendChild(textInput);
	this.inputDiv.appendChild(inputBtn);	
	
	this.chatList.appendChild(this.inputDiv)
	// document.body.appendChild(this.inputDiv);
}

function updateCount(json){ // 카운트 업데이트
	if(!pt.receiverId){
		pt.div.innerHTML = "";
		var text = document.createTextNode("*^^*");
		pt.div.appendChild(text);
		return;
	}
	
	
	pt.div.innerHTML = "";
	// 전체 쪽지 카운트
	var text = document.createTextNode(json.count);
	pt.div.appendChild(text);
	
	pt.userDiv.innerHTML = "";
	// 유저별 카운트
	for (var i = 0; i < json.senderList.length; i++) { // 유저별 목록
		var j = json.senderList[i].senderNic;
		var c = json.senderList[i].senderCount;
		
		var senderId = json.senderList[i].senderId;
		
		var text = document.createTextNode(j + " " + c);
		var childDiv = document.createElement("div");
		var tdiv = document.createElement("div");
		tdiv.id = "user" + i;
		tdiv.addEventListener("mouseover", function(){
			this.style.cursor = "pointer";
		}, false);
		tdiv.addEventListener("click", function(){ // 수신확인
			pt.selectedInd = this.id.substring(4, this.id.length);
			pt.setHiddenId(json.senderList[pt.selectedInd].senderId); // 송신자
																		// 선택
			pt.setHiddenNic(json.senderList[pt.selectedInd].senderNic);
			pt.chatList.style.display = "block";
			pt.inputDiv.style.display = "block";
			xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				pt.imsee = true;
			}
			xhr.open('get', '/semi/go/SendOkPantalk.do?sender=' + pt.senderId + '&receiver=' + pt.receiverId, true);
			xhr.send();
		}, false);
		
		tdiv.appendChild(text);	
		childDiv.appendChild(tdiv);
		
		childDiv.addEventListener("mouseover", function() {
			this.style.cursor = "pointer";
		}, false);
		childDiv.addEventListener("mouseout", function() {
			this.style.cursor = "auto";
		}, false);
		
		pt.userDiv.appendChild(childDiv);// 유저 리스트 붙이기
		
		var table = document.createElement("table");
		table.style.maxHeight = "100%";
		table.style.overflowY = "scroll";
		var tbody = document.createElement("tbody");
		for(var ii = 0; ii< json.senderList[pt.selectedInd].talkList.length; ii++){
			var talk = json.senderList[pt.selectedInd].talkList[ii];
			
			xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				
			}
			xhr.open('get', '/semi/go/SendOkPantalk.do?sender=' + pt.senderId + '&receiver=' + pt.receiverId, true);
			if(pt.imsee)
				xhr.send();
			
			pt.modal_content.innerHTML = "";
			
			var tr = document.createElement("tr");
			var td = document.createElement("td");
			if(talk.sender === pt.receiverId){
				td.style.textAlign = "right";
			}else{
				td.style.textAlign = "left";
			}
			
			var nic = document.createTextNode(talk.senderNic);
			// nic.style.fontSize = "5px";
			var br = document.createElement("br");
			var content = document.createTextNode(talk.content);
			td.appendChild(nic);
			td.appendChild(br);
			td.appendChild(content);
			tr.appendChild(td);
			tbody.appendChild(tr);
		}
		
		table.appendChild(tbody);
		pt.modal_content.appendChild(table);
		
		var mc2 = document.getElementsByClassName("modal_content2")[0];
		mc2.scrollTop = mc2.scrollHeight;
	}
}


// 쪽지 보내기
function sendMsg(senderId, senderNic, receiverId, receiverNic) { 
	if (!senderId) {
		var loginAlert = document.createElement("div");
		loginAlert.className = "modal";
		loginAlert.style.display = "block";

		var modalContent = document.createElement("div");
		modalContent.className = "modal_content";
		var p = document.createElement("p");
		var text = document.createTextNode("로그인해주세요");

		p.appendChild(text);
		modalContent.appendChild(p);
		loginAlert.appendChild(modalContent);

		document.body.appendChild(loginAlert);

		setTimeout(function() {
			loginAlert.style.display = "none";
		}, 2000);
		return;
	} else {
		var sendForm = document.createElement("div"); // 쪽지
		sendForm.className = "modal";
		sendForm.style.display = "block";

		var modalContent = document.createElement("div");
		modalContent.className = "modal_content";

		var userDiv = document.createElement("div");
		// contentDiv.style.height="100px";
		
		var table = document.createElement("table");
		table.style.textAlign = "left";
		var tbody = document.createElement("tbody");
		
		var tr1 = document.createElement("tr");
		var tr2 = document.createElement("tr");
		var tr3 = document.createElement("tr");
		
		var tr1_td1 = document.createElement("td");
		var tr1_td2 = document.createElement("td");
		
		var tr2_td1 = document.createElement("td");
		var tr2_td2 = document.createElement("td");
		
		var tr3_td1 = document.createElement("td");
		tr3_td1.colSpan = "2";
		
		var sText1 = document.createTextNode("보내는 사람");
		var sText2 = document.createTextNode(senderNic);
		var rText1 = document.createTextNode("받는 사람");
		var rText2 = document.createTextNode(receiverNic);
		
		var input = document.createElement("input");
		input.type = "text";
		input.addEventListener("keyup", function () { // 쪽지
			if(!input.value)
				return;
			if(event.keyCode != 13)
				return;
			xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					sendForm.style.display = "none";
				}
			}
			xhr.open("get", "/semi/go/insertPantalk.do?sender=" + senderId + "&receiver=" + receiverId + "&content=" + input.value);
			xhr.send();
		}, false);
		var inputBtn = document.createElement("button");
		inputBtn.style.float = "none";
		inputBtn.addEventListener("click", function () { // 쪽지
			if(!input.value)
				return;
			xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					sendForm.style.display = "none";
				}
			}
			xhr.open("get", "/semi/go/insertPantalk.do?sender=" + senderId + "&receiver=" + receiverId + "&content=" + input.value);
			xhr.send();
		}, false);
		var btnText = document.createTextNode("전송");
		inputBtn.appendChild(btnText);
		
		tr1_td1.appendChild(sText1);
		tr1_td2.appendChild(sText2);
		
		tr2_td1.appendChild(rText1);
		tr2_td2.appendChild(rText2);
		
		tr3_td1.appendChild(input);
		tr3_td1.appendChild(inputBtn);
		
		tr1.appendChild(tr1_td1);
		tr1.appendChild(tr1_td2);
		
		tr2.appendChild(tr2_td1);
		tr2.appendChild(tr2_td2);
		
		tr3.appendChild(tr3_td1);
		
		tbody.appendChild(tr1);
		tbody.appendChild(tr2);
		tbody.appendChild(tr3);
		
		table.appendChild(tbody);
		
		modalContent.appendChild(table);
		sendForm.appendChild(modalContent);
		document.body.appendChild(sendForm);
	}
}

// 신고하기
function sendReport(reporterId, reporterNic, suspectId, suspectNic) { 
	if (!reporterId) {
		var loginAlert = document.createElement("div");
		loginAlert.className = "modal";
		loginAlert.style.display = "block";

		var modalContent = document.createElement("div");
		modalContent.className = "modal_content";
		var p = document.createElement("p");
		var text = document.createTextNode("로그인해주세요");

		p.appendChild(text);
		modalContent.appendChild(p);
		loginAlert.appendChild(modalContent);

		document.body.appendChild(loginAlert);

		setTimeout(function() {
			loginAlert.style.display = "none";
		}, 2000);
		return;
	} else { // 신고
		var sendForm = document.createElement("div");
		sendForm.className = "modal";
		sendForm.style.display = "block";

		var modalContent = document.createElement("div");
		modalContent.className = "modal_content";

		var userDiv = document.createElement("div");
		
		var table = document.createElement("table");
		table.style.textAlign = "left";
		var tbody = document.createElement("tbody");
		
		var tr1 = document.createElement("tr");
		var tr2 = document.createElement("tr");
		var tr3 = document.createElement("tr");
		var tr4 = document.createElement("tr");
		
		var tr1_td1 = document.createElement("td");
		var tr1_td2 = document.createElement("td");
		
		var tr2_td1 = document.createElement("td");
		var tr2_td2 = document.createElement("td");
		
		var tr3_td1 = document.createElement("td");
		var tr3_td2 = document.createElement("td");
		
		var tr4_td1 = document.createElement("td");
		tr4_td1.colSpan = "2";
		
		var sText1 = document.createTextNode("신고자");
		var sText2 = document.createTextNode(reporterNic);
		var rText1 = document.createTextNode("피신고자");
		var rText2 = document.createTextNode(suspectNic);
		
		var rtypeText = document.createTextNode("신고유형");
		
		var rtype = document.createElement("select");
		
		var optionText1 = document.createTextNode("욕설"); // rtype
		var optionText2 = document.createTextNode("부적절한 내용");
		var optionText3 = document.createTextNode("관리자 비난");
		var optionText4 = document.createTextNode("Guitar");
		
		var option1 = document.createElement("option");
		option1.value = "욕설"
		var option2 = document.createElement("option");
		option2.value = "부적절한 내용";
		var option3 = document.createElement("option");
		option3.value = "관리자 비난";
		var option4 = document.createElement("option");
		option4.value = "Guitar";
		
		option1.appendChild(optionText1);
		option2.appendChild(optionText2);
		option3.appendChild(optionText3);
		option4.appendChild(optionText4);
		
		rtype.appendChild(option1);
		rtype.appendChild(option2);
		rtype.appendChild(option3);
		rtype.appendChild(option4);
		
		
		var input = document.createElement("textarea");

		var inputBtn = document.createElement("button");
		inputBtn.style.float = "none";
		inputBtn.addEventListener("click", function () { // 쪽지
			if(!input.value)
				return;
			xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					sendForm.style.display = "none";
				}
			}
			xhr.open("get", "/semi/go/InsertReport.do?reporter=" + reporterId + "&suspect=" + suspectId + "&rtype=" + rtype.value + "&content=" + input.value);
			xhr.send();
		}, false);
		var btnText = document.createTextNode("전송");
		inputBtn.appendChild(btnText);
		
		tr1_td1.appendChild(sText1);
		tr1_td2.appendChild(sText2);
		
		tr2_td1.appendChild(rText1);
		tr2_td2.appendChild(rText2);
		
		tr3_td1.appendChild(rtypeText);
		tr3_td2.appendChild(rtype);
		
		tr4_td1.appendChild(input);
		tr4_td1.appendChild(inputBtn);
		
		tr1.appendChild(tr1_td1);
		tr1.appendChild(tr1_td2);
		
		tr2.appendChild(tr2_td1);
		tr2.appendChild(tr2_td2);
		
		tr3.appendChild(tr3_td1);
		tr3.appendChild(tr3_td2);
		
		tr4.appendChild(tr4_td1);
		
		tbody.appendChild(tr1);
		tbody.appendChild(tr2);
		tbody.appendChild(tr3);
		tbody.appendChild(tr4);
		
		table.appendChild(tbody);
		
		modalContent.appendChild(table);
		sendForm.appendChild(modalContent);
		document.body.appendChild(sendForm);
	}
}

function showPopup(popNum) { // 팝업띄우기
	var popup = document.getElementsByClassName("popup");

	for (var i = 0; i < popup.length; i++) {
		popup[i].style.display = "none";
	}

	var popNum = document.getElementById(popNum);
	popNum.style.display = "block";
	popNum.style.position = "absolute";
	popNum.style.top = (event.pageY+20) + "px";
	popNum.style.left = (event.pageX -40) + "px";
}