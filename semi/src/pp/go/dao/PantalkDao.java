package pp.go.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pp.go.db.DBConnection;
import pp.go.vo.GuserVo;
import pp.go.vo.PantalkVo;

public class PantalkDao {
	private static PantalkDao instance = null;

	private PantalkDao() {

	}

	public static PantalkDao getInstance() {
		if (instance == null)
			instance = new PantalkDao();
		return instance;
	}

	public int getMaxNum() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select NVL(max(panNum), 0) max from pantalk";
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
			DBConnection.close(rs, pstmt, conn);
		}
	}

	public int getCount(String receiver) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select NVL(count(panNum), 0) cnt from pantalk where receiver = ? and sendOk = 0";
		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, receiver);
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

	public int insert(PantalkVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into pantalk values(?, ?, ?, ?, sysdate, ?)";
		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getMaxNum() + 1);
			pstmt.setString(2, vo.getSender());
			pstmt.setString(3, vo.getReceiver());
			pstmt.setString(4, vo.getContent());
			pstmt.setInt(5, 0); // 0: 읽지 않음, 1: 읽음

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	public int getSenderCount(String sender, String receiver) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select NVL(count(panNum), 0) cnt from pantalk where sender = ? and receiver = ? and sendOk = 0";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sender);
			pstmt.setString(2, receiver);
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

	// 수신 확인

	public int sendOk(String sender, String receiver) { // receiver 로그인한 사람
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update pantalk set sendOk = 1 where sendOk = 0 and sender = ? and receiver = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sender);
			pstmt.setString(2, receiver);

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	// 대화목록
	public ArrayList<PantalkVo> list(String sender, String receiver) {
		ArrayList<PantalkVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from pantalk where (sender = ? and receiver = ?)"
				+ " or (sender = ? and receiver = ?) order by senddate";
		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sender);
			pstmt.setString(2, receiver);
			pstmt.setString(3, receiver);
			pstmt.setString(4, sender);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int panNum = rs.getInt("panNum");
				String _sender = rs.getString("sender");
				String _receiver = rs.getString("receiver");
				String content = rs.getString("content");
				Date sendDate = rs.getDate("sendDate");
				int sendOk = rs.getInt("sendOk");

				list.add(new PantalkVo(panNum, _sender, _receiver, content, sendDate, sendOk));
			}
			return list;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}

	// 쪽지 보낸 사람 목록
	public ArrayList<GuserVo> getSenderList(String receiver) {
		ArrayList<GuserVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select sender from " + "( select * from pantalk where receiver = ?)aa "
				+ " group by sender order by sender";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, receiver);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(GuserDao.getInstance().select(rs.getString("sender")));
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
