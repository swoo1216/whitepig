package pp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pp.main.vo.MainVo;
import pp.mypage.dao.MypageDao;
import pp.mypage.vo.MypageVo;

@WebServlet("/mlist.do")
public class BoardListController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String id = (String)request.getSession().getAttribute("id");
		String spageNum=request.getParameter("pagenum");
		int pageNum=1;
		if(spageNum!=null)
		{
			pageNum=Integer.parseInt(spageNum);
		}
		int startRow=(pageNum-1)* 5+1;
		int endRow=startRow +4;
		MypageDao dao = new MypageDao();
		ArrayList<MypageVo> list1=dao.list1(startRow, endRow,id);
		ArrayList<MypageVo> list2=dao.list2(startRow, endRow,id);
		ArrayList<MypageVo> list3=dao.list3(startRow, endRow,id);
		ArrayList<MypageVo> list4=dao.list4(startRow, endRow,id);
		int pageCount1=(int)Math.ceil(dao.getCount1()/10.0);
		int pageCount2=(int)Math.ceil(dao.getCount2()/10.0);
		int pageCount3=(int)Math.ceil(dao.getCount3()/10.0);
		int pageCount4=(int)Math.ceil(dao.getCount4()/10.0);
		int startPage=((pageNum-1/4*4)+1);
		int endPage=startPage+3;
		if(endPage>pageCount1)
		{
			endPage=pageCount1;
		}
		else if(endPage>pageCount2)
		{
			endPage=pageCount2;
		}
		else if(endPage>pageCount3)
		{
			endPage=pageCount3;
		}
		else if(endPage>pageCount4)
		{
			endPage=pageCount4;
		}
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("list4", list4);
		request.setAttribute("pageCount1", pageCount1);
		request.setAttribute("pageCount2", pageCount2);
		request.setAttribute("pageCount3", pageCount3);
		request.setAttribute("pageCount4", pageCount4);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageNum", pageNum);
		request.getRequestDispatcher("/poke/main.jsp?page=/main/mypage/boardList.jsp").forward(request, response);
	}
}
