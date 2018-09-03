package pp.main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.main.dao.MainDao;

@WebServlet("/mfindpwd.do")
public class FindpwdController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String email=request.getParameter("email");
		System.out.println(id);
		System.out.println(email);
		MainDao dao = new MainDao();
		String pwd=dao.findpwd(id,email);
		if(pwd!=null)
		{
			request.setAttribute("code", "psuccess");
			request.setAttribute("pwd", pwd);
		}
		else
		{
			request.setAttribute("code", "pfail");
		}
		request.getRequestDispatcher("/poke/main.jsp").forward(request, response);
	}
}
