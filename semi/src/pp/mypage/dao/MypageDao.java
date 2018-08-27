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
	public int modifyInfo(String id,String email, String nic)
	{
		Connection con=null;
		PreparedStatement pstmt = null;
		try
		{
			con = DBConnection.conn();
			String sql = "update cuser set email=? , nic=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, nic);
			pstmt.setString(3, id);
			int n =pstmt.executeUpdate();
			if(n>0)
			{
				return n;
			}
			else
			{
				return -1;
			}
		}
		catch(SQLException se)
		{
			System.out.println(se.getMessage());
			return -1;
		}
		finally
		{
			DBConnection.close(null, pstmt, con);
		}
	}
	public int pwdChange(String id, String pwd)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "update cuser set pwd=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, id);
			int n = pstmt.executeUpdate();
			if(n>0)
			{
				return n;
			}
			else
			{
				return -1;
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
