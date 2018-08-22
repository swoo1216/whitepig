package pp.go.vo;

import java.sql.Date;

public class GcommentVo {
	private int rnum;
	private String content;
	private int recomm;
	private String id;
	private int bnum;
	private Date regdate;

	public GcommentVo() {
	}

	public GcommentVo(int rnum, String content, int recomm, String id, int bnum, Date regdate) {
		this.rnum = rnum;
		this.content = content;
		this.recomm = recomm;
		this.id = id;
		this.bnum = bnum;
		this.regdate = regdate;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
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
