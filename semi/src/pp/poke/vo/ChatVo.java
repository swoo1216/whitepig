package pp.poke.vo;


public class ChatVo {
	private int chatNum;
	private String id;
	private String nic;
	private int num;
	private String content;
	private String regdate;
	
	public ChatVo() {}

	public ChatVo(int chatNum, String id, String nic, int num, String content, String regdate) {
		super();
		this.chatNum = chatNum;
		this.id = id;
		this.nic = nic;
		this.num = num;
		this.content = content;
		this.regdate = regdate;
	}

	public int getChatNum() {
		return chatNum;
	}

	public void setChatNum(int chatNum) {
		this.chatNum = chatNum;
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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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


	