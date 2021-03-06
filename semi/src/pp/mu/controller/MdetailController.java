package pp.mu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.mu.dao.MboardDao;
import pp.mu.vo.MboardVo;
@WebServlet("/mu/mdetail.do")
public class MdetailController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MboardDao dao=MboardDao.getInstance();
		int bnum=Integer.parseInt(request.getParameter("bnum"));
		MboardVo vo=dao.muDetail(bnum);
		request.setAttribute("vo", vo);
		request.getRequestDispatcher("/poke/main.jsp?page=/mu/mudetail.jsp").forward(request, response);
	}
}
