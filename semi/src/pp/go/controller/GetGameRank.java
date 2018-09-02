package pp.go.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import pp.go.dao.GameScoreDao;
import pp.go.vo.GameScoreVo;

@WebServlet("/go/GetGameRank.do")
public class GetGameRank extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<GameScoreVo> list = GameScoreDao.getInstance().list();
		JSONArray arr = new JSONArray();
		for (GameScoreVo voo : list) {
			int vgameNum = voo.getGameNum();
			String vid = voo.getId();
			int vgetPoint = voo.getGetPoint();

			JSONObject json = new JSONObject();
			json.put("gameNum", vgameNum);
			json.put("id", vid);
			json.put("getPoint", vgetPoint);

			arr.add(json);
		}
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println(arr.toString());
		pw.close();
	}
}
