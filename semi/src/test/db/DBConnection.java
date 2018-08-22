package test.db;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
	public static Connection conn() throws SQLException {
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
<<<<<<< HEAD
			String url = "jdbc:oracle:thin:@192.168.1.15:1521:xe";
=======
			String url = "jdbc:oracle:thin:@ 192.168.0.45:1521:xe";
>>>>>>> branch 'master' of https://github.com/swoo1216/whitepig.git
			con = DriverManager.getConnection(url, "scott", "tiger");
		} catch (ClassNotFoundException ce) {
			System.out.println(ce.getMessage());
		}
		return con;
	}


	public static void close(ResultSet rs, Statement pstmt, Connection con) {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
		}
	}


}
