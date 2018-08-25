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

//id�� ��ġ�ϸ� ���� �ƴ� ���� �޽��� ��ȯ
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

		// ���̵� ������ �����.
		if (id.equals(dao.select(cNum).getId())) {
			dao.removeComment(cNum); // ��� ����

			request.setAttribute("bNum", bNum);
			request.setAttribute("tNum", tNum);
			request.getRequestDispatcher("/go/gclist.do").forward(request, response);
		} else { // ���̵� ���� ������ ���и� ����
			JSONObject obj = new JSONObject();
			obj.put("result", "fail");

			response.setContentType("text/plain; charset=UTF-8");
			PrintWriter pw = response.getWriter();
			pw.println(obj.toString());
			pw.close();
		}

	}
}
