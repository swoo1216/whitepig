package pp.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pp.mypage.dao.MypageDao;

@WebServlet("/mboardcount.do")
public class BoardCountController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id =(String)session.getAttribute("id");
		System.out.println(id);
		MypageDao dao = new MypageDao();
		int boardcount = dao.countBoard(id);
		int commentcount = dao.countComment(id);
		if (boardcount > 0)
		{
			session.setAttribute("boardcount", boardcount);
		}
		else
		{
			session.setAttribute("boardcount", 0);
		}
		if(commentcount > 0)
		{
			session.setAttribute("commentcount", commentcount);
		}
		else
		{
			session.setAttribute("commentcount", 0);
		}
		request.getRequestDispatcher("/main/mypage/mypage.jsp").forward(request, response);
	}
}
