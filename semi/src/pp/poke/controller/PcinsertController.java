package pp.poke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.poke.dao.PcommentDao;
import pp.poke.vo.PcommentVo;
@WebServlet("/poke/pcinsert.do")
public class PcinsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		//´ñ±Û Ãß°¡
		int bnum=Integer.parseInt(req.getParameter("bnum"));
		String content = req.getParameter("content").replace("\r\n", "<br>");
		String id=req.getParameter("id");
		
		PcommentDao.getInstance().insert(new PcommentVo(0, content, 0, id, null, bnum, null, 0));
		
		req.getRequestDispatcher("/poke/pdetail.do").forward(req, resp);
	}
}
