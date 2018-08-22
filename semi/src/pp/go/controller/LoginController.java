package pp.go.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.GuserDao;

@WebServlet("/go/login.do")
public class LoginController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//로그인
		
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		boolean b = GuserDao.getInstance().loginCheck(id, pwd);
		if (b) {
			request.getSession().setAttribute("id", id);
			response.sendRedirect("index.jsp");
		} else {
			request.setAttribute("errMsg", "아이디 또는 비밀번호가 맞지 않아요");
			request.getRequestDispatcher("/go/index.jsp").forward(request, response);
		}

	}
}
