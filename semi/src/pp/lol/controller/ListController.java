package pp.lol.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.lol.dao.LoLBoardDao;
import pp.lol.vo.LoLBoardVo;

@WebServlet("/SW/list.do")
public class ListController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String spageNum=request.getParameter("pageNum");
		int pageNum=1;
		if(spageNum!=null)
		{
			pageNum=Integer.parseInt(spageNum);
		}
		int startRow=(pageNum-1)*5+1;
		int endRow=startRow+4;
		LoLBoardDao dao=new LoLBoardDao();
		ArrayList<LoLBoardVo> list=dao.list(startRow,endRow);
		//전체패이지갯수구하기
		int pageCount=(int)Math.ceil(dao.getCount()/5.0);
		//시작페이지번호
		int startPage=((pageNum-1)/4*4)+1;
		//끝페이지번호
		int endPage=startPage+3;
		if(endPage>pageCount)
		{
			endPage=pageCount;
		}
		request.setAttribute("list", list);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageNum", pageNum);
		request.getRequestDispatcher("/SW/index.jsp").forward(request, response);
	}
}
