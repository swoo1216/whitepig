package pp.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pp.mypage.dao.MypageDao;

@WebServlet("/mmodify.do")
public class ModifyinfoController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String id=request.getParameter("id");
		String email=request.getParameter("email");
		String nic = request.getParameter("nic");
		System.out.println(email);
		System.out.println(nic);
		HttpSession session = request.getSession();
		session.setAttribute("nic", nic);
		MypageDao dao = new MypageDao();
		int n = dao.modifyInfo(id,email, nic);
		System.out.println(n);
		if(n>0)
		{
			request.getRequestDispatcher("/mboardcount.do").forward(request, response);
		}
	}
}
