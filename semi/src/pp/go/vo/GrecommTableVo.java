package pp.go.vo;

public class GrecommTableVo {
	private int reNum;
	private String id;
	private int bNum;
	private int tNum;

	public GrecommTableVo() {
	}

	public GrecommTableVo(int reNum, String id, int bNum, int tNum) {
		this.reNum = reNum;
		this.id = id;
		this.bNum = bNum;
		this.tNum = tNum;
	}

	public int getReNum() {
		return reNum;
	}

	public void setReNum(int reNum) {
		this.reNum = reNum;
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

	public int gettNum() {
		return tNum;
	}

	public void settNum(int tNum) {
		this.tNum = tNum;
	}

}
