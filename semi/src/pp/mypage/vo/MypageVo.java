package pp.mypage.vo;

public class MypageVo
{
	private int tablenumber;
	private String tablename;
	
	public MypageVo() {}

	public MypageVo(int tablenumber, String tablename)
	{
		super();
		this.tablenumber = tablenumber;
		this.tablename = tablename;
	}

	public int getTablenumber()
	{
		return tablenumber;
	}

	public void setTablenumber(int tablenumber)
	{
		this.tablenumber = tablenumber;
	}

	public String getTablename()
	{
		return tablename;
	}

	public void setTablename(String tablename)
	{
		this.tablename = tablename;
	}

	@Override
	public String toString()
	{
		return "MypageVo [tablenumber=" + tablenumber + ", tablename=" + tablename + "]";
	}
}
