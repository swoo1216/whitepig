package pp.lol.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import pp.lol.dao.LoLBoardDao;
import pp.lol.vo.LoLBoardVo;

@WebServlet("/sw/insert.do")
public class InsertController extends HttpServlet

{
	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("utf-8");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String id=request.getParameter("id");
		System.out.println(id);
		int bnum=0;
		int hit=0;
		int recomm=0;
		int reply=0;
		LoLBoardVo vo = new LoLBoardVo(bnum, title, content, reply, recomm, hit, null, null);
		LoLBoardDao dao = new LoLBoardDao();
		int n = dao.insert(vo);
		if(n>0)
		{
			request.setAttribute("code", "success");
		}
		else
		{
			request.setAttribute("code", "fail");
		}
		request.getRequestDispatcher("/sw/result.jsp").forward(request, response);
	}
}
