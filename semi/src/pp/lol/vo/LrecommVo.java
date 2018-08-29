package pp.lol.vo;

public class LrecommVo {
	private int renum;
	private String id;
	private int bnum;
	
	public LrecommVo() {}

	public LrecommVo(int renum, String id, int bnum) {
		super();
		this.renum = renum;
		this.id = id;
		this.bnum = bnum;
	}

	public int getRenum() {
		return renum;
	}

	public void setRenum(int renum) {
		this.renum = renum;
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
	
	
}
