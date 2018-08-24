package pp.poke.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pp.go.dao.GcommentDao;
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
								"		SELECT pb.*,gu.nic,gu.num FROM pboard pb join guser gu on pb.id=gu.id order by bnum desc" + 
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
						+ "select pb.*,gu.nic,gu.num from pboard pb join guser gu on pb.id=gu.id where "+search+" "+searchCase+" order by bnum desc "
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
				int bnum=rs.getInt("bnum");
				String title=rs.getString("title");
				String content=rs.getString("content");
				int hit=rs.getInt("hit");
				int recomm=rs.getInt("recomm");
				String id=rs.getString("id");
				String nic=rs.getString("nic");
				int commCnt=PcommentDao.getInstance().getCount(bnum);
				Date regdate=rs.getDate("regdate");
				int num=rs.getInt("num");
				
				PboardVo vo=new PboardVo(bnum, title, content, hit, recomm, id, nic, commCnt, regdate, num);
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
			String sql="select pb.*,gu.nic,gu.num from pboard pb join guser gu on pb.id=gu.id where bnum=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String title=rs.getString("title");
				String content=rs.getString("content");
				int hit=rs.getInt("hit");
				int recomm=rs.getInt("recomm");
				String id=rs.getString("id");
				String nic=rs.getString("nic");
				int commCnt = PcommentDao.getInstance().getCount(bnum);
				Date regdate=rs.getDate("regdate");
				int num=rs.getInt("num");
				
				return new PboardVo(bnum, title, content, hit, recomm, id, nic, commCnt, regdate, num);
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
	public int insert(PboardVo vo) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		String sql="insert into pboard values(?,?,?,0,0,?,sysdate)";
		
		try {
			conn=DBConnection.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, getMaxNum() + 1);
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getId());
			
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(null, pstmt, conn);
		}
	}
}






