package pp.go.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.GboardDao;
import pp.go.dao.GuserDao;
import pp.go.vo.GboardVo;

@WebServlet("/go/ginsert.do")
public class GboardInsertController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//게시물 추가
		request.setCharacterEncoding("UTF-8");
		GboardVo vo = null;
		String title = request.getParameter("title");
		String content = request.getParameter("content").replace("\r\n", "<br>");
		String id = request.getParameter("id");
		
		vo = new GboardVo(0, title, content, 0, 0, id, null, 0, 0, null);

		int n = GboardDao.getInstance().insert(vo);
		String point = getInitParameter("boardAddPoint");
		if (n > 0) {
			response.sendRedirect("gboard.do");
		} else {
			request.setAttribute("title", title);
			request.setAttribute("content", content);
			request.setAttribute("id", id);

			request.getRequestDispatcher("/go/ginsert.jsp").forward(request, response);
		}

	}
}
