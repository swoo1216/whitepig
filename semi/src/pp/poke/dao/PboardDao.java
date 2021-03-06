package pp.poke.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import pp.go.dao.GuserDao;
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
				String sql="select NVL(count(bnum),0) cnt from pboard pb, cuser gu where pb.id=gu.id";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
			}else {
				String searchCase = "";
				if(search.equals("nic")) {
					searchCase = " = ? ";
				}else {
					searchCase = " like '%'||?||'%' ";
				}
				String sql="select NVL(count(bnum),0) cnt from pboard pb join cuser gu on pb.id=gu.id where "+search+searchCase;
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
	public ArrayList<PboardVo> list(int startRow,int endRow,String sort,String search,String keyword){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=DBConnection.conn();
			if(keyword.equals("")) {
				if(sort==null) sort="bnum";
				if(sort.equals("")) sort="bnum";
				String sql=
						"SELECT * FROM " + 
								"( " + 
								"	SELECT AA.*,ROWNUM RNUM FROM " + 
								"	( " + 
								"		SELECT pb.*,gu.nic,gu.num FROM pboard pb join cuser gu on pb.id=gu.id order by "+sort+" desc" + 
								"	)AA " + 
								") " + 
								"WHERE RNUM>=? AND RNUM<=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs=pstmt.executeQuery();
			}else {
				String searchCase = "";
				if(search.equals("nic")) {
					searchCase=" = ? ";
				}else {
					searchCase=" like '%'||?||'%' ";
				}
				
				String sql="select * from ( "
						+ "select a.*, rownum rnum from( "
						+ "select pb.*,gu.nic,gu.num from pboard pb join cuser gu on pb.id=gu.id where "+search+" "+searchCase+" order by bnum desc "
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
				String regdate=rs.getString("regdate");
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
			String sql="select pb.*,gu.nic,gu.num from pboard pb join cuser gu on pb.id=gu.id where bnum=?";
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
				String regdate=rs.getString("regdate");
				String rdate=regdate.split("\\.")[0];
				int num=rs.getInt("num");
				
				return new PboardVo(bnum, title, content, hit, recomm, id, nic, commCnt, rdate, num);
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
	
	public int hitup(int bnum) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		String sql="update pboard set hit = hit + 1 where bnum = ?";
		
		try {
			conn=DBConnection.conn();
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
	
	public int recommUp(int bnum,int recomm) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		String sql="update pboard set recomm=? where bnum=?";
		
		try {
			conn=DBConnection.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, recomm);
			pstmt.setInt(2, bnum);
			
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(null, pstmt, conn);
		}
	}
	public ArrayList<PboardVo> pmainList()
	{
		ArrayList<PboardVo> list = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.conn();
			String sql = "select * from(select * from pboard order by bnum desc) where rownum <=10";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int bnum=rs.getInt("bnum");
				String title=rs.getString("title");
				String content=rs.getString("content");
				int hit=rs.getInt("hit");
				int recomm=rs.getInt("recomm");
				String id=rs.getString("id");
				String nic=GuserDao.getInstance().select(id).getNic();
				int commCnt=PcommentDao.getInstance().getCount(bnum);
				String regdate=rs.getString("regdate");
				int num=GuserDao.getInstance().select(id).getNum();
				
				PboardVo vo=new PboardVo(bnum, title, content, hit, recomm, id, nic, commCnt, regdate, num);
				list.add(vo);
			}
			return list;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}
		finally
		{
			DBConnection.close(rs, stmt, conn);
		}
	}
}






