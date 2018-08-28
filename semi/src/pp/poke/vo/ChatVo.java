package pp.poke.vo;


public class ChatVo {
	private int chatNum;
	private String id;
	private String content;
	private String regdate;
	
	public ChatVo() {}


	public ChatVo(int chatNum, String id, String content, String regdate) {
		super();
		this.chatNum = chatNum;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
	}


	public int getchatNum() {
		return chatNum;
	}


	public void setchatNum(int chatNum) {
		this.chatNum = chatNum;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
