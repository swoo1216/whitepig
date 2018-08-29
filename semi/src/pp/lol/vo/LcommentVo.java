package pp.lol.vo;

public class LcommentVo {
	private int cnum;
	private String content;
	private String id;
	private String nic;
	private int bnum;
	private String regdate;
	private int num;
	
	public LcommentVo() {
	
	}

	public LcommentVo(int cnum, String content, String id, String nic, int bnum, String regdate, int num) {
		super();
		this.cnum = cnum;
		this.content = content;
		this.id = id;
		this.nic = nic;
		this.bnum = bnum;
		this.regdate = regdate;
		this.num = num;
	}
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
