package pp.lol.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.lol.dao.LboardDao;
import pp.lol.dao.LcommentDao;
import pp.lol.vo.LboardVo;
import pp.lol.vo.LcommentVo;
@WebServlet("/lol/ldetail.do")
public class LdetailController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//게시물 보기
		req.setCharacterEncoding("utf-8");
		int bnum=Integer.parseInt(req.getParameter("bnum"));
		LboardDao.getInstance().hitup(bnum);
		LboardVo vo=LboardDao.getInstance().select(bnum);
		ArrayList<LcommentVo> list=LcommentDao.getInstance().list(bnum);
		
		
		req.setAttribute("vo", vo);
		req.setAttribute("list", list);
		req.getRequestDispatcher("/poke/main.jsp?page=/lol/ldetail.jsp").forward(req, resp);
	}
}
