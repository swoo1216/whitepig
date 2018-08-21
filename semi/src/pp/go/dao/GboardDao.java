package pp.go.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pp.go.db.DBConnection;
import pp.go.vo.GboardVo;

public class GboardDao {
	private static GboardDao instance = null;

	private GboardDao() {

	}

	public static GboardDao getInstance() {
		if (instance == null)
			instance = new GboardDao();

		return instance;
	}

	public int getMaxNum() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select NVL(max(bnum), 0) mNum from gboard";
		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getInt("mNum");
			}

			return 1;
		} catch (SQLException se) {
			se.getStackTrace();
			return -1;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}

	public int getCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select NVL(cnt(bnum), 0) cNum from gboard";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getInt("cNum");
			}
			return 0;
		} catch (SQLException se) {
			se.getStackTrace();
			return -1;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}

	public int insert(GboardVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into gboard values(?, ?, ?, 0, 0, ?, sysdate)";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getbNum());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getId());

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			se.getStackTrace();
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	public int hitUp(int bNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update gboard set hit = hit + 1 where bnum = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNum);

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			se.getStackTrace();
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	public int recommUp(int bNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update gboard set recomm = recomm + 1 where bnum = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNum);

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			se.getStackTrace();
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	public int update(GboardVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update gboard set title = ?, content = ? where bnum = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getbNum());

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			se.getStackTrace();
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}

	}

	public int delete(int bNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete from gboard where bnum = ?";
		
		try {
			
		}catch(SQLException se) {
			se.getStackTrace();
		}finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	public GboardVo select(int bNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		GboardVo vo = null;

		String sql = "select * from gboard where bnum = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String title = rs.getString("title");
				String content = rs.getString("content");
				int hit = rs.getInt("hit");
				int recomm = rs.getInt("recomm");
				String id = rs.getString("id");
				Date regdate = rs.getDate("regdate");
				vo = new GboardVo(bNum, title, content, hit, recomm, id, regdate);
			}
			return vo;
		} catch (SQLException se) {
			se.getStackTrace();
			return null;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}

	public ArrayList<GboardVo> list() {
		ArrayList<GboardVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from gboard";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int bNum = rs.getInt("bnum");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int hit = rs.getInt("hit");
				int recomm = rs.getInt("recomm");
				String id = rs.getString("id");
				Date regdate = rs.getDate("regdate");

				list.add(new GboardVo(bNum, title, content, hit, recomm, id, regdate));
			}
			return list;
		} catch (SQLException se) {
			se.getStackTrace();
			return null;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}

}
