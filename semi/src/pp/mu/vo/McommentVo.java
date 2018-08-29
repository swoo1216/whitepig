package pp.mu.vo;

import java.sql.Date;

public class McommentVo {
	private int cnum;
	private String content;
	private int recomm;
	private String id ;
	private int mnum;
	private Date regdate;
	public McommentVo() {}
	public McommentVo(int cnum, String content, int recomm, String id, int mnum, Date regdate) {
		super();
		this.cnum = cnum;
		this.content = content;
		this.recomm = recomm;
		this.id = id;
		this.mnum = mnum;
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
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
