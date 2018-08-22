package pp.main.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pp.main.vo.MainVo;
import test.db.DBConnection;

public class MainDao
{
	public int insert(MainVo vo)
	{
		Connection con=null;
		PreparedStatement pstmt=null;
		try
		{
			con = DBConnection.conn();
			String sql = "insert into cuser values(?,?,?,?,'user',0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getNic());
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
			DBConnection.close(null, pstmt, con);
		}
	}
	public int login(String id, String pwd)
	{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try
		{
			con=DBConnection.conn();
			String sql = "select * from cuser where id=? and pwd=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
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
			DBConnection.close(rs, pstmt, con);
		}
	}
	public String findid(String email)
	{
		Connection con=null;
		PreparedStatement	pstmt=null;
		ResultSet rs= null;
		try
		{
			con=DBConnection.conn();
			String sql=" select id from cuser where email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			System.out.println(sql);
			rs =pstmt.executeQuery();
			if(rs.next())
			{
				String id=rs.getString("id");
				return id;
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
	public String findpwd(String id,String email)
	{
		Connection con=null;
		PreparedStatement	pstmt=null;
		ResultSet rs= null;
		try
		{
			con=DBConnection.conn();
			String sql=" select pwd from cuser where id=? and email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			System.out.println(sql);
			rs =pstmt.executeQuery();
			if(rs.next())
			{
				String pwd=rs.getString("pwd");
				return pwd;
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
}
