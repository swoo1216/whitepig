package pp.go.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.GboardDao;
import pp.go.vo.GboardVo;

@WebServlet("/go/gboarddelete.do")
public class GboardDeleteController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sbNum = request.getParameter("bNum");
		String id = (String) request.getSession().getAttribute("id");

		int bNum = -1;
		if (sbNum != null && !sbNum.equals("")) {
			bNum = Integer.parseInt(sbNum);
			GboardVo vo = GboardDao.getInstance().select(bNum);
			if (vo != null) {
				if (vo.getId().equals(id)) {
					GboardDao.getInstance().delete(bNum);
				}
			}
		}
		
		response.sendRedirect("gboard.do");
	}
}
