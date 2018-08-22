package pp.icon.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


@WebServlet("/wishList.do")
public class WishListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cmd=req.getParameter("cmd");
		if(cmd!=null && cmd.equals("insert")) {
			insert(req,resp);
		}else if(cmd!=null && cmd.equals("delete")) {
			delete(req,resp);
		}
	}
		
	protected void insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String num=req.getParameter("num");
		
		ArrayList list = (ArrayList)req.getSession().getAttribute("wishList");
		
		if(list==null) {
			list = new ArrayList<>();
		}
		
		list.add(num);
		req.getSession().setAttribute("wishList", list);
		
		
		resp.sendRedirect("list.do");
		
	}
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String num=req.getParameter("num");
		
		ArrayList list = (ArrayList)req.getSession().getAttribute("wishList");
		list.remove(num);
		
		
		
		
		JSONObject obj=new JSONObject();
		JSONArray arr=new JSONArray();
		
		
		
		for(Object snum : list) {
			arr.add((String)snum);
		}
		obj.put("list", arr);
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.println(obj.toString());
		pw.close();
		
		//resp.sendRedirect("list.do");
		
		
		
	}
	
	
}






