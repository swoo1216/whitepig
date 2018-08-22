package pp.go.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.GcommentDao;
import pp.go.vo.GcommentVo;

@WebServlet("/go/gcinsert.do")
public class CinsertController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String sbNum = request.getParameter("bNum");
		int bNum = 0;
		String content = "";
		String id = "";

		if (sbNum != null && !sbNum.equals("")) {
			bNum = Integer.parseInt(sbNum);
			content = request.getParameter("content").replace("\r\n", "<br>");
			id = request.getParameter("id");
		}

		int n = GcommentDao.getInstance().insert(new GcommentVo(0, content, 0, id, bNum, null));

		if (n > 0) {
			request.setAttribute("bNum", bNum);
			request.getRequestDispatcher("/go/gclist.do").forward(request, response);
		}

	}
}
