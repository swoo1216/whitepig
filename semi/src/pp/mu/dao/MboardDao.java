package pp.mu.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import pp.mu.vo.MboardVo;
import test.db.DBConnection;


public class MboardDao {
	private static MboardDao instance = new MboardDao();
	private MboardDao() {}
	public static MboardDao getInstance() {
		return instance;
	}
	// 가장 큰 글번호 얻어오기
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBConnection.conn();
			String sql = "select NVL(max(bnum),0) maxnum from mboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt("maxnum");
			} else {
				return 0;
			}
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
	}

	// 전체 글의 갯수 구하기
	public int getCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBConnection.conn();
			String sql = "select NVL(count(bnum),0) cnt from mboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt("cnt");
			} else {
				return 0;
			}
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
	}

	public int muInsert(MboardVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		try {
			con = DBConnection.conn();
			int boardNum = getMaxNum() + 1; // 추가될글번호
			String sql = "insert into mboard values(?,?,?,?,?,?,sysdate,'path')";			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4, vo.getHit());
			pstmt.setInt(5, vo.getRecomm());
			pstmt.setString(6, vo.getId());			
			int n = pstmt.executeUpdate();
			return n;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt1, con);
		}
	}

	public ArrayList<MboardVo> muList(int srow,int erow) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.conn();
			String sql="SELECT * FROM (SELECT AA.*,ROWNUM RNUM FROM (SELECT * FROM mboard ORDER BY bnum DESC)AA) WHERE RNUM>=? AND RNUM<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, srow);
			pstmt.setInt(2, erow);
			rs=pstmt.executeQuery();
			ArrayList<MboardVo> list=new ArrayList<>();
			while(rs.next()) {
				int bnum=rs.getInt("bnum");
				String title=rs.getString("title");
				String content=rs.getString("content");
				int hit=rs.getInt("hit");
				int recomm=rs.getInt("recomm");			
				String id=rs.getString("id");
				Date regdate=rs.getDate("regdate");
				String path=rs.getString("path");	
				MboardVo vo=new MboardVo(bnum, title, content, hit, recomm, id, regdate, path);
				list.add(vo);
			}
			return list;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			DBConnection.close(rs, pstmt, con);
		}
	}
	public String mboardCount(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			con = DBConnection.conn();
			String sql = "select count(*)count from mboard where id=?";	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString("count");
			}else {
				return null;
			}
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
	}
	public MboardVo muDetail(int bnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		hitUp(bnum);
		try {
			con=DBConnection.conn();
			String sql="select * from mboard where bnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String title=rs.getString("title");
				String content=rs.getString("content");
				int hit=rs.getInt("hit");
				int recomm=rs.getInt("recomm");			
				String id=rs.getString("id");
				Date regdate=rs.getDate("regdate");
				String path=rs.getString("path");	
				MboardVo vo=new MboardVo(bnum, title, content, hit, recomm, id, regdate, path);
				return vo;
			}else {
				return null;
			}
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			DBConnection.close(rs, pstmt, con);
		}
	}
	public int hitUp(int bnum){
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con = DBConnection.conn();
			String sql = "update mboard set hit=hit+1 where bnum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			int hitup=pstmt.executeUpdate();
			return hitup;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, con);
		}
	}
	public int muDelete(int bnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con = DBConnection.conn();
			String sql = "delete mboard where bnum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			return pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.close(null, pstmt, con);
		}
	}
}