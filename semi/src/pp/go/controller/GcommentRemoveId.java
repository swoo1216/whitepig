package pp.go.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import pp.go.dao.GcommentDao;

//id가 일치하면 삭제 아님 에러 메시지 반환
@WebServlet("/go/GcommentRemoveId.do")
public class GcommentRemoveId extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		int cNum = Integer.parseInt(request.getParameter("cNum"));

		GcommentDao dao = GcommentDao.getInstance();
		int bNum = dao.select(cNum).getbNum();
		int tNum = dao.select(cNum).gettNum();

		// 아이디가 맞으면 지운다.
		if (id.equals(dao.select(cNum).getId())) {
			dao.removeComment(cNum); // 댓글 삭제

			request.setAttribute("bNum", bNum);
			request.setAttribute("tNum", tNum);
			request.getRequestDispatcher("/go/gclist.do").forward(request, response);
		} else { // 아이디가 맞지 않으면 실패를 리턴
			JSONObject obj = new JSONObject();
			obj.put("result", "fail");

			response.setContentType("text/plain; charset=UTF-8");
			PrintWriter pw = response.getWriter();
			pw.println(obj.toString());
			pw.close();
		}

	}
}
