package pp.lol.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pp.go.db.DBConnection;
import pp.lol.vo.LboardVo;

public class LboardDao {
	private static LboardDao instance=new LboardDao();
	private LboardDao() {}
	public static LboardDao getInstance() {
		return instance;
	}
	public int getMaxNum() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=DBConnection.conn();
			String sql="select NVL(max(bnum),0) maxnum from lboard";
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
				String sql="select NVL(count(bnum),0) cnt from lboard lb, cuser cu where lb.id=cu.id";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
			}else {
				String searchCase = "";
				if(search.equals("nic")) {
					searchCase = " = ? ";
				}else {
					searchCase = " like '%'||?||'%' ";
				}
				String sql="select NVL(count(bnum),0) cnt from lboard lb join cuser cu on lb.id=cu.id where "+search+searchCase;
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
	public ArrayList<LboardVo> list(int startRow,int endRow,String sort,String search,String keyword){
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
								"		SELECT lb.*,cu.nic,cu.num FROM lboard lb join cuser cu on lb.id=cu.id order by "+sort+" desc" + 
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
						+ "select lb.*,cu.nic,cu.num from lboard lb join cuser cu on lb.id=cu.id where "+search+" "+searchCase+" order by bnum desc "
						+ ")a "
					+ ") where rnum>=? and rnum <=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rs=pstmt.executeQuery();
			}
			ArrayList<LboardVo> list=new ArrayList<>();
			while(rs.next()) {
				int bnum=rs.getInt("bnum");
				String title=rs.getString("title");
				String content=rs.getString("content");
				int hit=rs.getInt("hit");
				int recomm=rs.getInt("recomm");
				String id=rs.getString("id");
				String nic=rs.getString("nic");
				int commCnt=LcommentDao.getInstance().getCount(bnum);
				String regdate=rs.getString("regdate");
				int num=rs.getInt("num");
				
				LboardVo vo=new LboardVo(bnum, title, content, hit, recomm, id, nic, commCnt, regdate, num);
				list.add(vo);
			}
			return list;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}
	}
	public LboardVo select(int bnum) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=DBConnection.conn();
			String sql="select pb.*,gu.nic,gu.num from lboard pb join cuser gu on pb.id=gu.id where bnum=?";
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
				int commCnt = LcommentDao.getInstance().getCount(bnum);
				String regdate=rs.getString("regdate");
				String rdate=regdate.split("\\.")[0];
				int num=rs.getInt("num");
				
				return new LboardVo(bnum, title, content, hit, recomm, id, nic, commCnt, rdate, num);
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
			String sql="delete from lboard where bnum=?";
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
	public int update(LboardVo vo) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn=DBConnection.conn();
			String sql="update lboard set title=?,content=? where bnum=?";
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
	public int insert(LboardVo vo) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		String sql="insert into lboard values(?,?,?,0,0,?,sysdate)";
		
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
		
		String sql="update lboard set hit = hit + 1 where bnum = ?";
		
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
		
		String sql="update lboard set recomm=? where bnum=?";
		
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
}






