package pp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.main.vo.MainVo;
import pp.mypage.dao.MypageDao;
import pp.mypage.vo.MypageVo;

@WebServlet("/mlist.do")
public class BoardListController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String spageNum=request.getParameter("pagenum");
		int pageNum=1;
		if(spageNum!=null)
		{
			pageNum=Integer.parseInt(spageNum);
		}
		int startRow=(pageNum-1)* 5+1;
		int endRow=startRow +4;
		MypageDao dao = new MypageDao();
		ArrayList<MypageVo> list=dao.list(startRow, endRow);
		int pageCount=(int)Math.ceil(dao.getCount()/10.0);
		int startPage=((pageNum-1/4*4)+1);
		int endPage=startPage+3;
		if(endPage>pageCount)
		{
			endPage=pageCount;
		}
		request.setAttribute("list", list);
		System.out.println(list);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageNum", pageNum);
		request.getRequestDispatcher("/main/mypage/boardList.jsp").forward(request, response);
	}
}
