package pp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.admin.dao.ReportDao;
import pp.admin.vo.ReportVo;

@WebServlet("/admin/ListReport.do")
public class ListReportController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<ReportVo> list = ReportDao.getInstance().list();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/adminmain.jsp?page=report.jsp").forward(request, response);
	}
}
