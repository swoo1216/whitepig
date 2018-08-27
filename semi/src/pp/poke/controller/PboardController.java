package pp.poke.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.poke.dao.PboardDao;
import pp.poke.vo.PboardVo;
@WebServlet("/poke/pboard.do")
public class PboardController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String sort=req.getParameter("sort");
		String search=req.getParameter("search");
		String keyword=req.getParameter("keyword");
		
		if(keyword==null || keyword.equals("")) {
			keyword="";
			search="";
		}
		
		if(sort==null || sort.equals("")) sort="";
		
		String spageNum=req.getParameter("pageNum");
		int pageNum=1;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		int startRow=(pageNum-1)*15+1;
		int endRow=startRow+14;
		
		PboardDao dao=PboardDao.getInstance();
		ArrayList<PboardVo> list=dao.list(startRow, endRow, sort, search, keyword);
		int pageCount=(int)Math.ceil(dao.getCount(search, keyword)/15.0);
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
		req.getRequestDispatcher("/poke/pboard.jsp").forward(req, resp);
	}
}










