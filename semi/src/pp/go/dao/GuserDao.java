package pp.go.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import pp.go.db.DBConnection;

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
			se.getStackTrace();
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
		return false;
	}
}
