package pp.mu.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pp.mu.vo.McommentVo;
import test.db.DBConnection;

/*public class McommentDao {
	private static McommentDao instance = new McommentDao();
	private McommentDao() {}
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
	public McommentVo mcommList(int mnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBConnection.conn();
			String sql = "select * from mcomment where mnum=?";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int cnum=rs.getInt("cnum");
				String content=rs.getString("content");
				int recomm=rs.getInt("recomm");
				String id=rs.getString("id");
				Date regdate=rs.getDate("regdate");
				McommentVo
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
	}*/
//}
