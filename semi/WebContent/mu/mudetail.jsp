<%@page import="pp.main.vo.MainVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var xhrinsert = null;
	function addMcomments(commBnum, commId) {
		var mcomments = document.getElementById("writecomm").value;
		if (!mcomments) {
			alert("내용을 입력");
			return;
		}
		xhrinsert = new XMLHttpRequest();
		xhrinsert.onreadystatechange = mCheckInsert;
		xhrinsert.open('post', 'mcomminsert.do', true);
		xhrinsert.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		/*id  */
		var param = "commid=" + commId + "&commbnum=" + commBnum
				+ "&mcomments=" + mcomments;
		xhrinsert.send(param);
	}
	function mCheckInsert() {
		if (xhrinsert.readyState == 4 && xhrinsert.status == 200) {
			var text = xhrinsert.responseText;
			var jmcInsert = JSON.parse(text);
			if (jmcInsert.mcommResult == 1) {
				document.getElementById("writecomm").value = "";
				document.getElementById("mcomment").style.display = "none";
				mGetList();
			} else {
				alert("bb");
			}
		}
	}
	var xhrlist = null;
	function mGetList() {
	}
	function mCheckList() {
		if (xhrlist.readyState == 4 && xhrlist.status == 200) {
			mremoveAll();
			var text = xhrlist.responseText;
			var jmcList = JSON.parse(text);
			console.log(jmcList);
			var list = document.getElementById("commList");
			for (var i = 0; i < jmcList.length; i++) {
				var nic = jmcList[i].nic;
				var num = jmcList[i].num;
				var content = jmcList[i].content;
				var regdate = jmcList[i].regdate;
				var div = document.createElement("div");
				div.className = "w3-panel w3-round-xxlarge w3-light-grey w3-padding-large";
				div.innerHTML = "<img src='/semi/poke/img/"+num+".png' style='height: 35px; float: left;'>"
						+ "<h3>"
						+ nic
						+ "</h3>"
						+ "<hr>"
						+ "<p style='float: left;'>"
						+ content
						+ "</p>"
						+ '<p class="w3-right">' + regdate + "</p>";
				list.appendChild(div);
			}
		}
	}
	function mremoveAll() {
		var mcommList = document.getElementById("commList");
		var nodes = mcommList.childNodes;
		for (var i = nodes.length - 1; i >= 0; i--) {//뒤에서부터 자식요소 지우기
			var child = nodes.item(i);
			mcommList.removeChild(child);
		}
	}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body onload="mGetList()">

	<div class="w3-pale-red  w3-container ">
		<div class="w3-padding-64 w3-padding-large">

			<h1 class="w3-button" id="h1">${vo.id }</h1>


			<p class="w3-opacity">GET IN TOUCH</p>

			<form class="w3-container w3-card w3-padding-32 w3-white">
				<div class="w3-section">
					<input class="w3-input" style="width: 100%;" type="text"
						value="${vo.title }" readonly="readonly" required>
				</div>
				<div class="w3-section">
					<textarea class="w3-input" style="width: 100%;" rows="10"
						type="text" readonly="readonly" required>${vo.content }</textarea>
				</div>

				<div>
					<audio controls> <source src="../music/${vo.path }"
						type="audio/mpeg">
				</div>
				<button type="button" class="w3-btn w3-right w3-pale-red "
					onclick="document.getElementById('mcomment').style.display='block'">댓글</button>
			</form>
			<div
				class="w3-panel w3-round-xxlarge w3-white w3-padding-large w3-bar"
				id="mcomment" style="display: none">
				<div>
					<img alt=""  src='"/semi/poke/img/"+ ${num } + ".png"'> 
					<h3>${nic }</h3>
					<hr>
					<textarea rows="5" style="width: 100%" id="writecomm"></textarea>
					<button type="button" class="w3-btn w3-right w3-pale-red "
						onclick="addMcomments('${vo.bnum }','${id }')">작성</button>
					<button type="button" class="w3-btn w3-right w3-pale-red "
						onclick="document.getElementById('mcomment').style.display='none'">닫기</button>
					<br>
					<button class="w3-btn w3-round w3-ripple w3-right"
						onclick="document.getElementById('delete').style.display='block'">
						<i class="fa fa-trash"></i>
					</button>
					<button class="w3-btn w3-round w3-ripple w3-right"
						onclick="mGetList()">
						<i class="fa fa-pencil-square-o"></i>
					</button>

					<button class="w3-btn w3-round w3-ripple w3-right"
						disabled="disabled">
						<i class="fa fa-trash"></i>
					</button>
					<button class="w3-btn w3-round w3-ripple w3-right"
						disabled="disabled">
						<i class="fa fa-pencil-square-o"></i>
					</button>
					<button class="w3-btn w3-round w3-ripple">
						<i class="fa fa-thumbs-o-up fa-lg"></i>
					</button>
					<button class="w3-btn w3-round w3-ripple" disabled="disabled">
						<i class="fa fa-thumbs-o-up fa-lg"></i>
					</button>
				</div>
			</div>
			<div id="commList"></div>
		</div>

	</div>


</body>
<script type="text/javascript">
	var bnum = ${vo.bnum};
	xhrlist = new XMLHttpRequest();
	xhrlist.onreadystatechange = mCheckList;
	xhrlist.open('get', 'mcommlist.do?bnum=' + bnum, true);
	xhrlist.send();
</script>
</html>