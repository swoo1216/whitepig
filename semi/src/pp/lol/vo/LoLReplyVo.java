package pp.lol.vo;

public class LoLReplyVo
{
	private int rnum;
	private int bnum;
	private String id;
	private String content;
	private int recomm;
	private String regdate;
	
	public LoLReplyVo(){}

	public LoLReplyVo(int rnum, int bnum, String id, String content, int recomm, String regdate)
	{
		super();
		this.rnum = rnum;
		this.bnum = bnum;
		this.id = id;
		this.content = content;
		this.recomm = recomm;
		this.regdate = regdate;
	}

	public int getRnum()
	{
		return rnum;
	}

	public void setRnum(int rnum)
	{
		this.rnum = rnum;
	}

	public int getBnum()
	{
		return bnum;
	}

	public void setBnum(int bnum)
	{
		this.bnum = bnum;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
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
		return "LoLReplyVo [rnum=" + rnum + ", bnum=" + bnum + ", id=" + id + ", content=" + content + ", recomm="
				+ recomm + ", regdate=" + regdate + "]";
	}
}
