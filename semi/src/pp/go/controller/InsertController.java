package pp.go.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.GboardDao;
import pp.go.vo.GboardVo;

public class InsertController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sbNum = request.getParameter("bNum");

		GboardVo vo = null;
		if (sbNum != null && !sbNum.equals("")) {
			int bNum = Integer.parseInt(sbNum);
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String id = request.getParameter("id");

			vo = new GboardVo(bNum, title, content, 0, 0, id, null);
		}
		int n = GboardDao.getInstance().insert(vo);

		if (n > 0) {
			response.sendRedirect("glist.do");
		} else {

		}

	}
}
