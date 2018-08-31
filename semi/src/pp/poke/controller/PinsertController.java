package pp.poke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.GuserDao;
import pp.poke.dao.PboardDao;
import pp.poke.vo.PboardVo;
@WebServlet("/poke/pinsert.do")
public class PinsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//게시물 추가
		req.setCharacterEncoding("utf-8");
		String title = req.getParameter("title");
		String content = req.getParameter("content").replace("\r\n", "<br>");
		String id= req.getParameter("id");
		
		PboardVo vo= new PboardVo(0, title, content, 0, 0, id, null, 0, null, 0);
		int n=PboardDao.getInstance().insert(vo);
		if(n>0) {
			resp.sendRedirect("pboard.do");
			GuserDao.getInstance().upPoint(id, 10);
		}else {
			req.setAttribute("title", title);
			req.setAttribute("content", content);
			req.setAttribute("id", id);
			
			req.getRequestDispatcher("/poke/binsert.jsp").forward(req, resp);
		}
		
	}
}
