package pp.mu.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import pp.mu.vo.McommentVo;
import test.db.DBConnection;

public class McommentDao {
	private static McommentDao instance = new McommentDao();

	private McommentDao() {
	}

	public static McommentDao getInstance() {
		return instance;
	}
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBConnection.conn();
			String sql = "select NVL(max(cnum),0) maxnum from mcomment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt("maxnum");
			} else {
				return 0;
			}
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
	}
	public ArrayList<HashMap<String, String>> mcommList(int bnum1) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBConnection.conn();
			String sql = "select a.*,b.nic,b.num from mcomment a,cuser b where a.id=b.id and a.bnum=?";
			System.out.println("aaa :"+bnum1);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bnum1);
			rs = pstmt.executeQuery();
			ArrayList<HashMap<String, String>> list=new ArrayList<>();
			
			while (rs.next()) {
				HashMap<String, String> map=new HashMap<>();
				map.put("cnum", rs.getString("cnum"));
				map.put("content",rs.getString("content"));
				map.put("recomm",rs.getString("recomm"));
				map.put("id",rs.getString("id"));
				map.put("bnum",rs.getString("bnum"));
				map.put("regdate",rs.getString("regdate"));
				map.put("nic",rs.getString("nic"));
				map.put("num",rs.getString("num"));				
				list.add(map);
			}
			return list;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
	}
	public int mcommInsert(String commid,String commBnum,String mcomments) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBConnection.conn();
			String sql = "insert into mcomment values(?,?,0,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
			int commNum=getMaxNum()+1;
			pstmt.setInt(1, commNum);
			pstmt.setString(2, mcomments);
			pstmt.setString(3, commid);
			pstmt.setString(4, commBnum);
			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, con);
		}
	}
}
