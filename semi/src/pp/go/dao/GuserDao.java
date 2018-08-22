package pp.go.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import pp.go.db.DBConnection;
import pp.go.vo.GuserVo;

public class GuserDao {
	private static GuserDao instance = null;

	private GuserDao() {

	}

	public static GuserDao getInstance() {
		if (instance == null)
			instance = new GuserDao();
		return instance;
	}

	public boolean loginCheck(String id, String pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from guser where id = ? and pwd = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return true;
			}
		} catch (SQLException se) {
			System.out.println(se.getMessage());
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
		return false;
	}

	public int update(GuserVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update guser set point = ?, num = ? where id = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getPoint());
			pstmt.setInt(2, vo.getNum());
			pstmt.setString(3, vo.getId());

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	public int getPoint(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select point from guser where id = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getInt("point");
			}
			return 0;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}
}
