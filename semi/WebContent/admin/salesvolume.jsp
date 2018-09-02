<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<div class="w3-container">
<div class="w3-container w3-dark-gray"><h2>판매량</h2></div>
<%
	ArrayList<String> list=(ArrayList)request.getAttribute("list");
	for(int i=0;i<list.size();i++){
		String svolume=list.get(i);
		String[] a=svolume.split(",");
%>
		<div class="w3-panel w3-light-gray w3-leftbar w3-border-gray">
		    <img src="../img/<%=a[1] %>.png" style="height: 50px">
		    <img src="../img/<%=a[1] %>.gif">
		    <p>판매량 :<%=a[0] %></p>
	 	</div>	 	
<%	 				
	}
%>
</div>
</body>
</html>