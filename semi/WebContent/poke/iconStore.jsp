<%@page import="java.io.Console"%>
<%@page import="pp.poke.vo.IconVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pp.poke.dao.IconDao"%>
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
		type: "post",
		url: "/semi/poke/chatInsert.do",
		data: {
			id: id,
			content: content
		},
		success: function(result) {
			if(result == 1){
				$('#contents').val('');
			}else if(result == 0){
				alert('내용을 정확히 입력하세요');
			}else{
				alert('데이터베이스 오류가 발생했습니다.');
			}
		} 
	});
	
}
	
function chatList(type) {
	$.ajax({
		type: "post",
		url: "/semi/poke/chatList.do",
		data: {
			listType: type,
		},
		success: function(data) {
			if(data == "") return;
			var parsed = JSON.parse(data);
			var result = parsed.result;
			for(var i = 0; i<result.length;i++){
				addChat(result[i][0].value, result[i][1].value,result[i][2].value);
			}
			lastNum = Number(parsed.last);
		}
	});
}

function addChat(id,content,regdate) {
	$('#chatList').append('<img src="img/1.png" style="width: 30px">'+ ' ' + id + '<br>' + content + ' ' + regdate + "<hr> <br>" );
	
	
	$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
}
		
function getInfiniteChat() {
	setInterval(function() {
		chatList(lastNum)
	}, 1000);
}		
		
		
		
</script>
</head>
<body>
<div class="w3-bar w3-top w3-pale-red w3-large" style="z-index:4;">
	
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-white" onclick="myFunction('Demo1')"><i class="fa fa-bars"></i>  Menu</button>
  <span class="w3-bar-item w3-right">Logo</span>
  
	<!-- 전체채팅 -->
	<button class="w3-btn w3-round w3-ripple w3-pale-red w3-large w3-right" onclick="document.getElementById('chat').style.display='block'">
		<i class="fa fa-comment"></i>
	</button>
	
  <button
	class="w3-btn w3-round w3-ripple w3-pale-red w3-large w3-right"
	onclick="openRightMenu()" id="wish">
	<i class="fa fa-shopping-cart"></i>
  </button>
  
 <c:choose>
 	<c:when test="${id!=null }">
 		 <button class="w3-button w3-hide-large w3-large w3-hover-white w3-right"><i class="fa fa-sign-out"></i></button>
 		 <img alt="" src="img/1.png" class="w3-right w3-hide-large" style="width: 20px;margin-top: 10px;">
	   </c:when>
	   <c:otherwise>
		   <button class="w3-bar-item w3-button w3-hide-large w3-hover-white w3-right"><i class="fa fa-user-plus"></i></button>
		   <button class="w3-bar-item w3-button w3-hide-large w3-hover-white w3-right"><i class="fa fa-sign-in"></i></button>
	   </c:otherwise>
 </c:choose>
</div>

	<div id="nav">
