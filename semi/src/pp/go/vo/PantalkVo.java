package pp.go.vo;

import java.sql.Date;

public class PantalkVo {
	private int panNum;
	private String sender;
	private String receiver;
	private String content;
	private Date sendDate;
	private int sendOk;

	public PantalkVo() {
	}

	public PantalkVo(int panNum, String sender, String receiver, String content, Date sendDate, int sendOk) {
		this.panNum = panNum;
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.sendDate = sendDate;
		this.sendOk = sendOk;
	}

	public int getPanNum() {
		return panNum;
	}

	public void setPanNum(int panNum) {
		this.panNum = panNum;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public int getSendOk() {
		return sendOk;
	}

	public void setSendOk(int sendOk) {
		this.sendOk = sendOk;
	}

}
