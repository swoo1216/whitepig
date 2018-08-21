package pp.lol.vo;

import java.util.Date;

public class LoLBoardVo
{
	private int bnum;
	private String title;
	private String content;
	private int hit;
	private int number;
	private Date regdate;
	private String id;
	
	public LoLBoardVo() {}

	public LoLBoardVo(int bnum, String title, String content, int hit, int number, Date regdate, String id)
	{
		super();
		this.bnum = bnum;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.number = number;
		this.regdate = regdate;
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

	public int getHit()
	{
		return hit;
	}

	public void setHit(int hit)
	{
		this.hit = hit;
	}

	public int getNumber()
	{
		return number;
	}

	public void setNumber(int number)
	{
		this.number = number;
	}

	public Date getRegdate()
	{
		return regdate;
	}

	public void setRegdate(Date regdate)
	{
		this.regdate = regdate;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	@Override
	public String toString()
	{
		return "LoLBoardVo [bnum=" + bnum + ", title=" + title + ", content=" + content + ", hit=" + hit + ", number="
				+ number + ", regdate=" + regdate + ", id=" + id + "]";
	}
}


