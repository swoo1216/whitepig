package pp.go.vo;

import java.sql.Date;

public class GcommentVo {
	private int rNum;
	private String content;
	private int recomm;
	private String id;
	private int bNum;
	private Date regdate;

	public GcommentVo() {
	}

	public GcommentVo(int rNum, String content, int recomm, String id, int bNum, Date regdate) {
		this.rNum = rNum;
		this.content = content;
		this.recomm = recomm;
		this.id = id;
		this.bNum = bNum;
		this.regdate = regdate;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
