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
import pp.go.dao.GuserDao;
import pp.go.vo.GameScoreVo;

@WebServlet("/go/getGamePoint.do")
public class GetGamePointController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String sgetPoint = request.getParameter("getPoint");
		int getPoint = 0;

		if (!sgetPoint.equals("") && sgetPoint != null) {
			getPoint = Integer.parseInt(sgetPoint);
		}
		GuserDao.getInstance().upPoint(id, getPoint);

		int point = GuserDao.getInstance().select(id).getPoint();
		GameScoreVo vo = new GameScoreVo(0, id, getPoint);
		GameScoreDao.getInstance().insert(vo);
		//request.getSession().setAttribute("point", point);

		ArrayList<GameScoreVo> list = GameScoreDao.getInstance().list();

		JSONArray arr = new JSONArray();
		for (GameScoreVo voo : list) {
			int vgameNum = voo.getGameNum();
			String vid = voo.getId();
			int vgetPoint = voo.getGetPoint();

			JSONObject gnum = new JSONObject();
			JSONObject gid = new JSONObject();
			JSONObject gpoint = new JSONObject();

			gnum.put("gameNum", vgameNum);
			gid.put("id", gid);
			gpoint.put("getPoint", vgetPoint);

			JSONArray users = new JSONArray();

			users.add(gnum);
			users.add(gid);
			users.add(gpoint);

			arr.add(users);
		}

		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println(arr.toString());
		pw.close();
	}
}
