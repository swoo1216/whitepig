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
			String nic = vo.getNic();
			int bNum = vo.getbNum();
			Date regdate = vo.getRegdate();
			
			String date = new SimpleDateFormat("YYYY-MM-dd").format(regdate);
			
			JSONObject _cNum = new JSONObject();
			_cNum.put("cNum", cNum);
			arr.add(_cNum);
			
			JSONObject _content = new JSONObject();
			_content.put("content", content);
			arr.add(_content);
			
			JSONObject _recomm = new JSONObject();
			_recomm.put("recomm", recomm);
			arr.add(_recomm);
			
			JSONObject _id = new JSONObject();
			_id.put("id", id);
			arr.add(_id);
			
			JSONObject _nic = new JSONObject();
			_nic.put("nic", nic);
			arr.add(_nic);
			
			JSONObject _bNum = new JSONObject();
			_bNum.put("bNum", bNum);
			arr.add(_bNum);
			
			JSONObject _date = new JSONObject();
			_date.put("date", date);
			arr.add(_date);
			
			obj.put(i++, arr);
		}
		
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(obj.toString());
		pw.close();
	}
}
