package pp.go.vo;

import java.sql.Date;

//´ñ±Û Å×ÀÌºí
public class GcommentVo {
	private int cNum;
	private int bNum;
	private int tNum;
	private String content;
	private int recomm;
	private String nic;
	private String pwd;
	private String id;
	private Date regdate;

	public GcommentVo() {
	}

	public GcommentVo(int cNum, int bNum, int tNum, String content, int recomm, String nic, String pwd, String id,
			Date regdate) {
		this.cNum = cNum;
		this.bNum = bNum;
		this.tNum = tNum;
		this.content = content;
		this.recomm = recomm;
		this.nic = nic;
		this.pwd = pwd;
		this.id = id;
		this.regdate = regdate;
	}

	public int getcNum() {
		return cNum;
	}

	public void setcNum(int cNum) {
		this.cNum = cNum;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public int gettNum() {
		return tNum;
	}

	public void settNum(int tNum) {
		this.tNum = tNum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRecomm() {
		return recomm;
	}

	public void setRecomm(int recomm) {
		this.recomm = recomm;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
