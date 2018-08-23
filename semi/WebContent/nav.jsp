<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript">
	function movePage(pageName) {
		location.href = "index.jsp?content=" + pageName
	}
</script>
<div id="title">
	<img src="바지.png" alt="pants" width="50px"> pants
</div>

		<div class="w3-bar">
			<button class="w3-bar-item w3-button w3-black" 
				onclick="document.getElementById('id01').style.display='block'"
				class="w3-button w3-green w3-large">로그인</button>
			<div id="id01" class="w3-modal">
				<div class="w3-modal-content w3-card-4 w3-animate-zoom"
					style="max-width: 600px">
					<div class="w3-center">
						<br> <span
							onclick="document.getElementById('id01').style.display='none'"
							class="w3-button w3-xlarge w3-hover-red w3-display-topright"
							title="Close Modal">&times;</span>
					</div>
					<form class="w3-container" action="/action_page.php">
						<div class="w3-section">
							<input class="w3-input w3-border w3-margin-bottom" type="text"
								placeholder="Enter ID" name="id" required> <input
								class="w3-input w3-border" type="password"
								placeholder="Enter Password" name="pwd" required>
							<button class="w3-button w3-block w3-green w3-section w3-padding"
								type="submit">Login</button>
							<input class="w3-check w3-margin-top" type="checkbox"
								checked="checked"> Remember me
						</div>
					</form>
					<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
						<button
							onclick="document.getElementById('id01').style.display='none'"
							type="button" class="w3-button w3-red">Cancel</button>
						<span class="w3-right w3-padding w3-hide-small">Forgot <a
							href="#">password?</a></span>
					</div>
				</div>
			</div>
			<button class="w3-bar-item w3-button w3-black"
				onclick="document.getElementById('id02').style.display='block'"
				class="w3-button w3-green w3-large">회원가입</button>
			<div id="id02" class="w3-modal">
				<div class="w3-modal-content w3-card-4 w3-animate-zoom"
					style="max-width: 600px">
					<div class="w3-center">
						<br> <span
							onclick="document.getElementById('id02').style.display='none'"
							class="w3-button w3-xlarge w3-hover-red w3-display-topright"
							title="Close Modal">&times;</span>
					</div>
					<form class="w3-container" action="/semi/main/join.do"
						method="post">
						<div class="w3-section">
							<label><b>Username</b></label> <input class="w3-input w3-border"
								type="text" placeholder="Enter Username" name="id" required>
							<label><b>Password</b></label> <input class="w3-input w3-border"
								type="password" placeholder="Enter Password" name="pwd" required>
							<label><b>Password</b></label> <input class="w3-input w3-border"
								type="password" placeholder="Enter Password" required> <label><b>E-Mail</b></label>
							<input class="w3-input w3-border" type="text"
								placeholder="Enter E-Mail" name="email" required> <label><b>Nickname</b></label>
							<input class="w3-input w3-border" type="text"
								placeholder="Enter Nickname" name="nic" required>
							<button class="w3-button w3-block w3-green w3-section w3-padding"
								type="submit">Join</button>
							<button
								onclick="document.getElementById('id02').style.display='none'"
								type="button"
								class="w3-button w3-block w3-red w3-section w3-padding">Cancel</button>
						</div>
					</form>
				</div>
			</div>
		</div>


<button class="navButton" onclick="movePage('go/index.jsp')">LoL</button>
<button class="navButton">Music</button>
<button class="navButton">Poketmon</button>
<button class="navButton" style="border-bottom: 1px solid white;"
	onclick="movePage('go/index.jsp')">old game</button>
