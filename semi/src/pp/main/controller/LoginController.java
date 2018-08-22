package pp.main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.main.dao.MainDao;

@WebServlet("/mlogin.do")
public class LoginController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("utf-8");
		String id= request.getParameter("id");
		String pwd= request.getParameter("pwd");
		System.out.println(id);
		System.out.println(pwd);
		MainDao dao = new MainDao();
		int n = dao.login(id, pwd);
		if(n>0)
		{
			request.setAttribute("code", "success");
		}
		else
		{
			request.setAttribute("code", "fail");
		}
		request.getRequestDispatcher(")
	}
}
