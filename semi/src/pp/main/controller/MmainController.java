package pp.main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pp.go.dao.GboardDao;
import pp.go.dao.GuserDao;
import pp.go.vo.GboardVo;
import pp.go.vo.GuserVo;
import pp.lol.dao.LboardDao;
import pp.lol.vo.LboardVo;
import pp.mu.dao.MboardDao;
import pp.mu.vo.MboardVo;
import pp.poke.dao.PboardDao;
import pp.poke.vo.PboardVo;
@WebServlet("/mmmain.do")
public class MmainController extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		ArrayList<GboardVo> glist = GboardDao.getInstance().gmainList();
		ArrayList<PboardVo> plist = PboardDao.getInstance().pmainList();
		ArrayList<LboardVo> llist = LboardDao.getInstance().lmainList();
		ArrayList<MboardVo> mlist = MboardDao.getInstance().mmainList();
		request.setAttribute("glist", glist);
		request.setAttribute("plist", plist);
		request.setAttribute("llist", llist);
		request.setAttribute("mlist", mlist);
		
		request.getRequestDispatcher("/main/mmain.jsp").forward(request, response);
	}
}
