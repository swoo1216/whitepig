package pp.mu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import pp.mu.dao.MboardDao;
@WebServlet("/mu/mdelete.do")
public class MdeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int bnum=Integer.parseInt(request.getParameter("bnum"));
		MboardDao dao=MboardDao.getInstance();
		int result=dao.muDelete(bnum);
		JSONObject obj=new JSONObject();
		obj.put("result", result);
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=response.getWriter();
		pw.println(obj.toString());
		pw.close();		
	}
}
