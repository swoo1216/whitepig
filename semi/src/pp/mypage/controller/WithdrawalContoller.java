package pp.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pp.mypage.dao.MypageDao;

@WebServlet("/mwithdrawal.do")
public class WithdrawalContoller extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		MypageDao dao = new MypageDao();
		int n = dao.withDrawal(id);
		session.invalidate();	
		if(n>0)
		{
			request.setAttribute("code", "wsuccess");
		}
		else
		{
			request.setAttribute("code", "wfail");
		}
		request.getRequestDispatcher("/poke/main.jsp").forward(request, response);
	}
}
