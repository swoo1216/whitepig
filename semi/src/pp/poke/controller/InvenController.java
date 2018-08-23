package pp.poke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pp.go.dao.GuserDao;
import pp.go.vo.GuserVo;
import pp.poke.dao.IconDao;
import pp.poke.dao.InvenDao;
import pp.poke.vo.IconVo;
import pp.poke.vo.InvenVo;
@WebServlet("/poke/checkOut.do")
public class InvenController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num=Integer.parseInt(req.getParameter("num"));
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		
		
		IconDao dao2=IconDao.getInstance();
		IconVo iv=dao2.select(num);
		
		String name=iv.getName();
		int price=iv.getPrice();
		String type=iv.getType();
		String tier=iv.getTier();
		
		GuserDao dao1=GuserDao.getInstance();
	
		GuserVo vo1=dao1.select(id);
		
		String pwd=vo1.getPwd();
		
		String email=vo1.getEmail();
		String nic=vo1.getNic();
		String clss=vo1.getClss();
		int point=vo1.getPoint();
		
		if(point<price) {
			req.setAttribute("err", "fail");
			req.getRequestDispatcher("/poke/list.do").forward(req, resp);
		}else {
		
		int pay=point-price;
		
		GuserVo gv=new GuserVo(id, pwd, email, nic, clss, num, pay);
		
		dao1.update(gv);
		
		InvenVo vo=new InvenVo(0, id, num, name, type, tier, price, null);
		InvenDao dao=InvenDao.getInstance();
		dao.insert(vo);
		
		
		resp.sendRedirect("list.do");
		}
	}
}