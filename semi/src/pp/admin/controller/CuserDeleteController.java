package pp.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import pp.admin.dao.AdminMainDao;
@WebServlet("/admin/userdelete.do")
public class CuserDeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		AdminMainDao dao=AdminMainDao.getInstance();
		int result=dao.cUserDelete(id);
		JSONObject obj=new JSONObject();
		obj.put("result", result);
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=response.getWriter();
		pw.println(obj.toString());
		pw.close();
	}
}
