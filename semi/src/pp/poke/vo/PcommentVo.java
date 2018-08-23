package pp.poke.vo;

import java.sql.Date;

public class PcommentVo {
	private int cnum;
	private String content;
	private int recomm;
	private String id;
	private int bnum;
	private Date regdate;
	
	public PcommentVo() {
	
	}

	public PcommentVo(int cnum, String content, int recomm, String id, int bnum, Date regdate) {
		super();
		this.cnum = cnum;
		this.content = content;
		this.recomm = recomm;
		this.id = id;
		this.bnum = bnum;
		this.regdate = regdate;
	}

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
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

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
