package pp.main.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import pp.main.dao.MainDao;

@WebServlet("/mcheck.do")

public class CheckController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String id = request.getParameter("id");
		String nic;

		boolean m = false;
		if (id == null)
		{
			nic = request.getParameter("nic");
			m = new MainDao().niccheck(nic);
		} else
		{
			int n = new MainDao().idcheck(id);

			if (n > 0)
			{
				System.out.println("아이디있음");
				
				
				response.setContentType("text/xml;charset=utf-8");
				PrintWriter pw = response.getWriter();
				pw.println("<?xml version='1.0' encoding = 'utf-8'?>");
				pw.println("<result>");
				pw.println("<using>" + n + "</using>");
				pw.println("</result>");
				pw.close();
			} else if (n == 0)
			{
				System.out.println("아이디없음");
				response.setContentType("text/xml;charset=utf-8");
				PrintWriter pw = response.getWriter();
				pw.println("<?xml version='1.0' encoding = 'utf-8'?>");
				pw.println("<result>");
				pw.println("<using>" + n + "</using>");
				pw.println("</result>");
				pw.close();

			}
		}
		System.out.println("sorsor");
		JSONObject data1 = new JSONObject();
		data1.put("nic", String.valueOf(m));
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter pw = response.getWriter();
		pw.println(data1.toString());
		pw.close();

		/*
		 * if(m==true) { response.setContentType("text/xml;charset=utf-8"); pw =
		 * response.getWriter(); pw.println("<?xml version='1.0' encoding = 'utf-8'?>");
		 * pw.println("<result>"); pw.println("<using1>" + m + "</using1>");
		 * pw.println("</result>"); pw.close(); } else if(m==false) {
		 * response.setContentType("text/xml;charset=utf-8"); pw = response.getWriter();
		 * pw.println("<?xml version='1.0' encoding = 'utf-8'?>");
		 * pw.println("<result>"); pw.println("<using1>" + m + "</using1>");
		 * pw.println("</result>"); pw.close(); }
		 */
	}
}
