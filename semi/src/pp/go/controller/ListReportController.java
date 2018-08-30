package pp.go.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.ReportDao;
import pp.go.vo.ReportVo;

@WebServlet("/go/ListReport.do")
public class ListReportController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<ReportVo> list = ReportDao.getInstance().list();

		request.setAttribute("list", list);
		request.getRequestDispatcher("/go/report.jsp").forward(request, response);

	}
}
