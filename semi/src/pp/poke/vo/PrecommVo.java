package pp.poke.vo;

public class PrecommVo {
	private int renum;
	private String id;
	private int bnum;
	
	public PrecommVo() {}

	public PrecommVo(int renum, String id, int bnum) {
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
