package pp.mypage.vo;

public class MypageVo
{
	private int bnum;
	private String title;
	private String content;
	private int recomm;
	private int hit;
	private String id;
	private String regdate;
	
	public MypageVo() {}

	public MypageVo(int bnum, String title, String content, int recomm, int hit, String id, String regdate)
	{
		super();
		this.bnum = bnum;
		this.title = title;
		this.content = content;
		this.recomm = recomm;
		this.hit = hit;
		this.id = id;
		this.regdate = regdate;
	}

	public int getBnum()
	{
		return bnum;
	}

	public void setBnum(int bnum)
	{
		this.bnum = bnum;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public int getRecomm()
	{
		return recomm;
	}

	public void setRecomm(int recomm)
	{
		this.recomm = recomm;
	}

	public int getHit()
	{
		return hit;
	}

	public void setHit(int hit)
	{
		this.hit = hit;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getRegdate()
	{
		return regdate;
	}

	public void setRegdate(String regdate)
	{
		this.regdate = regdate;
	}

	@Override
	public String toString()
	{
		return "MypageVo [bnum=" + bnum + ", title=" + title + ", content=" + content + ", recomm=" + recomm + ", hit="
				+ hit + ", id=" + id + ", regdate=" + regdate + "]";
	}
}