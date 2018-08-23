package pp.poke.vo;

import java.sql.Date;

public class PboardVo {
	private int bnum;
	private String title;
	private String content;
	private int hit;
	private int recomm;
	private String id;
	private Date regdate;
	
	public PboardVo() {
		
	}

	public PboardVo(int bnum, String title, String content, int hit, int recomm, String id, Date regdate) {
		super();
		this.bnum = bnum;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.recomm = recomm;
		this.id = id;
		this.regdate = regdate;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
