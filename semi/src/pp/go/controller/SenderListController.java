package pp.go.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import pp.go.dao.GboardDao;
import pp.go.dao.GcommentDao;
import pp.go.dao.GuserDao;
import pp.go.dao.PantalkDao;
import pp.go.vo.GuserVo;
import pp.go.vo.PantalkVo;

@WebServlet("/go/SenderList.do")
public class SenderListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String receiverId = request.getParameter("receiver");
		//String receiverNic = GuserDao.getInstance().select(receiverId).getNic();
		PantalkDao pdao = PantalkDao.getInstance();
		ArrayList<GuserVo> senderList = pdao.getSenderList(receiverId);
		int count = pdao.getCount(receiverId); // 전체 갯수

		// 보낸 유저로 받와서 닉네임이랑 보낸 횟수 전송

		JSONArray arr = new JSONArray();
		for (GuserVo gvo : senderList) {
			String senderId = gvo.getId();
			String senderNic = gvo.getNic(); // 보낸사람 닉네임이랑
			int senderCount = pdao.getSenderCount(senderId, receiverId); // 보낸 쪽지 갯수

			JSONObject sendObj = new JSONObject();
			sendObj.put("senderId", senderId);
			sendObj.put("senderNic", senderNic);
			sendObj.put("senderCount", senderCount);

			ArrayList<PantalkVo> list = pdao.list(senderId, receiverId);

			JSONArray talkList = new JSONArray();
			for (PantalkVo vo : list) {
				int panNum = vo.getPanNum();
				String _sender = vo.getSender();
				String _receiver = vo.getReceiver();
				String content = vo.getContent();
				String sendDate = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss").format(vo.getSendDate());
				int sendOk = vo.getSendOk();

				JSONObject info = new JSONObject();

				info.put("panNum", panNum);
				info.put("sender", _sender);
				info.put("senderNic", GuserDao.getInstance().select(_sender).getNic());
				info.put("receiver", _receiver);
				info.put("receiverNic", GuserDao.getInstance().select(_receiver).getNic());
				info.put("content", content);
				info.put("sendDate", sendDate);
				info.put("sendOk", sendOk);

				talkList.add(info);
				sendObj.put("talkList", talkList);
			}
			arr.add(sendObj);
		}
		JSONObject obj = new JSONObject();

		obj.put("count", count);
		obj.put("senderList", arr);

		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println(obj.toString());
		pw.close();

		// int panNum = rs.getInt("panNum");
		// String _sender = rs.getString("sender");
		// String _receiver = rs.getString("receiver");
		// String content = rs.getString("content");
		// Date sendDate = rs.getDate("sendDate");
		// int sendOk = rs.getInt("sendOk");
	}
}
