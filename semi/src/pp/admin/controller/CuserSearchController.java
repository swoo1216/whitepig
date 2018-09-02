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
@WebServlet("/admin/usersearch.do")
public class CuserSearchController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String sv=request.getParameter("searchvalue");
		String si=request.getParameter("searchinfo");
		AdminMainDao dao=AdminMainDao.getInstance();
		ArrayList<AdminMainVo> adminlist=dao.searchUser(sv, si);
		System.out.println(adminlist);
		request.setAttribute("adminlist", adminlist);
		request.getRequestDispatcher("adminmain.jsp?page=cuserlist.jsp" ).forward(request, response);
	}
}
