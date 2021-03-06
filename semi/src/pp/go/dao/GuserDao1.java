package pp.go.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import pp.go.vo.GuserVo;
import test.db.DBConnection;;

public class GuserDao1 {
	private static GuserDao1 instance = null;

	private GuserDao1() {

	}

	public static GuserDao1 getInstance() {
		if (instance == null)
			instance = new GuserDao1();
		return instance;
	}

	public boolean loginCheck(String id, String pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from cuser where id = ? and pwd = ?";

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

	public int changeIcon(String id, int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update cuser set num=? where id = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, id);

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	public int upPoint(String id, int getPoint) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update cuser set point = point + ? where id = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getPoint);
			pstmt.setString(2, id);

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	public int changeUserClass(String id, String clss) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update cuser set clss = ? where id = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, clss);
			pstmt.setString(2, id);

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	public int update(GuserVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update cuser set point = ?, num = ? where id = ?";

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

	public GuserVo select(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		GuserVo vo = null;

		String sql = "select * from cuser where id = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String pwd = rs.getString("pwd");
				String email = rs.getString("email");
				String nic = rs.getString("nic");
				String clss = rs.getString("clss");
				int num = rs.getInt("num");
				int point = rs.getInt("point");

				vo = new GuserVo(id, pwd, email, nic, clss, num, point);
			}
			return vo;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}

}
