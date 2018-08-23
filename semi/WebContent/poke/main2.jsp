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
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div id="wrapper">
	<div id="nav">
<nav class="w3-sidebar w3-center w3-bar-block w3-collapse w3-animate-left w3-card w3-pale-red" style="z-index:3;width:250px;" id="mySidebar">
  <a class="w3-bar-item w3-button w3-border-bottom w3-large w3-hover-white" href="main.jsp"><img src="/semi/바지.png" style="height: 80px;"></a>
  <a class="w3-bar-item w3-button w3-hide-large w3-large w3-hover-white" href="javascript:void(0)" onclick="w3_close()">Close <i class="fa fa-remove"></i></a>
  <a class="w3-bar-item w3-button w3-hover-white" href="#">Link 1</a>
  <a class="w3-bar-item w3-button w3-hover-white" href="main.jsp?content=pboard.jsp">Link 2</a>
  <a class="w3-bar-item w3-button w3-hover-white" href="main.jsp?content=/poke/list.do">Link 3</a>
  <a class="w3-bar-item w3-button w3-hover-white" href="#">Link 4</a>
  <a class="w3-bar-item w3-button w3-hover-white" href="#">Link 5</a>
 </nav>
 
 <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>
</div>

<header class="w3-bar w3-top w3-hide-large w3-pale-red w3-xlarge">
  <div class="w3-bar-item w3-padding-24 w3-wide"></div>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-24 w3-left" onclick="w3_open()"><i class="fa fa-bars"></i></a>
</header>

<div class="w3-main" style="margin-left:250px;" id="content">

 <div class="w3-hide-large" style="margin-top:83px"></div>




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
					"<img src='img/"+json.list[i]+".gif' style='width: 80px'>"+
					"<button class='w3-btn w3-round w3-ripple w3-teal w3-margin'"+
					" disabled='disabled' title='구매'><i class='fa fa-money fa-lg'></i></button>"+
					"<button class='w3-btn w3-round w3-rip w3-teal'"+
						"onclick='removeWish("+json.list[i]+")' title='삭제'>"+
						"<i class='fa fa-close'></i></button></div>";
					</c:when>
					<c:otherwise>
					wish.innerHTML+=
					"<div class='w3-container w3-margin'>"+
					"<img src='img/"+json.list[i]+".gif' style='width: 80px'>"+
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
		style="display: none; right: 0; width: 350px; height: 90%;"
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
				<img src="img/${list }.gif" style="width: 80px">
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

	<header class="w3-container w3-teal">

		<button
			class="w3-btn w3-round w3-ripple w3-teal w3-xlarge w3-right w3-margin"
			onclick="openRightMenu()" id="wish">
			<i class="fa fa-shopping-cart"></i>
		</button>
		<h1>Icon Store</h1>
	</header>

	<div class="w3-container">
		<div class="w3-margin w3-center">
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


		<div class="w3-center w3-margin">

			<c:forEach var="vo" items="${list }" varStatus="status">
				<c:set var="no" value="${vo.num }" scope="session"></c:set>
				<img src="img/${vo.num }.png" style="width: 80px; cursor: pointer;"
					class="w3-hover-opacity w3-margin" id="img"
					onclick="document.getElementById('icon${ status.count }').style.display='block';"
					title="${vo.name }">
					

				<div id="icon${ status.count }" class="w3-modal">
					<div class="w3-modal-content w3-animate-top w3-card-4">
						<div class="w3-container w3-teal">
							<span
								onclick="document.getElementById('icon${ status.count}').style.display='none'"
								class="w3-btn w3-round w3-ripple w3-display-topright"><i
								class="fa fa-close"></i></span>
							<h2>Icon</h2>
						</div>

						<div class="w3-container w3-margin w3-large">
							<img src="img/${vo.num }.gif" style="width: 100px">
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

		<div class="w3-center">
			<form action="list.do?search=name" method="post">
				<input class="w3-border w3-large w3-round" type="text"
					placeholder="Search for names.." name="keyword"
					style="height: 35px;">
				<button class="w3-btn w3-large w3-round w3-ripple w3-teal w3-margin">Search</button>
			</form>
		</div>
	</div>


	<div class="w3-container w3-center">
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

	<footer class="w3-container w3-teal w3-bottom">
		<h5>Footer</h5>
		<p>Footer information goes here</p>
	</footer>
	
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
	</script>


     
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
	
</script>

</body>
</html>