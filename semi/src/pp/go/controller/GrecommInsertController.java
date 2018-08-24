package pp.go.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import pp.go.dao.GboardDao;
import pp.go.dao.GrecommTableDao;
import pp.go.vo.GrecommTableVo;

@WebServlet("/go/grecommInsert.do")
public class GrecommInsertController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 추천등록
		String id = request.getParameter("id");
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		int tNum = Integer.parseInt(request.getParameter("tNum"));

		GrecommTableVo vo = new GrecommTableVo(0, id, bNum, tNum);
		if (id != null && !id.equals("")) { // 추천 등록
			if (!GrecommTableDao.getInstance().isRecomm(vo)) {
				GrecommTableDao.getInstance().insert(vo);
				int recomm = GrecommTableDao.getInstance().getretableCount(vo.getbNum(), vo.gettNum());
				GboardDao.getInstance().updateRecomm(vo.getbNum(), recomm);
			}
		}

		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter pw = response.getWriter();

		JSONObject obj = new JSONObject();
		GrecommTableDao.getInstance().getretableCount(bNum, tNum);
		obj.put("countRecommTable", GrecommTableDao.getInstance().getretableCount(bNum, tNum));
		pw.println(obj.toString());
		pw.close();
	}
}
