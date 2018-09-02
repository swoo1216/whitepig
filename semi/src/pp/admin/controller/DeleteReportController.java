package pp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.admin.dao.ReportDao;

@WebServlet("/admin/DeleteReport.do")
public class DeleteReportController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reportNum = Integer.parseInt(request.getParameter("reportNum"));
		
		ReportDao.getInstance().delete(reportNum);
		
		
		response.sendRedirect("ListReport.do");
	
	}
}
