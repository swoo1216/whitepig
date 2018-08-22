package pp.main.vo;

public class MainVo
{
	private String id;
	private String pwd;
	private String email;
	private String nic;
	private String clss;
	private String point;
	
	public MainVo() {}
	
	public MainVo(String id, String pwd, String email, String nic, String clss, String point)
	{
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.nic = nic;
		this.clss = clss;
		this.point = point;
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

	public String getPoint()
	{
		return point;
	}

	public void setPoint(String point)
	{
		this.point = point;
	}

	@Override
	public String toString()
	{
		return "MainVo [id=" + id + ", pwd=" + pwd + ", email=" + email + ", nic=" + nic + ", clss=" + clss + ", point="
				+ point + "]";
	}
}
