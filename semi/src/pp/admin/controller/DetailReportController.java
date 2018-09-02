package pp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import pp.go.dao.GuserDao;
import pp.admin.dao.ReportDao;
import pp.admin.vo.ReportVo;

@WebServlet("/admin/DetailReport.do")
public class DetailReportController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int reportNum = Integer.parseInt(request.getParameter("reportNum"));

		ReportVo vo = ReportDao.getInstance().select(reportNum);

		request.setAttribute("vo", vo);
//		request.setAttribute("clss", GuserDao.getInstance().select(vo.getSuspect()).getClss());
		request.getRequestDispatcher("/admin/adminmain.jsp?page=DetailReport.jsp").forward(request, response);
		
	}
}
