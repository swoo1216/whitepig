package pp.go.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import pp.go.dao.PantalkDao;

@WebServlet("/go/countPantalk.do")
public class CountPantalkController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int count = PantalkDao.getInstance().getCount(request.getParameter("receiver"));
		JSONObject obj = new JSONObject();
		obj.put("count", count);

		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println(obj.toString());
		pw.close();
	}
}
