<%@page import="pp.main.dao.MainDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String check=request.getParameter("check");
	MainDao dao= new MainDao();
	int n = dao.login(id, pwd);
	if(n>0)
	{
		if(check!=null)
		{
			//쿠키생성
			Cookie cook = new Cookie("id",id);
			cook.setMaxAge(60*60*24*30);//유지시간 설정-초단위
			cook.setPath("/"); //웹어플리케이션전체(/)에 쿠키사용가능
			response.addCookie(cook);
			Cookie cook1=new Cookie("pwd",pwd);
			cook1.setMaxAge(60*60*24*30);
			response.addCookie(cook1);
		}
	}
%>
</body>
</html>