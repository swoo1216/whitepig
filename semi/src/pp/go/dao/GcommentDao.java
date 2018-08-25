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
//´ñ±Ûº° ÃßÃµ°¹¼ö
//»èÁ¦ idÃ¼Å©

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
	public int getCount(int bNum, int tNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select NVL(count(cnum), 0) cnt from Gcomment where bNum = ? and tNum = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNum);
			pstmt.setInt(2, tNum);
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

		String sql = "insert into gcomment values(?, ?, ?, ?, 0, ?, ?, ?, sysdate)";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getMaxNum() + 1);
			pstmt.setInt(2, vo.getbNum());
			pstmt.setInt(3, vo.gettNum());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getNic());
			pstmt.setString(6, vo.getPwd());
			pstmt.setString(7, vo.getId());

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	// Å×ÀÌºíº° ´ñ±Ûµé
	public ArrayList<GcommentVo> list(int bNum, int tNum) {
		ArrayList<GcommentVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from gcomment where bNum = ? and tNum = ? order by cnum asc";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNum);
			pstmt.setInt(2, tNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int cNum = rs.getInt("cNum");
				String content = rs.getString("content");
				int recomm = rs.getInt("recomm");
				String nic = rs.getString("nic");
				String pwd = rs.getString("pwd");
				String id = rs.getString("id");
				Date regdate = rs.getDate("regdate");

				list.add(new GcommentVo(cNum, bNum, tNum, content, recomm, nic, pwd, id, regdate));
			}
			return list;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}

	// »èÁ¦ idÃ¼Å©
	public GcommentVo select(int cNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		GcommentVo vo = null;

		String sql = "select * from gcomment where cNum = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cNum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int bNum = rs.getInt("bNum");
				int tNum = rs.getInt("tNum");
				String content = rs.getString("content");
				int recomm = rs.getInt("recomm");
				String nic = rs.getString("nic");
				String pwd = rs.getString("pwd");
				String id = rs.getString("id");
				Date regdate = rs.getDate("regdate");

				vo = new GcommentVo(cNum, bNum, tNum, content, recomm, nic, pwd, id, regdate);
			}
			return vo;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}

	// ´ñ±Û »èÁ¦
	public int removeComment(int cNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from gcomment where cNum = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cNum);

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}
}
