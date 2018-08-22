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

		// ¡÷ºÆ
		String sbNum = request.getParameter("bNum");
		ArrayList<GcommentVo> list = GcommentDao.getInstance().list(Integer.parseInt(sbNum));
		int i = 0;
		JSONObject obj = new JSONObject();
		for (GcommentVo vo : list) {
			int cNum = vo.getcNum();
			String content = vo.getContent();
			int recomm = vo.getRecomm();
			String id = vo.getId();
			String nic = vo.getNic();
			int bNum = vo.getbNum();
			int countComment = GcommentDao.getInstance().getCount(bNum);
			int hit = GboardDao.getInstance().select(bNum).getHit();
			Date regdate = GboardDao.getInstance().select(bNum).getRegdate();
			
			String date = new SimpleDateFormat("YYYY-MM-dd").format(regdate);
			
			JSONObject json = new JSONObject();
			JSONArray arr = new JSONArray();
			
			json.put("cNum", cNum);
			json.put("content", content);
			json.put("recomm", recomm);
			json.put("id", id);
			json.put("nic", nic);
			json.put("bNum", bNum);
			json.put("countComment", countComment);
			json.put("hit", hit);
			json.put("date", date);
			
			
			obj.put(i++, json);
		}
		
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(obj.toString());
		pw.close();
	}
}
