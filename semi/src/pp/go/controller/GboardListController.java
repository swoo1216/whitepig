package pp.go.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.GboardDao;
import pp.go.dao.GcommentDao;
import pp.go.dao.GrecommTableDao;
import pp.go.vo.GboardVo;
import pp.go.vo.GcommentVo;

@WebServlet("/go/gboard.do")
public class GboardListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 게시물 리스트
		int page = 20;

		String spageNum = request.getParameter("pageNum");
		String sort = request.getParameter("sort");
		String search = request.getParameter("search");
		String scontent = request.getParameter("scontent");

		int pageNum = 1;
		if (spageNum != null) {
			pageNum = Integer.parseInt(spageNum);
		}
		int startRow = (pageNum - 1) * page + 1;
		int endRow = startRow + (page - 1);

		ArrayList<GboardVo> list = GboardDao.getInstance().list(startRow, endRow, sort, search, scontent);
		int pageCount = (int) Math.floor(Math.ceil(GboardDao.getInstance().getCount(search, scontent) / (double) page));
		int startPageNum = ((pageNum - 1) / page * page) + 1;

		int endPageNum = startPageNum + (page - 1);

		if (endPageNum > pageCount) {
			endPageNum = pageCount;
		}
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPageNum);
		request.setAttribute("endPage", endPageNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("list", list);
		request.setAttribute("sort", sort);
		request.setAttribute("search", search);
		request.setAttribute("scontent", scontent);
		request.getRequestDispatcher("/go/gboard.jsp").forward(request, response);
		;
	}
}
