package pp.go.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pp.go.db.DBConnection;
import pp.go.vo.GcommentVo;

//Å×ÀÌºíº° ´ñ±Û °¹¼ö
//´ñ±Û »ý¼º
//Å×ÀÌºíº° ´ñ±Ûµé

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

	// Å×ÀÌºíº° ´ñ±Û °¹¼ö
	public int getCount(int bNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select NVL(count(cnum), 0) cnt from Gcomment where bNum = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNum);
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

	// ´ñ±Û »ý¼º
	public int insert(GcommentVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into gcomment values(?, ?, 0, ?, ?, sysdate)";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getMaxNum() + 1);
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getId());
			pstmt.setInt(4, vo.getbNum());

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	// Å×ÀÌºíº° ´ñ±Ûµé
	public ArrayList<GcommentVo> list(int bNum) {
		ArrayList<GcommentVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select gc.*, gu.nic nic from gcomment gc join guser gu on gc.id=gu.id  where bNum = ? order by cnum asc";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int cNum = rs.getInt("cNum");
				String content = rs.getString("content");
				int recomm = rs.getInt("recomm");
				String id = rs.getString("id");
				String nic = rs.getString("nic");
				Date regdate = rs.getDate("regdate");

				list.add(new GcommentVo(cNum, content, recomm, id, nic, bNum, regdate));
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
