package pp.lol.vo;

public class LCommentVo
{
	private int cnum;	
	private String content;
	private String id;
	private int bnum;
	private String regdate;
	
	public LCommentVo(){}

	public LCommentVo(int cnum, String content, String id, int bnum, String regdate)
	{
		super();
		this.cnum = cnum;
		this.content = content;
		this.id = id;
		this.bnum = bnum;
		this.regdate = regdate;
	}

	public int getCnum()
	{
		return cnum;
	}

	public void setCnum(int cnum)
	{
		this.cnum = cnum;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public int getBnum()
	{
		return bnum;
	}

	public void setBnum(int bnum)
	{
		this.bnum = bnum;
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
		return "LCommentVo [cnum=" + cnum + ", content=" + content + ", id=" + id + ", bnum=" + bnum + ", regdate="
				+ regdate + "]";
	}
}