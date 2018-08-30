package pp.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import pp.mypage.dao.MypageDao;

@WebServlet("/miconchange.do")
public class IconChangeController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		System.out.println("id"+id);
		MypageDao dao = new MypageDao();
		ArrayList<Integer> iconlist = dao.iconlist(id);
		
		JSONObject json=new JSONObject();
		json.put("iconlist",iconlist);
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=response.getWriter();
		pw.println(json.toString()); //json타입문자열로 응답하기
		pw.close();
	}
}
