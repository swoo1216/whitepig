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
	
	public int getMaxNum() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select "
	}

	public int insert(GameScoreVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into gamescore values()";
		
		private int gameNum;
		private String id;
		private int getPoint;
	}
}