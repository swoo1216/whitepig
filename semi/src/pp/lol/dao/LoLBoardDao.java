package pp.lol.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pp.go.db.DBConnection;

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
			String sql = "select NVL(max(num),0) maxnum from board";
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
			String sql = "select NVL(count(num),0) cnt from LoLBoard";
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
}
