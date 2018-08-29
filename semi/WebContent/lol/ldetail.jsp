<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ldetail</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="w3-bar w3-top w3-pale-red w3-large" style="z-index:4;">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-white" onclick="myFunction('Demo1')"><i class="fa fa-bars"></i>  Menu</button>
  <span class="w3-bar-item w3-right">Logo</span>
  <button
	class="w3-btn w3-round w3-ripple w3-pale-red w3-large w3-right"
	onclick="openRightMenu()" id="wish">
	<i class="fa fa-shopping-cart"></i>
  </button>
   <button class="w3-bar-item w3-button w3-hide-large w3-hover-white w3-right"><i class="fa fa-user-plus"></i></button>
   <button class="w3-bar-item w3-button w3-hide-large w3-hover-white w3-right"><i class="fa fa-user-circle"></i></button>
</div>
 
 <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>



<div class="w3-main" style="margin-left:1px; margin-top: 43px;" id="content">
   
<div id="Demo1" class="w3-hide w3-pale-red" style="position: absolute;width: 100%;">
	<a class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large" href="#"><img alt="" src="/semi/images/슈퍼마리오아이콘.png" style="width: 30px;"> Go</a>
	<a class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large" href="/semi/lol/lboard.do"><img alt="" src="/semi/images/포켓몬아이콘.png" style="width: 30px;"> lol</a>
  	<a class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large" href="/semi/lol/list.do"><img alt="" src="img/25.gif" style="width: 30px;"> Icon</a>
  	<a class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large" href="#"><img alt="" src="/semi/images/롤아이콘.png" style="width: 30px;"> LoL</a>
  	<a class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large" href="#"><img alt="" src="/semi/images/음악아이콘.png" style="width: 30px;"> Music</a>
</div>

<div class="w3-container" style="min-height: 865px;">


<div class="w3-panel w3-border">

	<img src="img/${vo.num }.png" style="width: 50px;margin-top: 10px;"> <span>${vo.nic }</span>
	<i class="fa fa-check-square-o w3-right fa-lg w3-margin"> ${vo.hit }</i>
	<i class="fa fa-twitch w3-right fa-lg w3-margin">  ${vo.commCnt }</i><br>
	<i class="fa fa-warning w3-right fa-lg w3-margin"></i> 
		${vo.regdate }
	
<hr style="border-color: pale-red;">
	<div class="w3-margin">
		${vo.title }
	<div class="w3-right">
		<c:choose>
			<c:when test="${id != null}">
				<c:choose>
					<c:when test="${isrecomm == 'true' }">
						<button class="w3-btn w3-round w3-ripple" 
							onclick="location='/semi/lol/lrecommdelete.do?id=${id}&bnum=${vo.bnum }'"><i class="fa fa-thumbs-o-down fa-lg"></i> </button>
						${vo.recomm }
					</c:when>
					<c:otherwise>
						<button class="w3-btn w3-round w3-ripple" 
							onclick="location='/semi/lol/lrecomminsert.do?id=${id}&bnum=${vo.bnum }'"><i class="fa fa-thumbs-o-up fa-lg"></i> </button>
						${vo.recomm }
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<button class="w3-btn w3-round w3-ripple" disabled="disabled"><i class="fa fa-thumbs-o-up fa-lg"></i> </button>
				${vo.recomm }
			</c:otherwise>
		</c:choose>
	</div>
	</div>
	
<hr style="border-color: pale-red;">
	
<div class="w3-panel w3-pale-red w3-round-xlarge w3-margin w3-padding-32">
	<div class="w3-margin">
		${vo.content }
		<c:choose>
			<c:when test="${id == vo.id}">
				<br>
					<button class="w3-btn w3-round w3-ripple w3-right" onclick="document.getElementById('delete').style.display='block'"><i class="fa fa-trash"></i></button>
					<button class="w3-btn w3-round w3-ripple w3-right" onclick="document.getElementById('update').style.display='block'"><i class="fa fa-pencil-square-o"></i></button>
			</c:when>
			<c:otherwise>
				<br>
					<button class="w3-btn w3-round w3-ripple w3-right" disabled="disabled"><i class="fa fa-trash"></i></button>
					<button class="w3-btn w3-round w3-ripple w3-right" disabled="disabled"><i class="fa fa-pencil-square-o"></i></button>
			</c:otherwise>
		</c:choose>
	</div>
