package pp.main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.main.dao.MainDao;
@WebServlet("/mfindid.do")
public class FindidController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("utf-8");
		String email=request.getParameter("email");
		System.out.println(email);
		MainDao dao = new MainDao();
		String id = dao.findid(email);
		if(id!=null)
		{
			request.setAttribute("code", "esuccess");
			request.setAttribute("id", id);
		}
		else
		{
			request.setAttribute("code", "efail");
		}
		request.getRequestDispatcher("/main.jsp").forward(request, response);
	}
}
