package pp.go.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class GameScoreDao {
	private static GameScoreDao instance = null;

	private GameScoreDao() {
	}

	public static GameScoreDao getInstance() {
		if (instance == null)
			instance = new GameScoreDao();

		return instance;
	}

	public int insert(GameScoreVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
	}
}