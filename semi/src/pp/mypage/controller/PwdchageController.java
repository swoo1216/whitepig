package pp.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.mypage.dao.MypageDao;

@WebServlet("/mpwdchange.do")
public class PwdchageController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String id = request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String pwd2=request.getParameter("pwd2");
		System.out.println(id);
		System.out.println(pwd);
		if(pwd.equals(pwd2))
		{
			MypageDao dao = new MypageDao();
			int n = dao.pwdChange(id, pwd);
			System.out.println(n);
			if(n>0)
			{
				request.setAttribute("code", "success");
			}
			else
			{
				request.setAttribute("code", "fail");
			}
		}
		else
		{
			request.setAttribute("code", "fail");
		}
		request.getRequestDispatcher("/main/mypage/mypage.jsp").forward(request, response);
	}
}
