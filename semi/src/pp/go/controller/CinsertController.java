package pp.go.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.GcommentDao;
import pp.go.dao.GuserDao;
import pp.go.vo.GcommentVo;

@WebServlet("/go/gcinsert.do")
public class CinsertController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ´ñ±Û ´Þ±â
		String id = request.getParameter("id");

		String nic = null;
		String rPassword = null;

		if (id == null) {
			nic = request.getParameter("nic");
			rPassword = request.getParameter("rPassword");
		} else {
			nic = GuserDao.getInstance().select(id).getNic();
			GuserDao.getInstance().upPoint(id, 5);
		}

		int bNum = Integer.parseInt(request.getParameter("bNum"));
		int tNum = Integer.parseInt(request.getParameter("tNum"));
		String content = request.getParameter("content").replace("\r\n", "<br>");

		GcommentVo vo = new GcommentVo(0, bNum, tNum, content, 0, nic, rPassword, id, null);

		int n = GcommentDao.getInstance().insert(vo);
		request.setAttribute("bNum", bNum);
		request.setAttribute("tNum", tNum);
		request.getRequestDispatcher("/go/gclist.do").forward(request, response);
	}
}
