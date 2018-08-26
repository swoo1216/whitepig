package pp.poke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.poke.dao.PcommentDao;
@WebServlet("/poke/pcdelete.do")
public class PcdeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cnum=Integer.parseInt(req.getParameter("cnum"));
		
		PcommentDao dao=PcommentDao.getInstance();
		dao.delete(cnum);
		
		req.getRequestDispatcher("/poke/pdetail.do").forward(req, resp);
	}
}