<nav class="w3-sidebar w3-center w3-bar-block w3-collapse w3-animate-left w3-card w3-pale-red" style="z-index:3;width:250px;height: 100%;" id="mySidebar">
  <a class="w3-bar-item w3-button w3-large w3-hover-white" href="main.jsp"><img src="/semi/바지.png" style="height: 60px;"></a>
  	<!-- 로그인 회원가입 -->
  	<c:choose>
  		<c:when test="${id!=null }">
  			<img alt="" src="img/1.png" style="width: 50px;margin-top: 30px;"> ${nic}
  			<button class="w3-button w3-large w3-hover-white" onclick="location.href='/semi/mlogout.do'"><i class="fa fa-sign-out"></i></button>
  			<hr style="border-color: white;">
  		</c:when>
  		<c:otherwise>
  	<div class="w3-bar w3-border w3-border-white" style="display: flex;margin-top: 20px;">
  			<button class="w3-border-right w3-border-white w3-bar-item w3-button w3-hover-white" onclick="location='/semi/main/login.jsp'">로그인</button>
			<button class="w3-bar-item w3-button w3-hover-white">회원가입</button>
			<hr style="border-color: white;">
	  </div>
  		</c:otherwise>
  	</c:choose>
   
 <a class="w3-bar-item w3-button w3-hover-white" href="#" style="margin-top: 60px;"><img alt="" src="/semi/images/슈퍼마리오아이콘.png" style="width: 50px;"> Go</a>
 	<hr style="border-color: white;">
  <a class="w3-bar-item w3-button w3-hover-white" href="/semi/poke/pboard.do"><img alt="" src="/semi/images/포켓몬아이콘.png" style="width: 50px;"> Poke</a>
  	<hr style="border-color: white;">
  <a class="w3-bar-item w3-button w3-hover-white" href="/semi/poke/list.do"><img alt="" src="img/25.gif" style="width: 50px;"> Icon</a>
	<hr style="border-color: white;">
  <a class="w3-bar-item w3-button w3-hover-white" href="#"><img alt="" src="/semi/images/롤아이콘.png" style="width: 50px;"> LoL</a>
 	<hr style="border-color: white;">	
  <a class="w3-bar-item w3-button w3-hover-white" href="#"><img alt="" src="/semi/images/음악아이콘.png" style="width: 50px;"> Music</a>

 </nav>
 
 <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>
</div>



<div class="w3-main" style="margin-left:250px;margin-top: 43px;" id="content">
   
<div id="Demo1" class="w3-hide w3-pale-red" style="position: absolute;width: 100%;">
	<a class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large" href="#"><img alt="" src="/semi/images/슈퍼마리오아이콘.png" style="width: 30px;"> Go</a>
	<a class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large" href="/semi/poke/pboard.do"><img alt="" src="/semi/images/포켓몬아이콘.png" style="width: 30px;"> Poke</a>
  	<a class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large" href="/semi/poke/list.do"><img alt="" src="img/25.gif" style="width: 30px;"> Icon</a>
  	<a class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large" href="#"><img alt="" src="/semi/images/롤아이콘.png" style="width: 30px;"> LoL</a>
  	<a class="w3-button w3-block w3-left-align w3-hover-white w3-hide-large" href="#"><img alt="" src="/semi/images/음악아이콘.png" style="width: 30px;"> Music</a>
</div>

<div class="w3-container" style="min-height: 650px;">

	<!-- 채팅 modal -->
		<div class="w3-modal" id="chat">
			<div class="w3-modal-content w3-animate-zoom w3-card-4" style="width: 480px;">
				<header class="w3-container w3-teal">
					<span onclick="document.getElementById('chat').style.display='none'" 
						class="w3-btn w3-round w3-ripple w3-display-topright"><i
								class="fa fa-close"></i></span>
						<h2>Chat</h2>
				</header>
				<div class="w3-container">
				
					<div id="chatList" style="width: 450px;height: 500px;overflow: auto;" id="chat">
						
					</div>
					<div>
					<textarea rows="3" cols="40" id="contents"></textarea>
					<input type="button" onclick="submit()" value="전송">
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