</div>


</div>
<!-- 글수정 modal -->
	<div id="update" class="w3-modal">
		<div class="w3-modal-content w3-animate-bottom w3-card-4" style="width: 600px;">
			<header class="w3-container w3-pale-red">
				<span onclick="document.getElementById('update').style.display='none'"
					class="w3-btn w3-round w3-ripple w3-display-topright"><i class="fa fa-close"></i></span>
				<h2>글수정</h2>
			</header>
			<div class="w3-container w3-margin">
			<form action="lupdate.do?bnum=${vo.bnum }" method="post">
			
				<input type="text" name="title" placeholder="title" class="w3-round w3-margin"><br>
	 			<textarea rows="10" cols="50" placeholder="content" class="w3-round w3-margin" name="content"></textarea>
	 			
	 			<button class="w3-btn w3-round w3-ripple w3-pale-red w3-margin w3-right">수정</button>
	 		</form>
			</div>
		</div>
	</div>

<!-- 글삭제 modal -->
	<div id="delete" class="w3-modal">
		<div class="w3-modal-content w3-animate-bottom w3-card-4" style="width: 600px;">
			<header class="w3-container w3-pale-red">
				<span onclick="document.getElementById('delete').style.display='none'"
					class="w3-btn w3-round w3-ripple w3-display-topright"><i class="fa fa-close"></i></span>
				<h2>글삭제</h2>
			</header>
			<div class="w3-container w3-margin">
				<button class="w3-btn w3-round w3-ripple w3-right" onclick="location='/semi/lol/ldelete.do?bnum=${vo.bnum }'"><i class="fa fa-trash"></i></button>
			</div>
		</div>
	</div>

<div class="w3-panel w3-border">
	
	<h5>Comments</h5>
	<hr style="border-color: pale-red;">

<c:forEach var="vo" items="${list }">
	<div class="w3-margin">
	<img src="img/${vo.num }.png" style="width: 40px;"> ${vo.nic } 
		<div class="w3-right" style="margin-top: 30px;">
			${vo.regdate }
		</div>
	<hr style="border-color: pale-red;">
	<div class="w3-panel w3-pale-red w3-round-xlarge w3-margin w3-padding-16">
		<div class="w3-margin">
			${vo.content }
		
		<c:choose>
			<c:when test="${id == vo.id}">
				<br>
					<button class="w3-btn w3-round w3-ripple w3-right" onclick="location='/semi/lol/
					lcdelete.do?cnum=${vo.cnum}&bnum=${vo.bnum }'"><i class="fa fa-trash"></i></button>
			</c:when>
			<c:otherwise>
				<br>
					<button class="w3-btn w3-round w3-ripple w3-right" disabled="disabled"><i class="fa fa-trash"></i></button>
			</c:otherwise>
		</c:choose>
		</div>
		</div>
		<br>
</div>
</c:forEach>


<div class="w3-margin">
	<form method="post" action="lcinsert.do">
		<textarea rows="5" cols="50" class="w3-round" placeholder="comment" name="content"></textarea><br>
		<button class="w3-btn w3-round w3-ripple w3-pale-red">등록</button>
		<input type="hidden" name="id" value="${id }">
		<input type="hidden" name="bnum" value="${vo.bnum }">
	</form>
</div>
</div>
</div>

<script type="text/javascript">
	
	//Open and close the sidebar on medium and small screens
	function w3_open() {
	 document.getElementById("mySidebar").style.display = "block";
	 document.getElementById("myOverlay").style.display = "block";
	}
	function w3_close() {
	 document.getElementById("mySidebar").style.display = "none";
	 document.getElementById("myOverlay").style.display = "none";
	}
	function myFunction(id) {
	    var x = document.getElementById(id);
	    if (x.className.indexOf("w3-show") == -1) {
	        x.className += " w3-show";
	    } else { 
	        x.className = x.className.replace(" w3-show", "");
	    }
	}
	
</script>

</body>

</html>







