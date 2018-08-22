package pp.main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mlogout.do")
public class LogoutController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("utf-8");
		request.setAttribute("code", "logout");
		HttpSession session= request.getSession();
		session.invalidate();
		request.getRequestDispatcher("/main.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath() + "/main.jsp");
	}
}
