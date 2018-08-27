package pp.mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import test.db.DBConnection;


public class MypageDao
{
	public String countBoard(String id)
	{
		Connection con = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		try
		{
			con=DBConnection.conn();
			String sql= "select count(*) count from lolboard where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				String n = rs.getString("count");
				return n;
			}
			else
			{
				return null;
			}
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
	public String countReply(String id)
	{
		Connection con = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		try
		{
			con=DBConnection.conn();
			String sql= "select count(*) count from lolreply where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				String n = rs.getString("count");
				return n;
			}
			else
			{
				return null;
			}
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
	public int modifyInfo(String id)
	{
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "update cuser set email=? , nic=? where id=?";
			
		}
	}
}
