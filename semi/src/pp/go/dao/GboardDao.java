package pp.go.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import pp.go.db.DBConnection;
import pp.go.vo.GboardVo;

//테이블 게시물 갯수
//게시물 등록
//조회수 업
//게시글 수정
//게시글 삭제
//게시글 상세 보기
//게시물 리스트

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

			return 0;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}

	// 테이블 게시물 갯수
	public int getCount(String search, String scontent) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		if (scontent == null)
			scontent = "";
		if (search == null)
			search = "";

		switch (search) {
		case "content":
		case "title":
		case "nic":
			search = " where gb.id = gu.id and " + search + " like '%" + scontent + "%'";
			break;
		default:
			search = " where gb.id = gu.id";
		}

		String sql = "select NVL(count(bnum), 0) cnt from gboard gb, guser gu " + search;

		System.out.println(sql);

		try {
			conn = DBConnection.conn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				return rs.getInt("cnt");
			}
			return 0;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(rs, stmt, conn);
		}
	}

	// 게시물 등록
	public int insert(GboardVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into gboard values(?, ?, ?, 0, 0, ?, sysdate)";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getMaxNum() + 1);
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getNic());

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	// 조회수 업
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
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	public int updateRecomm(int bNum, int recomm) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update gboard set recomm = ? where bNum =? ";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recomm);
			pstmt.setInt(2, bNum);

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	// 게시글 수정
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
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}

	}

	// 게시글 삭제
	public int delete(int bNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from gboard where bnum = ?";

		try {
			conn = DBConnection.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNum);

			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, conn);
		}
	}

	// 게시글 상세 보기
	public GboardVo select(int bNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		GboardVo vo = null;

		String sql = "select gb.*, gu.nic nic from gboard gb join guser gu on gb.id = gu.id where bnum = ?";

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
				String nic = rs.getString("nic");
				int countComment = GcommentDao.getInstance().getCount(bNum);
				Date regdate = rs.getDate("regdate");
				vo = new GboardVo(bNum, title, content, hit, recomm, id, nic, countComment, 0, regdate);
			}
			return vo;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}

	// 게시물 리스트
	public ArrayList<GboardVo> list(int startRow, int endRow, String sort, String search, String scontent) {
		ArrayList<GboardVo> list = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		if (sort == null)
			sort = "bNum";
		if (sort.equals(""))
			sort = "bNum";
		if (scontent == null)
			scontent = "";
		if (search == null)
			search = "";

		switch (search) {
		case "content":
		case "nic":
		case "title":
			search = " and " + search + " like '%" + scontent + "%'";
			break;
		default:
			search = "";
		}

		String sql = "select * from ( " + "    select aa.*, rownum rnum from " + "    ( "
				+ "        select gb.*, gu.nic nic from gboard gb, guser gu where gb.id = gu.id " + search
				+ " order by " + sort + " desc " + "    ) aa" + ") where rnum >=" + startRow + " and rnum <= " + endRow;

		try {
			conn = DBConnection.conn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int bNum = rs.getInt("bnum");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int hit = rs.getInt("hit");
				int recomm = rs.getInt("recomm");
				String id = rs.getString("id");
				String nic = rs.getString("nic");
				Date regdate = rs.getDate("regdate");
				int countComment = GcommentDao.getInstance().getCount(bNum);

				list.add(new GboardVo(bNum, title, content, hit, recomm, id, nic, countComment, 0, regdate));
			}
			return list;
		} catch (SQLException se) {
			return null;
		} finally {
			DBConnection.close(rs, stmt, conn);
		}
	}

}
