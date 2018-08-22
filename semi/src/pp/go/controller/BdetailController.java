package pp.go.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.GboardDao;
import pp.go.dao.GcommentDao;
import pp.go.vo.GboardVo;
import pp.go.vo.GcommentVo;

@WebServlet("/go/gdetail.do")
public class BdetailController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String sbNum = request.getParameter("bNum");

		int bNum;
		GboardVo vo = null;
		if (sbNum != null && !sbNum.equals("")) {
			bNum = Integer.parseInt(sbNum);
			GboardDao.getInstance().hitUp(bNum);
			vo = GboardDao.getInstance().select(bNum);
			ArrayList<GcommentVo> list = GcommentDao.getInstance().list(bNum);
			request.setAttribute("vo", vo);
			request.setAttribute("gclist", list);
			request.getRequestDispatcher("/go/gdetail.jsp").forward(request, response);
		} else {
			response.sendRedirect("gboard.do");
		}
	}
}
