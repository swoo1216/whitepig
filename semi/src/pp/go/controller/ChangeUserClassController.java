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

@WebServlet("/go/ChangeUserClass.do")
public class ChangeUserClassController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String clss = request.getParameter("clss");
		int reportNum = Integer.parseInt(request.getParameter("reportNum"));

		GuserDao.getInstance().changeUserClass(id, clss);
		ReportVo vo = ReportDao.getInstance().select(reportNum);
		
		request.setAttribute("clss", GuserDao.getInstance().select(id).getClss());
		request.setAttribute("vo", vo);
		
		
		request.getRequestDispatcher("/admin/DetailReport.do?reportNum=" + reportNum).forward(request, response);
	}
}
