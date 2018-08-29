package pp.poke.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.poke.dao.IconDao;
import pp.poke.vo.IconVo;
@WebServlet("/poke/list.do")
public class IconController extends HttpServlet{
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String search=req.getParameter("search");
		String keyword=req.getParameter("keyword");
		
		if(keyword==null || keyword.equals("")) {
			keyword="";
			search="";
		}
		
		String spageNum=req.getParameter("pageNum");
		int pageNum=1;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		int startRow=(pageNum-1)*20+1;
		int endRow=startRow+19;
		
		IconDao dao=IconDao.getInstance();
		ArrayList<IconVo> list=dao.listIcon(startRow, endRow,search,keyword);
		int pageCount=(int)Math.ceil(dao.getCount(search,keyword)/20.0);
		int startPage=((pageNum-1)/5*5)+1;
		int endPage=startPage+4;
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		req.setAttribute("list", list);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("search", search);
		req.setAttribute("keyword", keyword);
		req.getRequestDispatcher("/poke/main.jsp?page=/poke/iconStore.jsp&icon=icon").forward(req, resp);
	}
}








