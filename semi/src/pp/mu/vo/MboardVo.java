package pp.mu.vo;

public class MboardVo {
	private int mnum;
	private String title;
	private String content;
	private int reply;
	private int recomm;
	private int hit;
	private String id;
	
	public MboardVo() {}
	public MboardVo(int mnum, String title, String content, int reply, int recomm, int hit, String id, String path,
			String regdate) {
		super();
		this.mnum = mnum;
		this.title = title;
		this.content = content;
		this.reply = reply;
		this.recomm = recomm;
		this.hit = hit;
		this.id = id;
		this.path = path;
		this.regdate = regdate;
	}
	private String path;
	private String regdate;

	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
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
	public int getReply() {
		return reply;
	}
	public void setReply(int reply) {
		this.reply = reply;
	}
	public int getRecomm() {
		return recomm;
	}
	public void setRecomm(int recomm) {
		this.recomm = recomm;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}