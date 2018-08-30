package pp.mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pp.mypage.vo.MypageVo;
import test.db.DBConnection;

public class MypageDao
{
	public int countBoard(String id)
	{
		Connection con = null;
		PreparedStatement[] pstmt = new PreparedStatement[4];
		ResultSet[] rs = new ResultSet[4];

		String[] sql = new String[4];
		sql[0] = "select count(*) count from lboard where id=?";
		sql[1] = "select count(*) count from gboard where id=?";
		sql[2] = "select count(*) count from pboard where id=?";
		sql[3] = "select count(*) count from mboard where id=?";

		int total = 0;
		try
		{
			con = DBConnection.conn();

			for (int i = 0; i < 4; i++)
			{
				pstmt[i] = con.prepareStatement(sql[i]);
				pstmt[i].setString(1, id);

				rs[i] = pstmt[i].executeQuery();
				rs[i].next();
				total += rs[i].getInt("count");
				System.out.println("total" + total);
			}
			return total;
		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return -1;
		} finally
		{
			for (int i = 0; i < 4; i++)
			{
				DBConnection.close(rs[i], pstmt[i], null);
			}
			DBConnection.close(null, null, con);

		}
	}

	public String countComment(String id)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "select count(*) count from lcomment where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				String n = rs.getString("count");
				return n;
			} else
			{
				return null;
			}
		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return null;
		} finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}

	public int modifyInfo(String id, String email, String nic)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		try
		{
			con = DBConnection.conn();
			String sql = "update cuser set email=? , nic=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, nic);
			pstmt.setString(3, id);
			int n = pstmt.executeUpdate();
			if (n > 0)
			{
				return n;
			} else
			{
				return -1;
			}
		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return -1;
		} finally
		{
			DBConnection.close(null, pstmt, con);
		}
	}

	public int pwdChange(String id, String pwd)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "update cuser set pwd=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, id);
			System.out.println("pwd " + pwd);
			System.out.println("id " + id);
			int n = pstmt.executeUpdate();
			System.out.println("n " + n);
			if (n > 0)
			{
				return n;
			} else
			{
				return -1;
			}
		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return -1;
		} finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}

	public int withDrawal(String id)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "delete from cuser where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			int n = pstmt.executeUpdate();
			if (n > 0)
			{
				return n;
			} else
			{
				return -1;
			}

		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return -1;
		} finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}

	public int getMaxNum()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "select NVL(max(bnum),0) maxnum from lboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				return rs.getInt("maxnum");
			} else
			{
				return 0;
			}
		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return -1;
		} finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}

	public int getCount()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "select NVL(count(bnum),0) cnt from lboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				return rs.getInt("cnt");
			} else
			{
				return 0;
			}
		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return -1;
		} finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}

	public ArrayList<MypageVo> list(int startRow, int endRow)
	{
		String sql = "select * from(select aa.*,rownum rnum from(select * from"
				+ " lboard order by bnum desc)aa) where rnum>=? and rnum<=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			ArrayList<MypageVo> list = new ArrayList<>();
			while (rs.next())
			{
				int bnum = rs.getInt("bnum");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int hit = rs.getInt("hit");
				int recomm = rs.getInt("recomm");
				String id = rs.getString("id");
				String regdate = rs.getString("regdate");
				MypageVo vo = new MypageVo(bnum, title, content, hit, recomm, id, regdate);
				System.out.println(vo);
				list.add(vo);
			}
			return list;
		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return null;
		} finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}

	public int getCommentMaxNum()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "select NVL(max(cnum),0) maxnum from lcomment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				return rs.getInt("maxnum");
			} else
			{
				return 0;
			}
		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return -1;
		} finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}

	public int getCommentCount()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "select NVL(count(cnum),0) cnt from lcomment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println(rs);
			if (rs.next())
			{
				return rs.getInt("cnt");
			} else
			{
				return 0;
			}
		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return -1;
		} finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}

	public ArrayList<MypageVo> commentlist(int startRow, int endRow)
	{
		String sql = "select * from(select aa.*,rownum from(select * from"
				+ " lcomment order by cnum desc)aa) where rownum>=? and rownum<=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			ArrayList<MypageVo> commentlist = new ArrayList<>();
			while (rs.next())
			{
				int rnum = rs.getInt("rnum");
				String content = rs.getString("content");
				String regdate = rs.getString("regdate");
				MypageVo vo = new MypageVo(rnum, null, content, 0, 0, null, regdate);
				System.out.println(vo);
				commentlist.add(vo);
			}
			return commentlist;
		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return null;
		} finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}

	public int hitup(int bnum)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		try
		{
			con = DBConnection.conn();
			String sql = "update lboard set hit=hit+1 where bnum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			return pstmt.executeUpdate();
		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return -1;
		}
	}
}
