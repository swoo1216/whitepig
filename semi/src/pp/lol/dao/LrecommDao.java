package pp.lol.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pp.go.db.DBConnection;
import pp.lol.vo.LrecommVo;

public class LrecommDao {
	private static LrecommDao instance = new LrecommDao();
	
	private LrecommDao() {}
	
	public static LrecommDao getInstance() {
		return instance;
	}
	
	public int getMaxNum() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select NVL(max(renum),0) max from lrecomm";
		
		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("max");
			}
			return 0;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}
	
	public int getCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select NVL(count(renum),0) cnt from lrecomm";
		
		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			return 0;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}
	
	public int insert(LrecommVo vo) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		String sql="insert into lrecomm values(?,?,?)";
		
		try {
			conn=DBConnection.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, getMaxNum() + 1);
			pstmt.setString(2, vo.getId());
			pstmt.setInt(3, vo.getBnum());
			
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(null, pstmt, conn);
		}
	}
	
	public boolean isRecomm(LrecommVo vo) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from lrecomm where id=? and bnum=?";
		
		try {
			conn=DBConnection.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setInt(2, vo.getBnum());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			return false;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return false;
		}finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}
	
	public int getrecommCount(int bnum) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql = "select NVL(count(renum),0) cnt from lrecomm where bnum=?";
		
		try {
			conn=DBConnection.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			return 0;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}
	
	public int delete(LrecommVo vo) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		String sql="delete from lrecomm where id=? and bnum=?";
		
		try {
			conn=DBConnection.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setInt(2, vo.getBnum());
			
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(null, pstmt, conn);
		}
	}
}













