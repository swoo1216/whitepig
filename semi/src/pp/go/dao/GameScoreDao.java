package pp.go.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pp.go.db.DBConnection;

public class GameScoreDao {
	private static GameScoreDao instance = null;

	private GameScoreDao() {
	}

	public static GameScoreDao getInstance() {
		if (instance == null)
			instance = new GameScoreDao();

		return instance;
	}

	public int getMaxNum() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select NVL(max(gameNum), 0) max from gamescore";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getInt("max");
			}
			return 0;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}

	public int insert(GameScoreVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into gamescore values(?, ?, ?)";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getMaxNum() + 1);
			pstmt.setString(2, id);
		} catch (SQLException se) {
			System.out.println(se.getMessage());
		} finally {
			DBConnection.close(null, pstmt, conn);
		}

		private int gameNum;
		private String id;
		private int getPoint;
	}
}