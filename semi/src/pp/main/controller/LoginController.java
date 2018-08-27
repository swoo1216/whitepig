package pp.main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String nic = dao.login(id, pwd);
		int point = dao.point(nic);
		if(nic!=null)
		{
			request.setAttribute("code", "success1");
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("nic", nic);
			session.setAttribute("point", point);
		}
		else
		{
			request.setAttribute("code", "fail1");
		}
		request.getRequestDispatcher("/main.jsp").forward(request, response);
	}
}
