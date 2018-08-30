package pp.admin.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.admin.dao.AdminMainDao;
import pp.admin.vo.AdminMainVo;
@WebServlet("/admin/modifyuser.do")
public class ModifyUserController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("detailid");
		String pwd=request.getParameter("detailpwd");
		String email=request.getParameter("detailemail");
		String nic=request.getParameter("detailnic");
		String clss=request.getParameter("detailclss");
		int point=Integer.parseInt(request.getParameter("detailpoint"));
		Date regdate=Date.valueOf(request.getParameter("detailregdate"));
		int num=Integer.parseInt(request.getParameter("detailicon"));
		AdminMainVo vo=new AdminMainVo(id, pwd, email, nic, clss, point, regdate, num);
		AdminMainDao dao=AdminMainDao.getInstance();
		int result=dao.modifyUser(vo);
		response.sendRedirect("adminmain.jsp?page=userlist.do");
	}
}
