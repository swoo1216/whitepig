package pp.poke.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.poke.dao.PboardDao;
import pp.poke.dao.PcommentDao;
import pp.poke.vo.PboardVo;
import pp.poke.vo.PcommentVo;
@WebServlet("/poke/pdetail.do")
public class PdetailController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//게시물 보기
		req.setCharacterEncoding("utf-8");
		int bnum=Integer.parseInt(req.getParameter("bnum"));
		PboardDao.getInstance().hitup(bnum);
		PboardVo vo=PboardDao.getInstance().select(bnum);
		ArrayList<PcommentVo> list=PcommentDao.getInstance().list(bnum);
		
		
		req.setAttribute("vo", vo);
		req.setAttribute("list", list);
		req.getRequestDispatcher("/poke/main.jsp?page=/poke/pdetail.jsp").forward(req, resp);
	}
}
