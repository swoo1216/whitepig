package pp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.admin.dao.AdminMainDao;
import pp.admin.vo.AdminMainVo;
@WebServlet("/admin/userlist.do")
public class CuserlistController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		AdminMainDao dao=AdminMainDao.getInstance();
		String spageNum=request.getParameter("pageNum");
		int pageNum=1;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		int startRow=(pageNum-1)*5+1;
		int endRow=startRow+4;
		ArrayList<AdminMainVo> adminlist=dao.adminlist(startRow, endRow);
		
		int pageCount=(int)Math.ceil(dao.getUserCount()/5.0);
		int startPage=((pageNum-1)/5*5)+1;
		int endPage=startPage+4;
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		System.out.println(adminlist);
		request.setAttribute("adminlist", adminlist);
		request.setAttribute("pageCount",pageCount);
		request.setAttribute("startPage",startPage);
		request.setAttribute("endPage",endPage);
		request.setAttribute("pageNum",pageNum);
		
		request.getRequestDispatcher("adminmain.jsp?page=cuserlist.jsp" ).forward(request, response);
	}
}
