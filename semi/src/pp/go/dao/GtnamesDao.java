package pp.go.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pp.go.db.DBConnection;

public class GtnamesDao {
	private static GtnamesDao instance = null;

	private GtnamesDao() {

	}

	public GtnamesDao getInstance() {
		if (instance == null)
			instance = new GtnamesDao();
		return instance;
	}

	// 테이블 이름 조회
	public String getTname(int tNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select tName from Gtnames where tNum = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString("tName");
			}
			return "";
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}
}
