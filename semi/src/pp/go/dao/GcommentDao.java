package pp.go.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pp.go.db.DBConnection;

public class GcommentDao {
	private static GcommentDao instance = null;

	private GcommentDao() {

	}

	public static GcommentDao getInstance() {
		if (instance == null)
			instance = new GcommentDao();
		return instance;
	}

	public int getCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select NVL(count(rnum), 0) cnt from Gcomment";
		
		try {
			
		}catch(SQLException se) {
			System.out.println(se.getMessage());
		}finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}

}
