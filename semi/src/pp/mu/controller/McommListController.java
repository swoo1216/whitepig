package pp.mu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import pp.mu.dao.MboardDao;
import pp.mu.dao.McommentDao;
import pp.mu.vo.McommentVo;
@WebServlet("/mu/mcommlist.do")
public class McommListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		McommentDao dao=McommentDao.getInstance();
		request.setCharacterEncoding("utf-8");
		int bnum=Integer.parseInt(request.getParameter("bnum"));
		ArrayList<HashMap<String, String>> list=dao.mcommList(bnum);
		JSONArray arr=new JSONArray();
		for(HashMap<String, String> map:list) {
			JSONObject obj=new JSONObject();
			obj.put("cnum", map.get("cnum"));
			obj.put("content", map.get("content"));
			obj.put("recomm", map.get("recomm"));
			obj.put("id", map.get("id"));
			obj.put("bnum",map.get("bnum"));			
			obj.put("regdate", map.get("regdate"));	
			obj.put("nic", map.get("nic"));
			obj.put("num", map.get("num"));
			arr.add(obj);
		}		
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=response.getWriter();
		pw.println(arr.toString());
		pw.close();
	}
}
