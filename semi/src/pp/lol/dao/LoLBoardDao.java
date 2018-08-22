package pp.lol.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pp.lol.vo.LoLBoardVo;
import test.db.DBConnection;

public class LoLBoardDao
{
	//가장 큰 글번호 얻어오기
	public int getMaxNum()
	{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try
		{
			con= DBConnection.conn();
			String sql = "select NVL(max(bnum),0) maxnum from LoLboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				return rs.getInt("maxnum");
			}
			else
			{
				return 0;
			}
		}
		catch(SQLException se)
		{
			System.out.println(se.getMessage());
			return -1;
		}
		finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}
	
	//전체 글의 갯수 구하기
	public int getCount()
	{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try
		{
			con=DBConnection.conn();
			String sql = "select NVL(count(bnum),0) cnt from LoLBoard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				return rs.getInt("cnt");
			}
			else
			{
				return 0;
			}
		}
		catch(SQLException se)
		{
			System.out.println(se.getMessage());
			return -1;
		}
		finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}
	public int insert(LoLBoardVo vo)
	{
		Connection con = null;
		PreparedStatement pstmt= null;
		PreparedStatement pstmt1 = null;
		try
		{
			con = DBConnection.conn();
			int boardNum= getMaxNum() + 1; //추가될글번호
			String sql = "insert into LoLboard values(?,?,?,?,?,?,'hihi',TO_CHAR(SYSDATE, 'YYYY.MM.DD HH24:MI:SS'))";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4, vo.getReply());
			pstmt.setInt(5, vo.getRecomm());
			pstmt.setInt(6, vo.getHit());
			System.out.println(sql);
			int n = pstmt.executeUpdate();
			return n;
		}
		catch(SQLException se)
		{
			System.out.println(se.getMessage());
			return -1;
		}
		finally
		{
			DBConnection.close(null, pstmt1, con);
		}
	}
	public ArrayList<LoLBoardVo> list(int startRow,int endRow)
	{
		String sql = "SELECT * FROM " + "(  " + " SELECT AA.*,ROWNUM RNUM FROM " + "( "
				+ "	     SELECT * FROM LoLBOARD " + "ORDER BY BNUM DESC" + ")AA " + ")"
				+ " WHERE RNUM>=? AND RNUM<=?";
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try
		{
			con=DBConnection.conn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			ArrayList<LoLBoardVo> list = new ArrayList<>();
			while (rs.next())
			{
				int bnum = rs.getInt("bnum");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int reply= rs.getInt("reply");
				int hit = rs.getInt("hit");
				int recomm = rs.getInt("recomm");
				String regdate = rs.getString("regdate");
				String id = rs.getString("id");
				LoLBoardVo vo = new LoLBoardVo(bnum, title, content, reply, recomm, hit, id, regdate);
				list.add(vo);
			}
			return list;
		}
		catch(SQLException se)
		{
			System.out.println(se.getMessage());
			return null;
		}
		finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}
}