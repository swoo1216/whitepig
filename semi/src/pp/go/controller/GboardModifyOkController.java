package pp.go.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.GboardDao;
import pp.go.vo.GboardVo;

@WebServlet("/go/gmodifyOk.do")
public class GboardModifyOkController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sbNum = request.getParameter("bNum");

		int bNum = 0;
		String id = "";
		String title = "";
		String content = "";

		if (sbNum != null && !sbNum.equals("")) {
			bNum = Integer.parseInt(sbNum);
			id = request.getParameter("id");
			title = request.getParameter("title");
			content = request.getParameter("content").replace("\r\n", "<br>");
		}

		int n = GboardDao.getInstance().update(new GboardVo(bNum, title, content, 0, 0, id, null, 0, 0, null));

		if (n > 0) {
			request.setAttribute("bNum", bNum);
			request.setAttribute("tNum", 0);
			request.getRequestDispatcher("/go/gdetail.do").forward(request, response);
		} else {
			response.sendRedirect("gboard.do");
		}

	}
}
