package pp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.admin.dao.AdminMainDao;
@WebServlet("/admin/salsevolume.do")
public class SalseVolumeController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminMainDao dao=AdminMainDao.getInstance();
		ArrayList<String> list=dao.salseVolume();
		System.out.println(list);		
		request.setAttribute("list", list);
		request.getRequestDispatcher("adminmain.jsp?page=salesvolume.jsp" ).forward(request, response);
	}
}
