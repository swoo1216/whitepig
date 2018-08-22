package pp.inven.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pp.inven.dao.InvenDao;
import pp.inven.vo.InvenVo;
@WebServlet("/icon/checkOut.do")
public class InvenController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num=Integer.parseInt(req.getParameter("num"));
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
//		
//		InvenVo vo=new InvenVo(inum, id, num, name, type, tier, price, regdate);
//		InvenDao dao=InvenDao.getInstance();
		
	}
}
