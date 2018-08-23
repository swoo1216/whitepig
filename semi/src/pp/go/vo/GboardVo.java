package pp.go.vo;

import java.sql.Date;

public class GboardVo {
	private int bNum;
	private String title;
	private String content;
	private int hit;
	private int recomm;
	private String id;
	private String nic;
	private int countComment;
	private Date regdate;

	public GboardVo() {
	}

	public GboardVo(int bNum, String title, String content, int hit, int recomm, String id, String nic,
			int countComment, Date regdate) {
		this.bNum = bNum;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.recomm = recomm;
		this.id = id;
		this.nic = nic;
		this.countComment = countComment;
		this.regdate = regdate;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
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

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public int getCountComment() {
		return countComment;
	}

	public void setCountComment(int countComment) {
		this.countComment = countComment;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
