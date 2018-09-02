window.onload = function(){
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

	if (event.target.className == "modal") {
		event.target.style.display = "none";
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
	popNum.style.top = (event.pageY + 20) + "px";
	popNum.style.left = (event.pageX - 40) + "px";
}