<script type="text/javascript">
	function removeWish(num) {
		
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				var text=xhr.responseText;
				var json=JSON.parse(text);
			
				var wish=document.getElementById("rightMenu");
				var nodes=wish.childNodes;
				
				for(var i=nodes.length-1;i>=0;i--){
					wish.removeChild(nodes.item(i));
				}
				
				<c:choose>
				<c:when test="${id==null }">
					wish.innerHTML="<button onclick='closeRightMenu()'" +
					"class='w3-bar-item w3-btn w3-ripple w3-teal w3-large'>Close</button></div>" +
					"<button class='w3-btn w3-round w3-ripple w3-teal w3-margin w3-large' style='width: 80px;' disabled='disabled' title='전체구매'><i class='fa fa-gbp'></i></button>" +
					"<button class='w3-btn w3-round w3-ripple w3-teal w3-margin w3-large' style='width: 80px;' onclick='location=" + "\""+"wishList.do?cmd=remove"+"\""+  "' title='전체삭제'><i class='fa fa-trash'></i></button>";
				</c:when>
				<c:otherwise>
					wish.innerHTML="<button onclick='closeRightMenu()'" +
					"class='w3-bar-item w3-btn w3-ripple w3-teal w3-large'>Close</button></div>" +
					"<button class='w3-btn w3-round w3-ripple w3-teal w3-margin w3-large' style='width: 80px;' title='전체구매'><i class='fa fa-gbp'></i></button>" +
					"<button class='w3-btn w3-round w3-ripple w3-teal w3-margin w3-large' style='width: 80px;' onclick='location="  + "\""+"wishList.do?cmd=remove"+"\""+  "' title='전체삭제'><i class='fa fa-trash'></i></button>";
				</c:otherwise>
				</c:choose>
				
				
				for(var i in json.list){
					<c:choose>
					<c:when test="${id==null }">
					wish.innerHTML+=
					"<div class='w3-container w3-margin'>"+
					"<img src='img/"+json.list[i]+".gif' style='width: 60px'>"+
					"<button class='w3-btn w3-round w3-ripple w3-teal w3-margin'"+
					" disabled='disabled' title='구매'><i class='fa fa-money fa-lg'></i></button>"+
					"<button class='w3-btn w3-round w3-rip w3-teal'"+
						"onclick='removeWish("+json.list[i]+")' title='삭제'>"+
						"<i class='fa fa-close'></i></button></div>";
					</c:when>
					<c:otherwise>
					wish.innerHTML+=
					"<div class='w3-container w3-margin'>"+
					"<img src='img/"+json.list[i]+".gif' style='width: 60px'>"+
					"<button class='w3-btn w3-round w3-ripple w3-teal w3-margin'"+
					"onclick='check("+json.list[i]+")' title='구매'><i class='fa fa-money fa-lg'></i></button>"+
					"<button class='w3-btn w3-round w3-rip w3-teal'"+
						"onclick='removeWish("+json.list[i]+")' title='삭제'>"+
						"<i class='fa fa-close'></i></button></div>";
					</c:otherwise>
					</c:choose>
				}
			}
		}
		xhr.open('get', 'wishList.do?num='+num+'&cmd=delete', true);
		xhr.send();
	}
	function removeAll() {
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				var text=xhr.responseText;
				var json=JSON.parse(text);
			
				var wish=document.getElementById("rightMenu");
				var nodes=wish.childNodes;
				
				for(var i=nodes.length-1;i>=0;i--){
					wish.removeChild(nodes.item(i));
				}
			}
		}
	}
