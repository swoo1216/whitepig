package pp.go.vo;

public class GtnamesVo {
	private int tNum;
	private String tName;

	public GtnamesVo() {
	}

	public GtnamesVo(int tNum, String tName) {
		this.tNum = tNum;
		this.tName = tName;
	}

	public int gettNum() {
		return tNum;
	}

	public void settNum(int tNum) {
		this.tNum = tNum;
	}

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

}
