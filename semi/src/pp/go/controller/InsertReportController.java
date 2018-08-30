package pp.go.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.ReportDao;
import pp.go.vo.ReportVo;

@WebServlet("/go/InsertReport.do")
public class InsertReportController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String reporter = request.getParameter("reporter");
		String suspect = request.getParameter("suspect");
		String rtype = request.getParameter("rtype");
		String content = request.getParameter("content").replace("\r\n", "<br>");

		ReportVo vo = new ReportVo(0, reporter, suspect, rtype, content, null);

		ReportDao.getInstance().insert(vo);

	}
}
