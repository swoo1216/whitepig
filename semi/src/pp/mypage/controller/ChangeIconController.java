package pp.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.GuserDao;

@WebServlet("/mchangeicon.do")
public class ChangeIconController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String id = request.getParameter("id");
		int num = Integer.parseInt(request.getParameter("num"));

		GuserDao.getInstance().changeIcon(id, num);
		
		
		request.getSession().setAttribute("num", num);

		request.getRequestDispatcher("/mboardcount.do").forward(request, response);

	}
}
