package pp.go.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.GuserDao;

@WebServlet("/go/getGamePoint.do")
public class GetGamePointController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String sgetPoint = request.getParameter("getPoint");
		int getPoint = 0;

		if (!sgetPoint.equals("") && sgetPoint != null) {
			getPoint = Integer.parseInt(sgetPoint);
		}
		GuserDao.getInstance().upPoint(id, getPoint);

		int point = GuserDao.getInstance().select(id).getPoint();

		request.getSession().setAttribute("point", point);
	}
}
