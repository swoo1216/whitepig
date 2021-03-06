package pp.main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.main.dao.MainDao;
import pp.main.vo.MainVo;

@WebServlet("/mjoin.do")
public class JoinController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		String nic=request.getParameter("nic");
		System.out.println(id);
		System.out.println(pwd);
		System.out.println(email);
		System.out.println(nic);
		MainVo vo = new MainVo(id, pwd, email, nic, null, 0, null, 0);
		MainDao dao = new MainDao();
		int n = dao.insert(vo);
		if(n>0)
		{
			request.setAttribute("code", "success");
		}
		else
		{
			request.setAttribute("code", "fail");
		}
		request.getRequestDispatcher("/poke/main.jsp").forward(request, response);
	}
}
