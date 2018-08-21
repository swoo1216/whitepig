package pp.lol.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.lol.dao.LoLBoardDao;
<<<<<<< HEAD
import pp.lol.vo.LoLBoardVo;
=======
>>>>>>> refs/remotes/origin/master
@WebServlet("/list.do")
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
		//ArrayList<LoLBoardVo> list=dao.list(startRow,endRow);
	}
}
