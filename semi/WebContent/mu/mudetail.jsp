<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var xhr=null;
	function mGetList() {
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=mCheckList;
		xhr.open('get', 'mcomments.do', true);
		xhr.send();		
	}
	function mCheckList(){
		alert("aaa");
	}

</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body onload="mGetList()">
	<div class="w3-dark-gray w3-container">
		<div class="w3-padding-64 w3-padding-large">
			<div class="w3-button" style="float: left">
				<h1>${vo.id }</h1>
			</div>
			<div>aaaa</div>
			<p class="w3-opacity">GET IN TOUCH</p>
			<form class="w3-container w3-card w3-padding-32 w3-white">
				<div class="w3-section">
					<input class="w3-input"
						style="width: 100%;" type="text" value="${vo.title }" readonly="readonly" required>
				</div>
				<div class="w3-section">
					<textarea class="w3-input" style="width: 100%;" rows="10"
						type="text" readonly="readonly" required>${vo.content }</textarea>
				</div>
				<div class="w3-section">
					<label></label> <input class="w3-input" style="width: 100%;"
						type="text" required>
				</div>
				<div>
					<audio controls> <source src="../music/${vo.path }"
						type="audio/mpeg">
				</div>
				<button type="button" class="w3-btn w3-right w3-dark-gray"
					onclick="document.getElementById('mcomment').style.display='block'">댓글</button>
			</form>
			<div
				class="w3-panel w3-round-xxlarge w3-white w3-padding-large w3-bar"
				id="mcomment" style="display: none">
				<div>
					<hr>
					<hr>
					<textarea rows="5"></textarea>
					<button type="button" class="w3-btn w3-right w3-dark-gray"
						onclick="">작성</button>
					<button type="button" class="w3-btn w3-right w3-dark-gray"
						onclick="document.getElementById('mcomment').style.display='none'">닫기</button>

					<br>
					<button class="w3-btn w3-round w3-ripple w3-right"
						onclick="document.getElementById('delete').style.display='block'">
						<i class="fa fa-trash"></i>
					</button>
					<button class="w3-btn w3-round w3-ripple w3-right"
						onclick="document.getElementById('update').style.display='block'">
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
					<button class="w3-btn w3-round w3-ripple"
						>
						<i class="fa fa-thumbs-o-up fa-lg"></i>
					</button>
					<button class="w3-btn w3-round w3-ripple" disabled="disabled">
						<i class="fa fa-thumbs-o-up fa-lg"></i>
					</button>
				</div>
			</div>
			<div class="w3-panel w3-round-xxlarge w3-light-grey w3-padding-large">			
				<h1>aaa</h1>
			</div>
		</div>

	</div>
</body>
</html>