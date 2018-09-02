package pp.admin.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import test.db.DBConnection;
import pp.admin.vo.ReportVo;

public class ReportDao {
	private static ReportDao instance = null;

	private ReportDao() {

	}

	public static ReportDao getInstance() {
		if (instance == null)
			instance = new ReportDao();
		return instance;
	}

	public int getMaxNum() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select NVL(max(reportNum), 0) max from report";

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
			DBConnection.close(null, pstmt, conn);
		}
	}

	public int insert(ReportVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into report values(?, ?, ?, ?, ?, sysdate)";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getMaxNum() + 1);
			pstmt.setString(2, vo.getReporter());
			pstmt.setString(3, vo.getSuspect());
			pstmt.setString(4, vo.getRtype());
			pstmt.setString(5, vo.getContent());

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	public int delete(int reportNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from report where reportNum = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reportNum);

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	public ReportVo select(int reportNum) {
		ReportVo vo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from report where reportNum = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reportNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String reporter = rs.getString("reporter");
				String suspect = rs.getString("suspect");
				String rtype = rs.getString("rtype");
				String content = rs.getString("content");
				Date regdate = rs.getDate("regdate");

				vo = new ReportVo(reportNum, reporter, suspect, rtype, content, regdate);
			}
			return vo;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}

	}

	public ArrayList<ReportVo> list() {
		ArrayList<ReportVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from report";
		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int reportNum = rs.getInt("reportNum");
				String reporter = rs.getString("reporter");
				String suspect = rs.getString("suspect");
				String rtype = rs.getString("rtype");
				String content = rs.getString("content");
				Date regdate = rs.getDate("regdate");

				list.add(new ReportVo(reportNum, reporter, suspect, rtype, content, regdate));
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
