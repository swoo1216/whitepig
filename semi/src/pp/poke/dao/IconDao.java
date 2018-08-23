package pp.poke.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pp.go.db.DBConnection;
import pp.poke.vo.IconVo;

public class IconDao {
	private static IconDao instance=new IconDao();
	private IconDao() {}
	public static IconDao getInstance() {
		return instance;
	}
	public int getMaxNum() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.conn();
			String sql="select NVL(max(num),0) maxnum from icon";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("maxnum");
			}else{
				return 0;
			}
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DBConnection.close(rs, pstmt, con);
		}
	}
	public int getCount(String search,String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.conn();
			
			if(keyword.equals("")) {
					String sql="select NVL(count(num),0) cnt from icon";
					pstmt=con.prepareStatement(sql);
					rs=pstmt.executeQuery();
			}else {
				String searchCase = "";
				if(search.equals("type")) {
					searchCase = " = ? ";
				}else {
					searchCase = " like '%'||?||'%' ";
				}
				String sql="select NVL(count(num),0) cnt from icon where "+search+searchCase;
				pstmt=con.prepareStatement(sql);
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
			DBConnection.close(rs, pstmt, con);
		}
	}
	public ArrayList<IconVo> listIcon(int startRow,int endRow,String search,String keyword){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.conn();
		if(keyword.equals("")) {
			String sql=
					"SELECT * FROM " + 
							"( " + 
							"	SELECT AA.*,ROWNUM RNUM FROM " + 
							"	( " + 
							"		SELECT * FROM icon order by num" + 
							"	)AA " + 
							") " + 
							"WHERE RNUM>=? AND RNUM<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
		}else {
			String searchCase = "";
			if(search.equals("type")) {
				searchCase=" = ? ";
			}else {
				searchCase=" like '%'||?||'%' ";
			}
		
			String sql="select * from ( "
				+ "select a.*, rownum rnum from( "
				+ "select * from icon where "+search+" "+searchCase+" order by num desc "
				+ ")a "
			+ ") where rnum>=? and rnum <=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs=pstmt.executeQuery();
		}
			ArrayList<IconVo> list=new ArrayList<>();
			while(rs.next()) {
				int num=rs.getInt(1);
				String name=rs.getString(2);
				String type=rs.getString(3);
				String tier=rs.getString(4);
				int price=rs.getInt(5);
				IconVo vo=new IconVo(num, name, type, tier, price);
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
	public IconVo select(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.conn();
			String sql="select * from icon where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String name=rs.getString("name");
				String type=rs.getString("type");
				String tier=rs.getString("tier");
				int price=rs.getInt("price");
				return new IconVo(num, name, type, tier, price);
			}else {
				return null;
			}
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			DBConnection.close(rs, pstmt, con);
		}
	}
}






