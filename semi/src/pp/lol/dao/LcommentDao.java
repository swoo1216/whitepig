package pp.lol.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pp.go.db.DBConnection;
import pp.lol.vo.LcommentVo;


public class LcommentDao {
	private static LcommentDao instance=new LcommentDao();
	
	private LcommentDao() {
		
	}
	
	public static LcommentDao getInstance() {
		return instance;
	}
	
	public int getMaxNum() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql = "select NVL(max(cnum),0) max from lcomment";
		
		try {
			conn = DBConnection.conn();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				return rs.getInt("max");
			}
			return -1;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}
	
	public int getCount(int bnum) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select NVL(count(cnum),0) cnt from lcomment where bnum=?";
		
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
	
	public int insert(LcommentVo vo) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		String sql="insert into lcomment values(?,?,?,?,sysdate)";
		
		try {
			conn=DBConnection.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, getMaxNum() + 1);
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getId());
			pstmt.setInt(4, vo.getBnum());
			
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(null, pstmt, conn);
		}
	}
	
	public ArrayList<LcommentVo> list(int bnum){
		ArrayList<LcommentVo> list = new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select lc.*,cu.nic,cu.num from lcomment lc join cuser cu on lc.id=cu.id where bnum=? order by cnum";
		
		try {
			conn=DBConnection.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int cnum=rs.getInt("cnum");
				String content=rs.getString("content");
				String id=rs.getString("id");
				String nic=rs.getString("nic");
				String regdate=rs.getString("regdate");
				String rdate=regdate.split("\\.")[0];
				int num=rs.getInt("num");
				
				list.add(new LcommentVo(cnum, content, id, nic, bnum, rdate, num));	
			}
			return list;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}
	
	public int delete(int cnum) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		String sql="delete from lcomment where cnum=?";
		
		try {
			conn=DBConnection.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cnum);
			
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(null, pstmt, conn);
		}
	}
	
	
}











