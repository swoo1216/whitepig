package pp.go.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pp.go.db.DBConnection;
import pp.go.vo.GcommentVo;

public class GcommentDao {
	private static GcommentDao instance = null;

	private GcommentDao() {

	}

	public static GcommentDao getInstance() {
		if (instance == null)
			instance = new GcommentDao();
		return instance;
	}

	public int getMaxNum() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select NVL(max(cnum), 0) max from gcomment";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				return rs.getInt("max");
			}
			return 1;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}

	public int getCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select NVL(count(rnum), 0) cnt from Gcomment";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			return 0;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}

	public int insert(GcommentVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into gcomment values(?, ?, ?, ?, ?, sysdate)";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getMaxNum() + 1);
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getRecomm());
			pstmt.setString(4, vo.getId());
			pstmt.setInt(5, vo.getbNum());

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	public ArrayList<GcommentVo> list() {
		ArrayList<GcommentVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from gcomment order by cnum desc";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int rNum = rs.getInt("rNum");
				String content = rs.getString("content");
				int recomm = rs.getInt("recomm");
				String id = rs.getString("id");
				int bNum = rs.getInt("bNum");
				Date regdate = rs.getDate("regdate");

				list.add(new GcommentVo(rNum, content, recomm, id, bNum, regdate));
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
