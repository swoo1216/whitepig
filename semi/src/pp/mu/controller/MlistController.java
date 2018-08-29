package pp.mu.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import pp.mu.dao.MboardDao;
import pp.mu.vo.MboardVo;
@WebServlet("/mu/musiclist.do")
public class MlistController extends HttpServlet{
//	@Override
/*	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		request.setCharacterEncoding("utf-8");
		MboardDao dao=new MboardDao();
		String spagenum=request.getParameter("pagenum");
		int pagenum=1;
		if(spagenum!=null) {
			pagenum=Integer.parseInt(spagenum);
		}
		int srow=(pagenum-1)*5+1;
		int erow=srow+4;
		ArrayList<MboardVo> list=dao.list(srow, erow);
		
		int pagecount=(int)Math.ceil(dao.getCount()/5.0);
		int startpage=((pagenum-1)/5*5)+1;
		int endpage=startpage+4;
		if(endpage>pagecount) {
			endpage=pagecount;
		}
		System.out.println(list);
		request.setAttribute("list", list);
		request.setAttribute("pagecount",pagecount);
		request.setAttribute("startpage",startpage);
		request.setAttribute("endpage",endpage);
		request.setAttribute("pagenum",pagenum);
		request.getRequestDispatcher("/main.jsp").forward(request, response);
	}*/	
}
