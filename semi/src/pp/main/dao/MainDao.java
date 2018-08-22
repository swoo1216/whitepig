package pp.main.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
			test.db.DBConnection.close(null, pstmt, con);
		}
	}
}
