package pp.go.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import pp.go.dao.GcommentDao;
import pp.go.vo.GcommentVo;

@WebServlet("/go/gclist.do")
public class ClistController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// ¡÷ºÆ
		String sbNum = request.getParameter("bNum");
		ArrayList<GcommentVo> list = GcommentDao.getInstance().list(Integer.parseInt(sbNum));

		int i = 0;
		JSONObject obj = new JSONObject();
		for (GcommentVo vo : list) {
			JSONArray arr = new JSONArray();
			int cNum = vo.getcNum();
			String content = vo.getContent();
			int recomm = vo.getRecomm();
			String id = vo.getId();
			int bNum = vo.getbNum();
			Date regdate = vo.getRegdate();
			
			arr.add(cNum);
			arr.add(content);
			arr.add(recomm);
			arr.add(id);
			arr.add(bNum);
			arr.add(regdate);
			obj.put(i++ + "", arr);
		}
		
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(obj.toString());
		pw.close();
	}
}
