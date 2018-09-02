package pp.mu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import pp.mu.dao.McommentDao;
import pp.mu.vo.McommentVo;
@WebServlet("/mu/mcomminsert.do")
public class McommInsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String commid=request.getParameter("commid");	
		String mcomments=request.getParameter("mcomments");
		String commbnum= request.getParameter("commbnum");
		McommentDao dao=McommentDao.getInstance();
		int mcommResult=dao.mcommInsert(commid,commbnum,mcomments);
		JSONObject obj=new JSONObject();
		obj.put("mcommResult", mcommResult);
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=response.getWriter();
		pw.println(obj.toJSONString());
		pw.close();
	}
}
