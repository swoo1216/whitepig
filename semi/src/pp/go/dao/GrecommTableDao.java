package pp.go.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pp.go.db.DBConnection;
import pp.go.vo.GrecommTableVo;

//��ü ��õ ����
//������ ��õ ����
//���̺� �� ��õ ����
//��õ ���
//��õ ����
//id�� ��ȸ
//��õ ����

public class GrecommTableDao {
	private static GrecommTableDao instance = null;

	private GrecommTableDao() {

	}

	public static GrecommTableDao getInstance() {
		if (instance == null)
			instance = new GrecommTableDao();
		return instance;
	}

	public int getMaxNum() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select NVL(max(reNum), 0) max from GrecommTable";

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

	// ��ü ��õ ����
	public int getCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select NVL(count(reNum), 0) cnt from Grecommtable";

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

	// ������ ��õ ����
	public int getreuserCount(GrecommTableVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select NVL(count(reNum), 0) cnt from Grecommtable where id = ? and bNum = ? and tNum = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setInt(2, vo.getbNum());
			pstmt.setInt(3, vo.gettNum());
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

	//���̺� �� ��õ ����
	public int getretableCount(int bNum, int tNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select NVL(count(reNum), 0) cnt from GrecommTable where bNum = ? and tNum = ?";

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

	// ��õ ���
	public int insert(GrecommTableVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into GrecommTable values(?, ?, ?, ?)";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getMaxNum() + 1);
			pstmt.setString(2, vo.getId());
			pstmt.setInt(3, vo.getbNum());
			pstmt.setInt(4, vo.gettNum());

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	// ��õ ����
	public boolean isRecomm(GrecommTableVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from GrecommTable where id = ? and bNum = ? and tNum = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setInt(2, vo.getbNum());
			pstmt.setInt(3, vo.gettNum());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
			return false;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return false;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}

	// id�� ��ȸ
	public ArrayList<GrecommTableVo> userRecommList(String id) {
		ArrayList<GrecommTableVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from GrecommTable where id = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int reNum = rs.getInt("reNum");
				int bNum = rs.getInt("bNum");
				int tNum = rs.getInt("tNum");

				list.add(new GrecommTableVo(reNum, id, bNum, tNum));
			}
			return list;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}

	// ��õ ����
	public int deleteRecomm(GrecommTableVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from GrecommTable where id = ? and bnum = ? and tNum = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setInt(2, vo.getbNum());
			pstmt.setInt(3, vo.gettNum());

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}
}
