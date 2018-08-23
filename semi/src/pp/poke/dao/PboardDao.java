package pp.poke.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pp.go.db.DBConnection;
import pp.poke.vo.PboardVo;

public class PboardDao {
	private static PboardDao instance=new PboardDao();
	private PboardDao() {}
	public static PboardDao getInstance() {
		return instance;
	}
	public int getMaxNum() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=DBConnection.conn();
			String sql="select NVL(max(bnum),0) maxnum from pboard";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("maxnum");
			}else {
				return 0;
			}
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}
	public int getCount(String search,String keyword) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=DBConnection.conn();
			
			if(keyword.equals("")) {
				String sql="select NVL(count(bnum),0) cnt from pboard";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
			}else {
				String searchCase = "";
				if(search.equals("writer")) {
					searchCase = " = ? ";
				}else {
					searchCase = " like '%'||?||'%' ";
				}
				String sql="select NVL(count(bnum),0) cnt from pboard where "+search+searchCase;
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, keyword);
				rs=pstmt.executeQuery();
			}
			if(rs.next()) {
				return rs.getInt("cnt");
			}else {
				return 0;
			}
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}
	public ArrayList<PboardVo> list(int startRow,int endRow,String search,String keyword){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=DBConnection.conn();
			if(keyword.equals("")) {
				String sql=
						"SELECT * FROM " + 
								"( " + 
								"	SELECT AA.*,ROWNUM RNUM FROM " + 
								"	( " + 
								"		SELECT * FROM pboard order by bnum" + 
								"	)AA " + 
								") " + 
								"WHERE RNUM>=? AND RNUM<=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs=pstmt.executeQuery();
			}else {
				String searchCase = "";
				if(search.equals("writer")) {
					searchCase=" = ? ";
				}else {
					searchCase=" like '%'||?||'%' ";
				}
				
				String sql="select * from ( "
						+ "select a.*, rownum rnum from( "
						+ "select * from pboard where "+search+" "+searchCase+" order by bnum desc "
						+ ")a "
					+ ") where rnum>=? and rnum <=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rs=pstmt.executeQuery();
			}
			ArrayList<PboardVo> list=new ArrayList<>();
			while(rs.next()) {
				int bnum=rs.getInt(1);
				String title=rs.getString(2);
				String content=rs.getString(3);
				int hit=rs.getInt(4);
				int recomm=rs.getInt(5);
				String id=rs.getString(6);
				Date regdate=rs.getDate(7);
				PboardVo vo=new PboardVo(bnum, title, content, hit, recomm, id, regdate);
				list.add(vo);
			}
			return list;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}
	}
	public PboardVo select(int bnum) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=DBConnection.conn();
			String sql="select * from pboard where bnum=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String title=rs.getString("title");
				String content=rs.getString("content");
				int hit=rs.getInt("hit");
				int recomm=rs.getInt("recomm");
				String id=rs.getString("id");
				Date regdate=rs.getDate("regdate");
				return new PboardVo(bnum, title, content, hit, recomm, id, regdate);
			}else {
				return null;
			}
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}
	public int delete(int bnum) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn=DBConnection.conn();
			String sql="delete from pboard where bnum=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(null, pstmt, conn);
		}
	}
	public int update(PboardVo vo) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn=DBConnection.conn();
			String sql="update pboard set title=?,content=? where bnum=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getBnum());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(null, pstmt, conn);
		}
	}
}






