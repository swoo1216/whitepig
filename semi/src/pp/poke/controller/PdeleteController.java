package pp.poke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.poke.dao.PboardDao;
@WebServlet("/poke/pdelete.do")
public class PdeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bnum=Integer.parseInt(req.getParameter("bnum"));
		
		PboardDao.getInstance().delete(bnum);
		
		resp.sendRedirect("pboard.do");
	}
}
