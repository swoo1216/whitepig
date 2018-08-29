package pp.lol.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.lol.dao.LboardDao;
@WebServlet("/lol/ldelete.do")
public class LdeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bnum=Integer.parseInt(req.getParameter("bnum"));
		
		LboardDao.getInstance().delete(bnum);
		
		resp.sendRedirect("lboard.do");
	}
}
