package pp.admin.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import pp.admin.vo.AdminMainVo;
import pp.main.vo.MainVo;
import test.db.DBConnection;

public class AdminMainDao {
	private static AdminMainDao instance = new AdminMainDao();
	private AdminMainDao() {}
	public static AdminMainDao getInstance() {
		return instance;
	}
	public int getUserCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.conn();
			String sql="select NVL(count(id),0) cnt from cuser";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("cnt");
			}else {
				return 0;
			}
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(rs, pstmt, con);
		}
	}
	public ArrayList<AdminMainVo> adminList(int startRow, int endRow){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.conn();
			String sql="SELECT * FROM (SELECT AA.*,ROWNUM RNUM FROM (SELECT * FROM cuser ORDER BY id DESC)AA) WHERE RNUM>=? AND RNUM<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			ArrayList<AdminMainVo> adminlist=new ArrayList<>();
			while(rs.next()) {
				String id=rs.getString("id");
				String pwd=rs.getString("pwd");
				String email=rs.getString("email");
				String nic=rs.getString("nic");
				String clss=rs.getString("clss");
				int point=rs.getInt("point");
				Date regdate=rs.getDate("regdate");
				int num=rs.getInt("num");
				AdminMainVo vo=new AdminMainVo(id, pwd, email, nic, clss, point, regdate, num);
				adminlist.add(vo);
			}
			return adminlist;
		}catch(SQLException se) {
			se.getMessage();
			return null;
		}finally {
			DBConnection.close(rs, pstmt, con);
		}
	}
	public int modifyUser(AdminMainVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=DBConnection.conn();
			String sql="update cuser set pwd=?, email=?, nic=?, clss=?, point=?, regdate=?, num=? where id=? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getPwd());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getNic());
			pstmt.setString(4, vo.getClss());
			pstmt.setInt(5, vo.getPoint());
			pstmt.setDate(6, vo.getRegdate());
			pstmt.setInt(7, vo.getNum());
			pstmt.setString(8, vo.getId());
			return pstmt.executeUpdate();			
		}catch(SQLException se) {
			se.getMessage();
			return -1;
		}finally {
			DBConnection.close(null, pstmt, con);
		}
	}
	public ArrayList<AdminMainVo> searchUser(String sv,String si) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		System.out.println("dao:"+sv);
		System.out.println(si);
		try {
			con=DBConnection.conn();
			String sql="select * from cuser where "+sv+" like '%"+ si +"%'";
			System.out.println(sql);
			pstmt=con.prepareStatement(sql);		
			rs=pstmt.executeQuery();
			ArrayList<AdminMainVo> adminlist=new ArrayList<>();
			while(rs.next()) {
				String id=rs.getString("id");
				System.out.println(id);
				String pwd=rs.getString("pwd");
				String email=rs.getString("email");
				String nic=rs.getString("nic");
				String clss=rs.getString("clss");
				int point=rs.getInt("point");
				Date regdate=rs.getDate("regdate");
				int num=rs.getInt("num");
				AdminMainVo vo=new AdminMainVo(id, pwd, email, nic, clss, point, regdate, num);
				adminlist.add(vo);
			}
			System.out.println(adminlist);
			return adminlist;
		}catch(SQLException se) {
			se.getMessage();
			return null;
		}finally {
			DBConnection.close(rs, pstmt, con);
		}
	}
	public ArrayList<String> salseVolume() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.conn();
			String sql="select count(num) cntnum ,num from inven  group by num order by cntnum desc";			
			pstmt=con.prepareStatement(sql);
			System.out.println(sql);
			rs=pstmt.executeQuery();
			ArrayList<String> list=new ArrayList<>();
			while(rs.next()) {		
				String cntnum=rs.getString("cntnum");
				String num=rs.getString("num");
				String svolume=cntnum+","+num;
				System.out.println(svolume);
				list.add(svolume);
			}
			return list;			
		}catch(SQLException se) {
			se.getMessage();
			return null;
		}finally {
			DBConnection.close(rs, pstmt, con);
		}
	}
	public int cUserDelete(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=DBConnection.conn();
			String sql="delete cuser where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(null, pstmt, con);
		}
	}
	public int insertUser(AdminMainVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBConnection.conn();
			String sql = "insert into cuser values(?,?,?,?,'user',0,sysdate,1)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getNic());
			System.out.println(sql);
			int n = pstmt.executeUpdate();
			return n;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			test.db.DBConnection.close(null, pstmt, con);
		}
	}
}
