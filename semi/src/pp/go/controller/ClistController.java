package pp.go.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.GcommentDao;
import pp.go.vo.GcommentVo;

@WebServlet("/go/gclist.do")
public class ClistController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// ¡÷ºÆ
		String sbNum = request.getParameter("bNum");
		request.setAttribute("list", GcommentDao.getInstance().list(Integer.parseInt(sbNum)));
		request.getRequestDispatcher("/go/gdetail.do").forward(request, response);
	}
}
