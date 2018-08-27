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

@WebServlet("/go/GcommentPwdCheck.do")
public class GcommentPwdCheck extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String scNum = request.getParameter("cNum");
		String rPwd = request.getParameter("rpwd");

		int cNum = Integer.parseInt(scNum);
		String pwd = GcommentDao.getInstance().select(cNum).getPwd();
		if (rPwd.equals(pwd)) {
			int bNum = GcommentDao.getInstance().select(cNum).getbNum();
			int tNum = GcommentDao.getInstance().select(cNum).gettNum();
			GcommentDao.getInstance().removeComment(cNum);
			request.setAttribute("bNum", bNum);
			request.setAttribute("tNum", tNum);
			request.getRequestDispatcher("/go/gclist.do").forward(request, response);
		}

		JSONObject obj = new JSONObject();
		obj.put("result", "false");
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println(obj.toString());
		pw.close();
	}
}
