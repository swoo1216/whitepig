package pp.go.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pp.go.db.DBConnection;
import pp.go.vo.GameScoreVo;

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
			pstmt.setString(2, vo.getId());
			pstmt.setInt(3, vo.getGetPoint());

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	public ArrayList<GameScoreVo> list() {
		ArrayList<GameScoreVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from (select aa.*, rownum rnum from (select * from gamescore order by getPoint)aa ) where rnum>=1 and rnum <=10";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int gameNum = rs.getInt("gameNum");
				String id = rs.getString("id");
				int getPoint = rs.getInt("getPoint");

				list.add(new GameScoreVo(gameNum, id, getPoint));
			}
			return list;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}
}