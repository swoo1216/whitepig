package pp.lol.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.lol.dao.LcommentDao;
import pp.lol.vo.LcommentVo;
@WebServlet("/lol/lcinsert.do")
public class LcinsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		//´ñ±Û Ãß°¡
		int bnum=Integer.parseInt(req.getParameter("bnum"));
		String content = req.getParameter("content").replace("\r\n", "<br>");
		String id=req.getParameter("id");
		
		LcommentDao.getInstance().insert(new LcommentVo(0, content, id, null, bnum, null, 0));
		
		req.getRequestDispatcher("/lol/ldetail.do").forward(req, resp);
	}
}
