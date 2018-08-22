package pp.lol.vo;

public class LoLBoardVo
{
	private int bnum;
	private String title;
	private String content;
	private int reply;
	private int recomm;
	private int hit;
	private String id;
	private String regdate;
	
	public LoLBoardVo() {}

	public LoLBoardVo(int bnum, String title, String content, int reply, int recomm, int hit, String id, String regdate)
	{
		super();
		this.bnum = bnum;
		this.title = title;
		this.content = content;
		this.reply = reply;
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

	public int getReply()
	{
		return reply;
	}

	public void setReply(int reply)
	{
		this.reply = reply;
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

	public String getregdate()
	{
		return regdate;
	}

	public void setregdate(String regdate)
	{
		this.regdate = regdate;
	}

	@Override
	public String toString()
	{
		return "LoLBoardVo [bnum=" + bnum + ", title=" + title + ", content=" + content + ", reply=" + reply
				+ ", recomm=" + recomm + ", hit=" + hit + ", id=" + id + ", regdate=" + regdate + "]";
	}

}