</script>



	<div class="w3-sidebar w3-bar-block w3-card w3-animate-right w3-center"
		style="display: none; right: 0; width: 300px; height: 90%;"
		id="rightMenu">
		<button onclick="closeRightMenu()"
			class="w3-bar-item w3-btn w3-ripple w3-teal w3-large">Close</button>
			
		<c:choose>
			<c:when test="${id==null }">
				<button class="w3-btn w3-round w3-ripple w3-teal w3-margin w3-large"
				style="width: 80px;" title="전체구매" disabled="disabled">
				<i class="fa fa-gbp"></i>
				</button>
			</c:when>
			<c:otherwise>
				<button class="w3-btn w3-round w3-ripple w3-teal w3-margin w3-large"
					style="width: 80px;" title="전체구매">
					<i class="fa fa-gbp"></i>
				</button>
			</c:otherwise>
		</c:choose>
		
		<button class="w3-btn w3-round w3-ripple w3-teal w3-margin w3-large"
			style="width: 80px;" onclick="location='wishList.do?cmd=remove'" title="전체삭제">
			<i class="fa fa-trash"></i>
		</button>

		<c:forEach var="list" items="${wishList }">
			<div class="w3-container w3-margin">
				<img src="img/${list }.gif" style="width: 60px">
				<c:choose>
					<c:when test="${id==null }">
						<button class="w3-btn w3-round w3-ripple w3-teal w3-margin"
						 title="구매" disabled="disabled">
						<i class="fa fa-money fa-lg"></i>
						</button>
					</c:when>
					<c:otherwise>
					<button class="w3-btn w3-round w3-ripple w3-teal w3-margin"
						onclick="check(${list})" title="구매">
						<i class="fa fa-money fa-lg"></i>
					</button>
					</c:otherwise>
				</c:choose>
				<button class="w3-btn w3-round w3-rip w3-teal"
					onclick="removeWish(${list})" title="삭제">
					<i class="fa fa-close"></i>
				</button>

			</div>

		</c:forEach>
	</div>

	
		<div class="w3-center" style="margin-top: 40px;">
			<button class="w3-btn w3-large w3-round w3-ripple w3-teal"
				style="width: 80px;"
				onclick="location='list.do?search=type&keyword=grass'">grass</button>
			<button class="w3-btn w3-large w3-round w3-ripple w3-red"
				style="width: 80px;"
				onclick="location='list.do?search=type&keyword=fire'">fire</button>
			<button class="w3-btn w3-large w3-round w3-ripple w3-blue"
				style="width: 80px;"
				onclick="location='list.do?search=type&keyword=water'">water</button>
		</div>


		<div class="w3-center w3-padding-32">
			<div class="w3-panel w3-teal w3-round-xlarge" style="width: 600px;margin: auto;">
			<c:forEach var="vo" items="${list }" varStatus="status">
				<c:set var="no" value="${vo.num }" scope="session"></c:set>
				<img src="img/${vo.num }.png" style="width: 70px; cursor: pointer;"
					class="w3-hover-grayscale w3-margin" id="img"
					onclick="document.getElementById('icon${ status.count }').style.display='block';"
					title="${vo.name }">
						

				<div id="icon${ status.count }" class="w3-modal">
					<div class="w3-modal-content w3-animate-top w3-card-4" style="width: 600px;">
						<div class="w3-container w3-teal">
							<span
								onclick="document.getElementById('icon${ status.count}').style.display='none'"
								class="w3-btn w3-round w3-ripple w3-display-topright"><i
								class="fa fa-close"></i></span>
							<h2>Icon</h2>
						</div>

						<div class="w3-container w3-margin w3-large">
							<img src="img/${vo.num }.gif" style="width: 60px">
							<div class="w3-panel w3-teal w3-round-xlarge">
								<p>${vo.name }</p>
								<p>${vo.type }</p>
								<p>
									<i class="fa fa-btc"></i> ${vo.price }
								</p>
							</div>
							<p>
							<c:choose>
								<c:when test="${id==null }">
									<button class="w3-btn w3-round w3-ripple w3-teal"
									onclick="check(${vo.num})" title="구매" disabled="disabled">
									<i class="fa fa-money fa-lg"></i>
									</button>
								</c:when>
								<c:otherwise>
								<button class="w3-btn w3-round w3-ripple w3-teal"
									onclick="check(${vo.num})" title="구매">
									<i class="fa fa-money fa-lg"></i>
								</button>
								</c:otherwise>
							</c:choose>
								<button class="w3-btn w3-round w3-ripple w3-teal"
									onclick="location='wishList.do?num=${vo.num}&cmd=insert'"
									title="장바구니">
									<i class="fa fa-cart-arrow-down fa-lg"></i>
								</button>
							</p>
						</div>
					
					</div>

				</div>
				<c:choose>
					<c:when test="${status.count%4==0 }">
						<br>
					</c:when>
				</c:choose>
			</c:forEach>
	</div>	


		<!-- 구매 modal -->
		<div class="w3-modal" id="check">
			<div class="w3-modal-content w3-animate-zoom w3-card-4" style="width: 400px;margin-top: 100px;">
				<header class="w3-container w3-teal">
					<span onclick="document.getElementById('check').style.display='none'" 
						class="w3-btn w3-round w3-ripple w3-display-topright"><i
								class="fa fa-close"></i></span>
						<h2>구매</h2>
				</header>
				<div class="w3-container">
				<form action="checkOut.do" method="get">
					<input type="hidden" id="cart" name="num" value="">
					<button class="w3-button">구매</button>
				</form>
				</div> 
			</div>
		</div>

