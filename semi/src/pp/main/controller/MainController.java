package pp.main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pp.main.dao.MainDao;

@WebServlet("/mmain.do")
public class MainController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("utf-8");
		String id= request.getParameter("id");
		String pwd= request.getParameter("pwd");
		MainDao dao = new MainDao();
		String nic = dao.login(id, pwd);
		int point = dao.point(nic);
		int num = dao.num(id);
		System.out.println(num);
		if(nic!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("nic", nic);
			session.setAttribute("point", point);
			session.setAttribute("num", num);
		}
		request.getRequestDispatcher("/main/main.jsp").forward(request, response);
	}
}
