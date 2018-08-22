package pp.inven.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pp.icon.dao.IconDao;
import pp.inven.vo.InvenVo;
import test.db.DBConnection;

public class InvenDao {
	private static InvenDao instance=new InvenDao();
	private InvenDao() {
		
	}
	public static InvenDao getInstance() {
		return instance;
	}
	public int insert(InvenVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=DBConnection.conn();
			String sql="insert into inven values(in_seq.nextval,?,?,sysdate)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setInt(2, vo.getNum());
			
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(null, pstmt, con);
		}
	}
	public int delete(int inum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=DBConnection.conn();
			String sql="delete from inven where inum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, inum);
			
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(null, pstmt, con);
		}
	}
	public InvenVo select(int inum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		InvenVo vo=null;
		try {
			con=DBConnection.conn();
			String sql="select iv.*,i* from inven iv join icon i on iv.num=i.num where inum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, inum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String id=rs.getString("id");
				int num=rs.getInt("num");
				String name=rs.getString("name");
				String type=rs.getString("type");
				String tier=rs.getString("tier");
				int price=rs.getInt("price");
				Date regdate=rs.getDate("regdate");
				
				vo=new InvenVo(inum, id, num, name, type, tier, price, regdate);	
			}
			return vo;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			DBConnection.close(rs, pstmt, con);
		}
	}
	public ArrayList<InvenVo> list(){
		ArrayList<InvenVo> list=new ArrayList<>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.conn();
			String sql="select iv.*,i.* from inven iv join icon i on iv.num=i.num";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int inum=rs.getInt("inum");
				String id=rs.getString("id");
				int num=rs.getInt("num");
				String name=rs.getString("name");
				String type=rs.getString("type");
				String tier=rs.getString("tier");
				int price=rs.getInt("price");
				Date regdate=rs.getDate("regdate");
				
				list.add(new InvenVo(inum, id, num, name, type, tier, price, regdate));
			}
			return list;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			DBConnection.close(rs, pstmt, con);
		}
	}
}













