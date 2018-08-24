package pp.go.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pp.go.dao.GboardDao;
import pp.go.dao.GcommentDao;
import pp.go.dao.GrecommTableDao;
import pp.go.vo.GboardVo;
import pp.go.vo.GcommentVo;
import pp.go.vo.GrecommTableVo;

@WebServlet("/go/gdetail.do")
public class GboardDetailController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 게시물 보기
		request.setCharacterEncoding("UTF-8");
		String sbNum = request.getParameter("bNum");
		int tNum = Integer.parseInt(request.getParameter("tNum"));

		int bNum;
		GboardVo vo = null;
		if (sbNum != null && !sbNum.equals("")) {
			bNum = Integer.parseInt(sbNum);
			GboardDao.getInstance().hitUp(bNum);
			vo = GboardDao.getInstance().select(bNum);
			ArrayList<GcommentVo> list = GcommentDao.getInstance().list(bNum);

			String isrecomm = "";
			String id = (String) request.getSession().getAttribute("id");
			GrecommTableVo revo = new GrecommTableVo(0, id, bNum, tNum);
			if (GrecommTableDao.getInstance().isRecomm(revo)) {
				isrecomm = "true";
			} else {
				isrecomm = "false";
			}

			request.setAttribute("vo", vo);
			request.setAttribute("gclist", list);
			request.setAttribute("isrecomm", isrecomm);
			request.getRequestDispatcher("/go/gdetail.jsp").forward(request, response);
		} else {
			response.sendRedirect("gboard.do");
		}
	}
}
