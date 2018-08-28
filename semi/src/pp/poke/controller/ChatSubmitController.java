package pp.poke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.poke.dao.ChatDao;
@WebServlet("/poke/chatInsert.do")
public class ChatSubmitController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/plain;charset=utf-8");
		String id = req.getParameter("id");
		String content = req.getParameter("content");
		if(id == null || id.equals("") || content == null || content.equals("")) {
			resp.getWriter().write("0");
		}else {
			resp.getWriter().write(ChatDao.getInstance().submit(id, content) + "");
		}
	}
}
