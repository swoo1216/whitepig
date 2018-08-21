package pp.go.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.GboardDao;
import pp.go.vo.GboardVo;

@WebServlet("/go/gboard.do")
public class ListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<GboardVo> list = GboardDao.getInstance().list();

		request.setAttribute("list", list);
		request.getRequestDispatcher("/go/gboard.jsp").forward(request, response);;
	}
}
