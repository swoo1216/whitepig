package pp.poke.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pp.go.db.DBConnection;
import pp.poke.vo.ChatVo;

public class ChatDao {
	private static ChatDao instance=new ChatDao();
	private ChatDao() {}
	public static ChatDao getInstance() {
		return instance;
	}
	public ArrayList<ChatVo> list(String nowTime){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<ChatVo> list=null;
		try {
			conn=DBConnection.conn();
			String sql="select * from chat where regdate > ? order by regdate";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nowTime);
			rs=pstmt.executeQuery();
			list=new ArrayList<>();
			while(rs.next()) {
				ChatVo vo=new ChatVo();
				vo.setChatNum(rs.getInt("chatNum"));
				vo.setId(rs.getString("id"));
				vo.setNic(rs.getString("nic"));
				vo.setNum(rs.getInt("num"));
				vo.setContent(rs.getString("content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\n", "<br>"));
				int chatTime = Integer.parseInt(rs.getString("regdate").substring(11, 13));
				String timeType = "오전";
				if(Integer.parseInt(rs.getString("regdate").substring(11, 13)) >=12) {
					timeType="오후";
					chatTime -= 12;
				}
				vo.setRegdate(rs.getString("regdate").substring(0, 11) + " " + timeType + " " + chatTime + ":" + rs.getString("regdate").substring(14, 16) + "");
				list.add(vo);
			}
			return list;
			
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}
	
	public ArrayList<ChatVo> listByRecent(int number){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<ChatVo> list=null;
		try {
			conn=DBConnection.conn();
			String sql="select * from chat where chatnum > (select max(chatnum) - ? from chat) order by regdate";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			rs=pstmt.executeQuery();
			list=new ArrayList<>();
			while(rs.next()) {
				ChatVo vo=new ChatVo();
				vo.setChatNum(rs.getInt("chatNum"));
				vo.setId(rs.getString("id"));
				vo.setNic(rs.getString("nic"));
				vo.setNum(rs.getInt("num"));
				vo.setContent(rs.getString("content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\n", "<br>"));
				int chatTime = Integer.parseInt(rs.getString("regdate").substring(11, 13));
				String timeType = "오전";
				if(Integer.parseInt(rs.getString("regdate").substring(11, 13)) >=12) {
					timeType="오후";
					chatTime -= 12;
				}
				vo.setRegdate(rs.getString("regdate").substring(0, 11) + " " + timeType + " " + chatTime + ":" + rs.getString("regdate").substring(14, 16) + "");
				list.add(vo);
			}
			return list;
			
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}
	
	public ArrayList<ChatVo> listByRecent(String chatNum){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<ChatVo> list=null;
		try {
			conn=DBConnection.conn();
			String sql="select * from chat where chatnum > ? order by regdate";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(chatNum));
			rs=pstmt.executeQuery();
			list=new ArrayList<>();
			while(rs.next()) {
				ChatVo vo=new ChatVo();
				vo.setChatNum(rs.getInt("chatNum"));
				vo.setId(rs.getString("id"));
				vo.setNic(rs.getString("nic"));
				vo.setNum(rs.getInt("num"));
				vo.setContent(rs.getString("content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\n", "<br>"));
				int chatTime = Integer.parseInt(rs.getString("regdate").substring(11, 13));
				String timeType = "오전";
				if(Integer.parseInt(rs.getString("regdate").substring(11, 13)) >=12) {
					timeType="오후";
					chatTime -= 12;
				}
				vo.setRegdate(rs.getString("regdate").substring(0, 11) + " " + timeType + " " + chatTime + ":" + rs.getString("regdate").substring(14, 16) + "");
				list.add(vo);
			}
			return list;
			
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}
	public int submit(ChatVo vo) {
		Connection conn=null;
		PreparedStatement pstmt=null;
	
		try {
			conn=DBConnection.conn();
			String sql="insert into chat values(chat_seq.nextval,?,?,?,?,sysdate)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getNic());
			pstmt.setInt(3, vo.getNum());
			pstmt.setString(4, vo.getContent());
			
			return pstmt.executeUpdate();
			
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			DBConnection.close(null, pstmt, conn);
		}
	}
}
