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
		String boardcount = dao.countBoard(id);
		String replycount = dao.countReply(id);
		if(boardcount!=null)
		{
			session.setAttribute("boardcount", boardcount);
		}
		else
		{
			session.setAttribute("boardcount", 0);
		}
		if(replycount!=null)
		{
			session.setAttribute("replycount", replycount);
		}
		else
		{
			session.setAttribute("replycount", 0);
		}
		request.getRequestDispatcher("/main/mypage/mypage.jsp").forward(request, response);
	}
}
