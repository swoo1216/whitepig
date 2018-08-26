package pp.go.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import pp.go.dao.GcommentDao;

//´ñ±Û id Ã¼Å©
@WebServlet("/go/gcommentIdCheck.do")
public class GcommentIdCheck extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String scNum = request.getParameter("cNum");
		int cNum = Integer.parseInt(scNum);

		String id = GcommentDao.getInstance().select(cNum).getId();

		String check = "";
		if (id == null)
			check = "noId";
		else
			check = "yesId";

		JSONObject obj = new JSONObject();
		obj.put("check", check);
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println(obj.toString());
		pw.close();
	}
}
