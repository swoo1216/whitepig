package pp.go.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import pp.go.dao.GboardDao;
import pp.go.dao.GcommentDao;
import pp.go.vo.GcommentVo;

@WebServlet("/go/gclist.do")
public class ClistController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 댓글 불러오기
		String sbNum = request.getParameter("bNum");
		String stNum = request.getParameter("tNum");

		if (sbNum == null) {
			sbNum = String.valueOf(request.getAttribute("bNum"));
			stNum = String.valueOf(request.getAttribute("tNum"));
		}

		int bNum = Integer.parseInt(sbNum);
		int tNum = Integer.parseInt(stNum);
		GcommentDao dao = GcommentDao.getInstance();
		ArrayList<GcommentVo> list = dao.list(bNum, tNum);

		JSONObject obj = new JSONObject();

		String bNic = GboardDao.getInstance().select(bNum).getNic();
		String hit = String.valueOf(GboardDao.getInstance().select(bNum).getHit());
		String bDate = new SimpleDateFormat("YYYY-MM-dd").format(GboardDao.getInstance().select(bNum).getRegdate());
		String countComment = String.valueOf(GcommentDao.getInstance().getCount(bNum, tNum));

		JSONObject board = new JSONObject();
		board.put("bNic", bNic);
		board.put("hit", hit);
		board.put("bDate", bDate);
		board.put("countComment", countComment);

		obj.put("board", board);

		JSONArray arr = new JSONArray();
		for (GcommentVo vo : list) {
			String cNum = String.valueOf(vo.getcNum());
			String content = vo.getContent().replace("<br>", "\r\n");
			String recomm = String.valueOf(vo.getRecomm());
			String rnic = vo.getNic();
			Date regdate = vo.getRegdate();
			String rdate = new SimpleDateFormat("YYYY-MM-dd").format(regdate);

			JSONObject json = new JSONObject();

			json.put("cNum", cNum);
			json.put("content", content);
			json.put("recomm", recomm);
			json.put("rnic", rnic);
			json.put("rdate", rdate);

			arr.add(json);
		}
		obj.put("recomm", arr);

		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(obj.toString());
		pw.close();
	}
}
