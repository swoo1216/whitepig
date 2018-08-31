package pp.mu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import pp.mu.dao.McommentDao;



public class McommListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String mcomments=request.getParameter("mcomments");		
		McommentDao dao=McommentDao.getInstance();
/*		int mcommResult=dao.mcommInsert(mcomments);
		System.out.println(mcomments);
		JSONObject obj=new JSONObject();
		obj.put("mcommResult", mcommResult);
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=response.getWriter();
		pw.println(obj.toJSONString());
		pw.close();*/
	}
}
