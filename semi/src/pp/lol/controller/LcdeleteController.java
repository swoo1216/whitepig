package pp.lol.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.lol.dao.LcommentDao;
@WebServlet("/lol/lcdelete.do")
public class LcdeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cnum=Integer.parseInt(req.getParameter("cnum"));
		
		LcommentDao dao=LcommentDao.getInstance();
		dao.delete(cnum);
		
		req.getRequestDispatcher("/lol/ldetail.do").forward(req, resp);
	}
}
