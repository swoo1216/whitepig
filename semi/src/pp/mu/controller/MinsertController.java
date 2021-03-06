package pp.mu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.mu.dao.MboardDao;
import pp.mu.vo.MboardVo;
@WebServlet("/mu/minsert.do")
public class MinsertController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String id=request.getParameter("id");
		MboardVo vo=new MboardVo(0, title, content, 0, 0, id, null, null);
		MboardDao dao=MboardDao.getInstance();
		int result=dao.muInsert(vo);
		if(result>0) {
			request.getRequestDispatcher("mlist.do").forward(request, response);
		}	
	}
}