</div>
		</div>

		<div class="w3-center">
			<form action="list.do?search=name" method="post">
				<input class="w3-round" type="text"
					placeholder="Search for names.." name="keyword"
					style="height: 38px; vertical-align: middle;">
				<button class="w3-btn w3-round w3-ripple w3-teal" style="height: 38px;">Search</button>
			</form>
		</div>

	

	<div class="w3-container w3-center w3-margin" style="min-height: 150px;">
		<div class="w3-bar w3-border w3-round">
			<c:choose>
				<c:when test="${startPage>5 }">
					<a
						href="list.do?pageNum=${startPage-1 }&search=${param.search}&keyword=${param.keyword}"
						class="w3-bar-item w3-btn w3-ripple w3-hover-teal"><i
						class="fa fa-chevron-left"></i></a>
				</c:when>
				<c:otherwise>
					<a href="" class="w3-bar-item w3-btn w3-ripple w3-hover-teal"><i
						class="fa fa-chevron-left"></i></a>
				</c:otherwise>
			</c:choose>

			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:choose>
					<c:when test="${pageNum==i }">
						<a
							href="list.do?pageNum=${i }&search=${param.search}&keyword=${param.keyword}"
							class="w3-bar-item w3-btn w3-ripple w3-teal w3-hover-teal">${i }</a>
					</c:when>
					<c:otherwise>
						<a
							href="list.do?pageNum=${i }&search=${param.search}&keyword=${param.keyword}"
							class="w3-bar-item w3-btn w3-ripple w3-hover-teal">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${endPage<pageCount }">
					<a
						href="list.do?pageNum=${endPage+1 }&search=${param.search}&keyword=${param.keyword}"
						class="w3-bar-item w3-btn w3-ripple w3-hover-teal"><i
						class="fa fa-chevron-right"></i></a>
				</c:when>
				<c:otherwise>
					<a href="" class="w3-bar-item w3-btn w3-ripple w3-hover-teal"><i
						class="fa fa-chevron-right"></i></a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	  
		

	<footer class="w3-container w3-pale-red">
		<div class="w3-right">
			<h5>Footer</h5>
		</div>
	</footer>

    </div>
	
	
	<!-- 에러 modal -->
	<div id="err" class="w3-modal">
		<div class="w3-modal-content w3-animate-opacity w3-card-4" style="width: 400px;margin-top: 100px;">
			<header class="w3-container w3-teal">
				<span onclick="document.getElementById('err').style.display='none'"
					class="w3-btn w3-round w3-ripple w3-display-topright"><i
								class="fa fa-close"></i></span>
					<h2>에러</h2>
			</header>
			<div class="w3-container">
				<p>포인트 부족</p>
			</div>
		</div>
	</div>
	
	<c:if test="${err!=null }">
		<script type="text/javascript">
			document.getElementById("err").style.display='block';
		</script>
	</c:if>
	
	<script type="text/javascript">
		function openRightMenu() {
			document.getElementById("rightMenu").style.display = "block";
		}
		function closeRightMenu() {
			document.getElementById("rightMenu").style.display = "none";
		}
		window.onclick = function(e) {
			var icon = e.target.id.substring(0, 4);
			if(icon === 'icon'){
				e.target.style.display = "none";
				return;
			}
		}
		function check(num) {
			document.getElementById('check').style.display='block';
			document.getElementById("cart").value = num;
			
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

</body>
</html>