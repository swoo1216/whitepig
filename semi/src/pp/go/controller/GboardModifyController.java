package pp.go.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.GboardDao;
import pp.go.vo.GboardVo;

@WebServlet("/go/gboardmodify.do")
public class GboardModifyController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sbNum = request.getParameter("bNum");

		int bNum = 0;
		if (sbNum != null && !sbNum.equals("")) {
			bNum = Integer.parseInt(sbNum);

			GboardVo vo = GboardDao.getInstance().select(bNum);
			if (request.getSession().getAttribute("id").equals(vo.getId())) {
				if (vo != null) {
					request.setAttribute("vo", vo);
					request.getRequestDispatcher("/go/gmodify.jsp").forward(request, response);
				}

			} else
				response.sendRedirect("gboard.do");
		}
	}
}
