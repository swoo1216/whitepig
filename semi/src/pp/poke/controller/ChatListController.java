package pp.poke.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.poke.dao.ChatDao;
import pp.poke.vo.ChatVo;
@WebServlet("/poke/chatList.do")
public class ChatListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
		String listType = req.getParameter("listType");
		if(listType ==null || listType.equals("")) {
			resp.getWriter().write("");
		}else if(listType.equals("today")) {
			resp.getWriter().write(getToday());
		}else if(listType.equals("ten")) {
			resp.getWriter().write(getTen());
		}else {
			try {
				Integer.parseInt(listType);
				resp.getWriter().write(getId(listType));
			}catch(Exception e){
				resp.getWriter().write("");
			}
		}
	}
	public String getToday() {
		StringBuffer result =new StringBuffer("");
		result.append("{\"result\":[");
		ChatDao dao = ChatDao.getInstance();
		ArrayList<ChatVo> list = dao.list(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		for(int i=0;i<list.size();i++) {
			result.append("[{\"value\": \"" + list.get(i).getId() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getNic() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getNum() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getContent() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getRegdate() + "\"}]");
			if(i != list.size() -1) result.append(",");
		}
		result.append("], \"last\":\"" + list.get(list.size() -1).getChatNum() + "\"}");
		return result.toString();
	}
	
	public String getTen() {
		StringBuffer result =new StringBuffer("");
		result.append("{\"result\":[");
		ChatDao dao = ChatDao.getInstance();
		ArrayList<ChatVo> list = dao.listByRecent(10);
		for(int i=0;i<list.size();i++) {
			result.append("[{\"value\": \"" + list.get(i).getId() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getNic() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getNum() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getContent() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getRegdate() + "\"}]");
			if(i != list.size() -1) result.append(",");
		}
		result.append("], \"last\":\"" + list.get(list.size() -1).getChatNum() + "\"}");
		return result.toString();
	}
	
	public String getId(String chatNum) {
		StringBuffer result =new StringBuffer("");
		result.append("{\"result\":[");
		ChatDao dao = ChatDao.getInstance();
		ArrayList<ChatVo> list = dao.listByRecent(chatNum);
		for(int i=0;i<list.size();i++) {
			result.append("[{\"value\": \"" + list.get(i).getId() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getNic() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getNum() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getContent() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getRegdate() + "\"}]");
			if(i != list.size() -1) result.append(",");
		}
		result.append("], \"last\":\"" + list.get(list.size() -1).getChatNum() + "\"}");
		return result.toString();
	}
}
