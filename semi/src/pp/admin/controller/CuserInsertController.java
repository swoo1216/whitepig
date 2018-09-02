package pp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.admin.dao.AdminMainDao;
import pp.admin.vo.AdminMainVo;

@WebServlet("/admin/userinsert.do")
public class CuserInsertController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String nic = request.getParameter("nic");
		AdminMainVo vo = new AdminMainVo(id, pwd, email, nic, null, 0, null, 0);
		AdminMainDao dao = AdminMainDao.getInstance();
		int n = dao.insertUser(vo);
		if (n > 0) {
			request.setAttribute("code", "success");
		} else {
			request.setAttribute("code", "fail");
		}
		request.getRequestDispatcher("/admin/adminmain.jsp?page=userlist.do").forward(request, response);
	}
}
