package pp.go.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.PantalkDao;
import pp.go.vo.PantalkVo;

@WebServlet("/go/insertPantalk.do")
public class InsertPantalkController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String sender = request.getParameter("sender");
		String receiver = request.getParameter("receiver");
		String content = request.getParameter("content").replace("\r\n", "<br>");

		if (!receiver.equals("") && receiver != null) {
			PantalkVo vo = new PantalkVo(0, sender, receiver, content, null, 0);
			PantalkDao.getInstance().insert(vo);
		}

		// response.setContentType("text/plain; charset=UTF-8");
		// PrintWriter pw = response.getWriter();
		// pw.close();
	}
}
