<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<body>
<div id="wrapper">
	<div id="nav">
<nav class="w3-sidebar w3-center w3-bar-block w3-collapse w3-animate-left w3-card w3-pale-red" style="z-index:3;width:200px;" id="mySidebar">
  <a class="w3-bar-item w3-button w3-border-bottom w3-large w3-hover-white" href="main.jsp"><img src="/semi/바지.png" style="height: 60px;"></a>
  <a class="w3-bar-item w3-button w3-hide-large w3-large w3-hover-white" href="javascript:void(0)" onclick="w3_close()">Close <i class="fa fa-remove"></i></a>
  <a class="w3-bar-item w3-button w3-hover-white" href="#">Go</a>
  <a class="w3-bar-item w3-button w3-hover-white" href="/semi/poke/pboard.do">Poke</a>
  <a class="w3-bar-item w3-button w3-hover-white" href="/semi/poke/list.do">Icon</a>
  <a class="w3-bar-item w3-button w3-hover-white" href="#">LoL</a>
  <a class="w3-bar-item w3-button w3-hover-white" href="#">Music</a>
 </nav>
 
 <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>
</div>

<header class="w3-bar w3-top w3-hide-large w3-pale-red w3-large">
  <div class="w3-bar-item w3-padding-24 w3-wide"></div>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-hover-white w3-padding-24 w3-left" onclick="w3_open()"><i class="fa fa-bars"></i></a>
</header>

 <div class="w3-hide-large" style="margin-top:66px"></div>
 
<div class="w3-main" style="margin-left:200px;" id="content">
     
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