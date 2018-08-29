package pp.lol.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.lol.dao.LboardDao;
import pp.lol.dao.LrecommDao;
import pp.lol.vo.LrecommVo;

@WebServlet("/lol/lrecomminsert.do")
public class LrecommInsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		int bnum=Integer.parseInt(req.getParameter("bnum"));
		
		LrecommVo vo = new LrecommVo(0, id, bnum);
		if(id!=null && !id.equals("")) {
			if(!LrecommDao.getInstance().isRecomm(vo)) {
				LrecommDao.getInstance().insert(vo);
				int recomm=LrecommDao.getInstance().getrecommCount(bnum);
				LboardDao.getInstance().recommUp(vo.getBnum(), recomm);
			}
		}
		req.setAttribute("isrecomm", "true");
		req.getRequestDispatcher("/lol/ldetail.do").forward(req, resp);
	}
}
