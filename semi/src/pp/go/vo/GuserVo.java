package pp.go.vo;
//À¯Àú
public class GuserVo {
	private String id;
	private String pwd;
	private String email;
	private String nic;
	private String clss;
	private int num;
	private int point;

	public GuserVo() {
	}

	public GuserVo(String id, String pwd, String email, String nic, String clss, int num, int point) {
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.nic = nic;
		this.clss = clss;
		this.num = num;
		this.point = point;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public String getClss() {
		return clss;
	}

	public void setClss(String clss) {
		this.clss = clss;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

}
