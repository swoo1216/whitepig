package pp.mu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import pp.mu.dao.MboardDao;
import pp.mu.vo.MboardVo;
@WebServlet("/mu/insert.do")
public class MinsertController extends HttpServlet {
//	@Override
//	protected void service(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
//		requset.setCharacterEncoding("utf-8");
//		String title=requset.getParameter("title");
//		String content=requset.getParameter("content");
//		String id=requset.getParameter("id");
//		MboardVo vo=new MboardVo(0, title, content, 0, 0, 0, id, null, null);
//		MboardDao dao=new MboardDao();
//		int result=dao.insert(vo);
//		if(result>0) {
//			response.sendRedirect("musiclist.do");
//		}	
//	}
}
