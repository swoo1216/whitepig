package pp.poke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.poke.dao.PboardDao;
import pp.poke.dao.PrecommDao;
import pp.poke.vo.PrecommVo;
@WebServlet("/poke/precommdelete.do")
public class PrecommDeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		int bnum=Integer.parseInt(req.getParameter("bnum"));
		
		PrecommVo vo=new PrecommVo(0, id, bnum);
		if(id!=null && !id.equals("")) {
			if(PrecommDao.getInstance().isRecomm(vo)) {
				PrecommDao.getInstance().delete(vo);
				int recomm=PrecommDao.getInstance().getrecommCount(bnum);
				PboardDao.getInstance().recommUp(vo.getBnum(), recomm);
			}
		}
		req.setAttribute("isrecomm", "false");
		req.getRequestDispatcher("/poke/pdetail.do").forward(req, resp);
	}
}
