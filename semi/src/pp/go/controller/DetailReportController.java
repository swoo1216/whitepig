package pp.go.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.GuserDao;
import pp.go.dao.ReportDao;
import pp.go.vo.ReportVo;

@WebServlet("/go/DetailReport.do")
public class DetailReportController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int reportNum = Integer.parseInt(request.getParameter("reportNum"));

		ReportVo vo = ReportDao.getInstance().select(reportNum);

		request.setAttribute("vo", vo);
		request.setAttribute("clss", GuserDao.getInstance().select(vo.getSuspect()).getClss());
		request.getRequestDispatcher("/go/DetailReport.jsp").forward(request, response);
	}
}
