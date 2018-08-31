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

	public int countComment(String id)
	{
		Connection con = null;
		PreparedStatement[] pstmt = new PreparedStatement[4];
		ResultSet[] rs = new ResultSet[4];
		
		String[] sql = new String[4];
		sql[0] = "select count(*) count from lcomment where id=?";
		sql[1] = "select count(*) count from gcomment where id=?";
		sql[2] = "select count(*) count from pcomment where id=?";
		sql[3] = "select count(*) count from mcomment where id=?";
		
		int ctotal = 0;
		try
		{
			con = DBConnection.conn();
			for(int i = 0; i<4; i++)
			{
				pstmt[i] = con.prepareStatement(sql[i]);
				pstmt[i].setString(1, id);
				
				rs[i] = pstmt[i].executeQuery();
				rs[i].next();
				ctotal+= rs[i].getInt("count");
				System.out.println("ctotal" + ctotal);
			}
			return ctotal;
		}
		catch(SQLException se)
		{
			System.out.println(se.getMessage());
			return -1;
		}
		finally
		{
			for(int i=0; i<4; i++)
			{
				DBConnection.close(rs[i], pstmt[i], con);
			}
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

	public int getMaxNum1()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "select NVL(max(bnum),0) maxnum from gboard";
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
	
	public int getCount1()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "select NVL(count(bnum),0) cnt from gboard";
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
	
	public ArrayList<MypageVo> list1(int startRow, int endRow,String id)
	{
		String sql = "select * from(select aa.*,rownum rnum from(select * from"
				+ " gboard order by bnum desc)aa) where rnum>=? and rnum<=? and id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, id);
			rs = pstmt.executeQuery();
			ArrayList<MypageVo> list1 = new ArrayList<>();
			while (rs.next())
			{
				int bnum = rs.getInt("bnum");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int hit = rs.getInt("hit");
				int recomm = rs.getInt("recomm");
				id = rs.getString("id");
				String regdate = rs.getString("regdate");
				MypageVo vo = new MypageVo(bnum, title, content, hit, recomm, id, regdate);
				System.out.println(vo);
				list1.add(vo);
			}
			return list1;
		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return null;
		} finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}
	
	public int getCommentMaxNum1()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "select NVL(max(cnum),0) maxnum from gcomment";
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
	
	public int getCommentCount1()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "select NVL(count(cnum),0) cnt from gcomment";
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
	
	public ArrayList<MypageVo> commentlist1(int startRow, int endRow,String id)
	{
		String sql = "select * from(select aa.*,rownum from(select * from"
				+ " gcomment order by cnum desc)aa) where rownum>=? and rownum<=? and id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, id);
			rs = pstmt.executeQuery();
			ArrayList<MypageVo> commentlist1 = new ArrayList<>();
			while (rs.next())
			{
				int cnum = rs.getInt("cnum");
				String content = rs.getString("content");
				String regdate = rs.getString("regdate");
				MypageVo vo = new MypageVo(cnum, null, content, 0, 0, null, regdate);
				System.out.println(vo);
				commentlist1.add(vo);
			}
			return commentlist1;
		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return null;
		} finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}
	public int getMaxNum2()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "select NVL(max(bnum),0) maxnum from pboard";
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
	
	public int getCount2()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "select NVL(count(bnum),0) cnt from pboard";
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
	
	public ArrayList<MypageVo> list2(int startRow, int endRow,String id)
	{
		String sql = "select * from(select aa.*,rownum rnum from(select * from"
				+ " pboard order by bnum desc)aa) where rnum>=? and rnum<=? and id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, id);
			rs = pstmt.executeQuery();
			ArrayList<MypageVo> list2 = new ArrayList<>();
			while (rs.next())
			{
				int bnum = rs.getInt("bnum");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int hit = rs.getInt("hit");
				int recomm = rs.getInt("recomm");
				id = rs.getString("id");
				String regdate = rs.getString("regdate");
				MypageVo vo = new MypageVo(bnum, title, content, hit, recomm, id, regdate);
				System.out.println(vo);
				list2.add(vo);
			}
			return list2;
		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return null;
		} finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}
	
	public int getCommentMaxNum2()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "select NVL(max(cnum),0) maxnum from pcomment";
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
	
	public int getCommentCount2()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "select NVL(count(cnum),0) cnt from pcomment";
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
	
	public ArrayList<MypageVo> commentlist2(int startRow, int endRow,String id)
	{
		String sql = "select * from(select aa.*,rownum from(select * from"
				+ " pcomment order by cnum desc)aa) where rownum>=? and rownum<=? and id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, id);
			rs = pstmt.executeQuery();
			ArrayList<MypageVo> commentlist2 = new ArrayList<>();
			while (rs.next())
			{
				int cnum = rs.getInt("cnum");
				String content = rs.getString("content");
				String regdate = rs.getString("regdate");
				MypageVo vo = new MypageVo(cnum, null, content, 0, 0, null, regdate);
				System.out.println(vo);
				commentlist2.add(vo);
			}
			return commentlist2;
		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return null;
		} finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}
	public int getMaxNum3()
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
	
	public int getCount3()
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
	
	public ArrayList<MypageVo> list3(int startRow, int endRow,String id)
	{
		String sql = "select * from(select aa.*,rownum rnum from(select * from"
				+ " lboard order by bnum desc)aa) where rnum>=? and rnum<=? and id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, id);
			rs = pstmt.executeQuery();
			ArrayList<MypageVo> list = new ArrayList<>();
			while (rs.next())
			{
				int bnum = rs.getInt("bnum");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int hit = rs.getInt("hit");
				int recomm = rs.getInt("recomm");
				id = rs.getString("id");
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
	
	public int getCommentMaxNum3()
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
	
	public int getCommentCount3()
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
	
	public ArrayList<MypageVo> commentlist3(int startRow, int endRow,String id)
	{
		String sql = "select * from(select aa.*,rownum from(select * from"
				+ " lcomment order by cnum desc)aa) where rownum>=? and rownum<=? and id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, id);
			rs = pstmt.executeQuery();
			ArrayList<MypageVo> commentlist3 = new ArrayList<>();
			while (rs.next())
			{
				int bnum = rs.getInt("bnum");
				String content = rs.getString("content");
				String regdate = rs.getString("regdate");
				MypageVo vo = new MypageVo(bnum, null, content, 0, 0, null, regdate);
				System.out.println(vo);
				commentlist3.add(vo);
			}
			return commentlist3;
		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return null;
		} finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}

	public int getMaxNum4()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "select NVL(max(bnum),0) maxnum from mboard";
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
	
	public int getCount4()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "select NVL(count(bnum),0) cnt from mboard";
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
	
	public ArrayList<MypageVo> list4(int startRow, int endRow, String id)
	{
		String sql = "select * from(select aa.*,rownum rnum from(select"
				+ "bnum, title, content, hit, recomm, id, regdate from"
				+ " mboard order by bnum desc)aa) where rnum>=? and rnum<=? and id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, id);
			rs = pstmt.executeQuery();
			ArrayList<MypageVo> list4 = new ArrayList<>();
			while (rs.next())
			{
				int bnum = rs.getInt("bnum");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int hit = rs.getInt("hit");
				int recomm = rs.getInt("recomm");
				id = rs.getString("id");
				String regdate = rs.getString("regdate");
				MypageVo vo = new MypageVo(bnum, title, content, hit, recomm, id, regdate);
				System.out.println(vo);
				list4.add(vo);
			}
			return list4;
		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return null;
		} finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}
	
	public int getCommentMaxNum4()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "select NVL(max(cnum),0) maxnum from mcomment";
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
	
	public int getCommentCount4()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "select NVL(count(cnum),0) cnt from mcomment";
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
	
	public ArrayList<MypageVo> commentlist4(int startRow, int endRow,String id)
	{
		String sql = "select * from(select aa.*,rownum from(select * from"
				+ " mcomment order by cnum desc)aa) where rownum>=? and rownum<=? and id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, id);
			rs = pstmt.executeQuery();
			ArrayList<MypageVo> commentlist4 = new ArrayList<>();
			while (rs.next())
			{
				int cnum = rs.getInt("cnum");
				String content = rs.getString("content");
				String regdate = rs.getString("regdate");
				MypageVo vo = new MypageVo(cnum, null, content, 0, 0, null, regdate);
				System.out.println(vo);
				commentlist4.add(vo);
			}
			return commentlist4;
		} catch (SQLException se)
		{
			System.out.println(se.getMessage());
			return null;
		} finally
		{
			DBConnection.close(rs, pstmt, con);
		}
	}
	public ArrayList<Integer> iconlist(String id)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			con = DBConnection.conn();
			String sql = "select num from inven where id = ? order by num";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			ArrayList<Integer> iconlist = new ArrayList<>();
			while(rs.next())
			{
				int num = rs.getInt("num");
				iconlist.add(num);
			}
			System.out.println(iconlist);
			return iconlist;
		}
		catch(SQLException se)
		{
			System.out.println(se.getMessage());
		}
		finally
		{
			DBConnection.close(rs, pstmt, con);
		}
		return null;
	}
}
