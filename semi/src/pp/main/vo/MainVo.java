package pp.main.vo;

import java.sql.Date;

public class MainVo
{
	private String id;
	private String pwd;
	private String email;
	private String nic;
	private String clss;
	private int point;
	private Date regdate;
	private int num;
	
	public MainVo() {}

	public MainVo(String id, String pwd, String email, String nic, String clss, int point, Date regdate, int num)
	{
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.nic = nic;
		this.clss = clss;
		this.point = point;
		this.regdate = regdate;
		this.num = num;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getPwd()
	{
		return pwd;
	}

	public void setPwd(String pwd)
	{
		this.pwd = pwd;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getNic()
	{
		return nic;
	}

	public void setNic(String nic)
	{
		this.nic = nic;
	}

	public String getClss()
	{
		return clss;
	}

	public void setClss(String clss)
	{
		this.clss = clss;
	}

	public int getPoint()
	{
		return point;
	}

	public void setPoint(int point)
	{
		this.point = point;
	}

	public Date getRegdate()
	{
		return regdate;
	}

	public void setRegdate(Date regdate)
	{
		this.regdate = regdate;
	}

	public int getNum()
	{
		return num;
	}

	public void setNum(int num)
	{
		this.num = num;
	}

	@Override
	public String toString()
	{
		return "MainVo [id=" + id + ", pwd=" + pwd + ", email=" + email + ", nic=" + nic + ", clss=" + clss + ", point="
				+ point + ", regdate=" + regdate + ", num=" + num + "]";
	}
}